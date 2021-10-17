///////////
// BIRDS //
///////////

::Alert <- class extends Actor {
	timer = 0
	visible = 1

	function run() {
		switch(timer) {
			case 0:
				visible = 1
				break

			case 10:
				visible = 0
				break

			case 20:
				visible = 1
				break

			case 30:
				visible = 0
				break

			case 40:
				visible = 1
				break

			case 50:
				visible = 0
				break

			case 60:
				newActor(Bird, x, y)
				deleteActor(id)
				break
		}

		timer++
		if(visible) {
			//Draw sprite
		}
	}
}

::Bird <- class extends Actor {
	species = 0

	constructor(_x, _y, _arr = null) {
		base.constructor(_x, _y)

		species = randInt(3)
	}
}
