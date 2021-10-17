/*===========*\
| PREY SOURCE |
\*===========*/

::Cereal <- class extends Actor {
	color = 0
	frame = 0

	constructor(_x, _y, _arr = null) {
		base.constructor(_x, _y)
		color = randInt(10) * 4
	}

	function run() {
		if(x < -8) deleteActor(id)
		frame += 0.1
		if(frame >=4) frame -= 4
		drawSprite(sprCereal, floor(frame) + color, x, y)

		if(debugMode) {
			setDrawColor(0xff0000ff)
			drawCircle(x, y, 6, false)
		}

		x -= 1.5
	}

	function _typeof(){ return "Cereal" }
}

::Prey <- class extends Actor {
	xspd = 0
	yspd = 0
	mspd = 1.5
	r = 16
	colbuff = []
	energy = 100
	rings = 0
	blink = 0
	invis = false
	rush = 0
	friction = 0.02
	con = 0

	constructor(_x, _y, _arr = null) {
		base.constructor(_x, _y)
	}

	function run() {
		//Stamina loss
		if(energy > 0) energy -= 0.05
		if(energy <= 0) mspd = 0.8
		else mspd = 1.5

		//Acceleration
		if(keyDown(con.left)) xspd -= 0.1
		if(keyDown(con.right) && energy > 0) xspd += 0.1
		if(keyDown(con.up)) yspd -= 0.1
		if(keyDown(con.down)) yspd += 0.1

		//Friction
		if(xspd > -0.1) xspd -= friction
		if(xspd < -0.1) xspd += friction
		if(xspd > mspd) xspd = mspd
		if(xspd < -mspd - 0.8) xspd = -mspd - 0.8
		if(yspd > 0) yspd -= friction
		if(yspd < 0) yspd += friction
		if(yspd > mspd) yspd = mspd
		if(yspd < -mspd) yspd = -mspd
		if(abs(yspd) < friction) yspd = 0

		//Move
		x += xspd
		y += yspd

		//Screen limits
		if(x > 388) {
			x = 388
			xspd--
		}

		if(x < 16) {
			x = 16
			xspd++
		}

		if(y < 8) {
			y = 8
			yspd++
		}

		if(y > 232) {
			y = 232
			yspd--
		}

		//Collision
		foreach(i in actor) {
			if(typeof i == "Cereal") {
				if(i.x <= x + 24 && i.x >= x - 24 && i.y >= y - 14 && i.y <= y + 14) {
					energy += 8
					if(energy > 100) energy = 100
					deleteActor(i.id)
				}
			}

			if(typeof i == "Bird" && blink == 0 && rush == 0) {
				xspd = -4
				blink = 60
			}
		}
	}

	function _typeof(){ return "Prey" }
};

::Prey0 <- class extends Prey {
	constructor(_x, _y, _arr = null) {
		base.constructor(_x, _y)
		con = config.con0
	}

	function run() {
		base.run()

		//Draw
		invis = !invis
		if(blink == 0 || !invis) drawSprite(sprPrey[config.prey0].fly, getFrames() / 8, x, y)
		if(debugMode) {
			setDrawColor(0xff0000ff)
			drawRect(x - 12, y - 4, 28, 16, false)
		}
	}

	function _typeof(){ return "Prey0" }
}

::Prey1 <- class extends Prey {
	constructor(_x, _y, _arr = null) {
		base.constructor(_x, _y)
		con = config.con1
	}

	function run() {
		base.run()

		//Draw
		frame += 0.5
		invis = !invis
		if(blink == 0 || !invis) drawSprite(sprPrey[config.prey1].fly, getFrames() / 8, x, y)

		if(debugMode) {
			setDrawColor(0xff0000ff)
			drawRect(x - 12, y - 4, 28, 16, false)
		}
	}

	function _typeof(){ return "Prey1" }
}