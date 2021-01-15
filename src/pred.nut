//////////////
// PREDATOR //
//////////////

const predIdle = 0;
const predBite = 1;
const predGulp = 2;
const predMiss = 3;

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
};

::Predator <- class extends Actor{
	//Sprite parts
	head = 0;
	body = 0;
	wing = 0;
	idle = 0;
	bite = 0;
	miss = 0;
	gulp = 0;
	anim = [];

	didcatch = false;

	//Frame numbers
	fHead = 0;
	fBody = 0;
	fWing = 0;

	xspeed = 0;
	yspeed = 0;

	state = predIdle;

	constructor(_x, _y){
		base.constructor(_x, _y);
		body = sprPred[config.pred].body;
		head = sprPred[config.pred].head;
		wing = sprPred[config.pred].wing;
		idle = sprPred[config.pred].anim.idle;
		bite = sprPred[config.pred].anim.bite;
		miss = sprPred[config.pred].anim.miss;
		gulp = sprPred[config.pred].anim.gulp;

		anim = idle;
	};

	function run(){
		base.run();

		//Movement and bounds
		x += xspeed;
		y += yspeed;

		//Find target
		local target = -1;
		foreach(i in actor)
		{	
			if(typeof i == "Prey0" || typeof i == "Prey1")
			{ //See if any players exist
				if(target == -1)
				{ //If a target was not already found
					target = i.id;
				}
				else
				{
					if(i.x < actor[target].x)
					{ //If the other player is closer
						target = i.id; //Change target to closer player
					};
				};
			};
		}; //End foreach

		//If no player was found, search for birds
		if(target == -1) foreach(i in actor)
		{
			if(typeof i == "Bird")
			{
				target = i.id;
				break;
			};
		};

		//Move after target
		if(target != -1)
		{
			if(actor[target].y > y && yspeed < 2) yspeed += 0.5;
			if(actor[target].y < y && yspeed > -2) yspeed -= 0.5;
			if(actor[target].x < x && xspeed > -2) xspeed -= 0.2;
			if(actor[target].x > x && xspeed < 0.05); xspeed += 0.05;
		};

		//Limits
		if(xspeed > 0.05) xspeed = 0.05;
		if(xspeed < -2) xspeed = -2;
		if(y > 240)
		{
			y = 240;
			yspeed = 0;
		};

		if(y < 0)
		{
			y = 0;
			yspeed = 0;
		};
		if(x < 0)
		{
			x = 0;
			xspeed = 0;
		};

		//Draw
		fBody += 0.5;
		fHead += 0.5;
		if(fHead > anim[1]) switch(anim)
		{
			case idle:
				fHead = idle[0];
				break;
			case gulp:
				fHead = idle[0];
				anim = idle;
				break;
		}
		drawSprite(body, fBody, x, y);
		drawSprite(head, fHead, x, y);
		if(debugMode)
		{
			setDrawColor(0xff0000ff);
			drawCircle(x, y, 8, false);
			if(target != -1) drawCircle(actor[target].x, actor[target].y, 32, false);
		}

	}; //End step()

}; //End Predator
