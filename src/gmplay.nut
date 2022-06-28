::cerealTimer <- 30
::birdTimer <- 300
::birdY <- 10 + randInt(220)

::gmPlay <- function() {
	drawBackground()

	if(cerealTimer > 0) cerealTimer--
	else {
		newActor(Cereal, 432, randInt(240))
		cerealTimer = 60 + randInt(30)
	}

	if(birdTimer > 0) {
		if(birdTimer <= 60 && (birdTimer / 5) % 2 == 0) drawSprite(sprWarning, 0, 408, birdY)
		birdTimer--
	}
	else {
		local birdType = randInt(2)
		switch(birdType) {
			case 0:
				newActor(Robin, 432, birdY)
				break
			case 1:
				newActor(Bluejay, 432, birdY)
				break
		}
		birdY = 10 + randInt(220)
		birdTimer = 30 + randInt(300)
	}

	if(gvDifficulty < 4) gvDifficulty += 0.01 / 60.0

	runActors()

	//Draw stamina
	local p = findActor("Prey0")
	if(p != -1) {
		drawText(font, 8, 8, "P1 Stamina: " + (ceil(actor[p].energy)).tostring())
	} else drawText(font, 8, 8, "P1 Stamina: " + (0).tostring())

	if(gvPlayers == 2) {
		p = findActor("Prey1")
		if(p != -1) {
			drawText(font, 8, 220, "P2 Stamina: " + (ceil(actor[p].energy)).tostring())
		} else drawText(font, 8, 220, "P2 Stamina: " + (0).tostring())
	}

	//Quit
	if(keyPress(k_escape)) endPlay()
}

::startPlay <- function(playmode) {
	switch(playmode) {
		case 0:
			gvPlayers = 1
			gvDual = 0
			newActor(Prey0, 200, 120)
			newActor(Predator, 32, 120)
			break

		case 1:
			gvPlayers = 2
			gvDual = 0
			newActor(Prey0, 200, 100)
			newActor(Prey1, 200, 140)
			newActor(Predator, 32, 120)
			break

		case 2:
			gvPlayers = 2
			gvDual = 1
			newActor(Prey0, 200, 100)
			newActor(Prey1, 200, 140)
			newActor(Predator, 32, 120)
			break
	}

	gvScore0 = 0
	gvScore1 = 0

	gm = gmPlay
}

::endPlay <- function() {
	actor = {}
	gm = gmMain
}