::gvCharSelMode <- 0
::gvCharSelArray <- []

::startCharSel <- function(mode) {
	gvCharSelMode = mode

	gvCharSelArray.clear()

	//Generate character list
	switch(gvCharSelMode) {
		case 0:
		case 1:
			foreach(key, i in sprPrey) {
				gvCharSelArray.push(key)
			}
			break
		case 2:
			foreach(key, i in sprPred) {
				gvCharSelArray.push(key)
			}
			break
	}

	//Set cursor to character
	switch(gvCharSelMode) {
		case 0:
			for(local i = 0; i < gvCharSelArray.len(); i++) {
				if(gvCharSelArray[i] == config.prey0) {
					cursor = i
					break
				}
			}
			break
		case 1:
			for(local i = 0; i < gvCharSelArray.len(); i++) {
				if(gvCharSelArray[i] == config.prey1) {
					cursor = i
					break
				}
			}
			break
		case 2:
			for(local i = 0; i < gvCharSelArray.len(); i++) {
				if(gvCharSelArray[i] == config.pred) {
					cursor = i
					break
				}
			}
			break
	}

	gvCharSelArray.sort()
	gm = gmCharSel
}

::gmCharSel <- function() {
	drawBackground()

	switch(gvCharSelMode) {
		case 0:
		case 1:
			if(sprPrey.rawin(gvCharSelArray[cursor])) {
				drawSprite(sprPrey[gvCharSelArray[cursor]].fly, getFrames() / 6, screenW() / 2, screenH() / 2)
				drawText(font, (screenW() / 2) - (gvCharSelArray[cursor].len() * 4), 32, gvCharSelArray[cursor])
			}
			break
		case 2:
			if(sprPred.rawin(gvCharSelArray[cursor])) {
				drawSprite(sprPred[gvCharSelArray[cursor]].head, getFrames() / 6, screenW() / 2, screenH() / 2)
				drawSprite(sprPred[gvCharSelArray[cursor]].body, getFrames() / 6, screenW() / 2, screenH() / 2)
				drawSprite(sprPred[gvCharSelArray[cursor]].wing, getFrames() / 6, screenW() / 2, screenH() / 2)
				drawText(font, (screenW() / 2) - (gvCharSelArray[cursor].len() * 4), 32, gvCharSelArray[cursor])
			}
			break
	}

	if(keyPress(k_left)) cursor--
	if(keyPress(k_right)) cursor++

	if(cursor < 0) cursor = gvCharSelArray.len() - 1
	if(cursor > gvCharSelArray.len() - 1) cursor = 0

	if(keyPress(k_enter) || keyPress(k_space)) {
		switch(gvCharSelMode) {
			case 0:
				config.prey0 = gvCharSelArray[cursor]
				break
			case 1:
				config.prey1 = gvCharSelArray[cursor]
				break
			case 2:
				config.pred = gvCharSelArray[cursor]
				break
		}

		gm = gmMain
	}

	if(keyPress(k_escape)) gm = gmMain
}