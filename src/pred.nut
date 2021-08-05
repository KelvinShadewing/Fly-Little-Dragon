//////////////
// PREDATOR //
//////////////

const predIdle = 0
const predBite = 1
const predGulp = 2
const predMiss = 3

//TODO
//Add list of frame numbers
//for predator head states.
//Wings need only increment.

::headFrames <- {
	comito = {
		idle = [0, 0],
		bite = [0, 0],
		gulp = [0, 0],
		miss = [0, 0]
	}
}

::Predator <- class extends Actor {
	//Sprite parts
	head = 0
	body = 0
	wing = 0
	idle = 0
	bite = 0
	miss = 0
	gulp = 0
	anim = []

	didcatch = false

	//Frame numbers
	fHead = 0.0

	xspeed = 0
	yspeed = 0

	state = predIdle

	constructor(_x, _y) {
		base.constructor(_x, _y)
		body = sprPred[config.pred].body
		head = sprPred[config.pred].head
		wing = sprPred[config.pred].wing
		idle = sprPred[config.pred].anim.idle
		bite = sprPred[config.pred].anim.bite
		miss = sprPred[config.pred].anim.miss
		gulp = sprPred[config.pred].anim.gulp

		anim = idle
	};

	function run(){
		base.run()

		//Movement and bounds
		//Find target
		local target = -1;
		foreach(i in actor) {
			if(typeof i == "Prey0" || typeof i == "Prey1") { //See if any players exist
				if(target == -1) { //If a target was not already found
					target = i
				} else {
					if(i.x < actor[target].x) { //If the other player is closer
						target = i //Change target to closer player
					}
				}
			}
		} //End foreach

		//If no player was found, search for birds
		if(target == -1) foreach(i in actor)
		{
			if(typeof i == "Bird")
			{
				target = i;
				break;
			}
		}

		//Move after target
		if(target != -1)
		{
			if(target.y > y + 0.2 && yspeed < 1.5) yspeed += 0.06
			if(target.y < y - 0.2 && yspeed > -1.5) yspeed -= 0.06
			if(target.x < x && xspeed > -2) xspeed -= 0.05
			xspeed += 0.005

			if(xspeed > 0.05 && x < target.x && distance2(x, y, target.x, target.y) > 64) xspeed -= 0.05

			if(distance2(x - 8, y, target.x, target.y) <= 10 && anim == idle) {
				anim = bite
				fHead = anim[0]
				target.xspd = -1
			}
		} else {
			if(xspeed < 1 && x < 200) xspeed += 0.02
			xspeed -= 0.01
		}

		//Limits
		if(xspeed < -1) xspeed = -1
		if(y > 240) {
			y = 240
			yspeed = 0
		}

		if(y < 0) {
			y = 0
			yspeed = 0
		}

		if(x < 0) {
			x = 0
			xspeed = 0
		}

		if(abs(yspeed) < 0.05) yspeed = 0
		if(yspeed > 0) yspeed -= 0.02
		if(yspeed < 0) yspeed += 0.02

		x += xspeed
		y += yspeed

		//Draw
		fHead += 0.25

		if(fHead > anim[1]) switch(anim) {
			case idle:
				fHead = wrap(fHead, anim[0], anim[1])
				break

			case bite:
				if(distance2(x - 8, y, target.x, target.y) < 16) {
					anim = gulp
					deleteActor(target.id)
				}
				else anim = miss
				fHead = anim[0]
				break

			case miss:
			case gulp:
				fHead = idle[0]
				anim = idle
				break
		}

		drawSprite(body, getFrames() / 4, floor(x), floor(y))
		drawSprite(wing, getFrames() / 12, floor(x), floor(y))
		drawSprite(head, fHead, floor(x), floor(y))

		if(debugMode) {
			setDrawColor(0xff0000ff)
			drawCircle(x, y, 8, false)
			if(target != -1) drawCircle(actor[target].x, actor[target].y, 32, false)
		}
	} //End step()

} //End Predator
