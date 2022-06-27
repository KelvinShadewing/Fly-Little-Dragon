///////////
// MENUS //
///////////

::menu <- []
::menuLast <- []
::menuItemsPos <- [] //Positions of all menu items
::cursor <- 0
::cursorOffset <- 0
::cursorTimer <- 30
const menuMax = 8 //Maximum number of slots that can be shown on screen
const fontW = 8
const fontH = 14
const menuY = 40

::textMenu <- function(){
	//If no menu is loaded
	if(menu == []) return

	if(menu != menuLast) {
		cursor = 0
		cursorOffset = 0
	}
	menuLast = menu
	menuItemsPos = []

	//Draw options
	//The number
	if(menu.len() > menuMax) for(local i = cursorOffset; i < cursorOffset + menuMax; i++) {
		//Detect if menu item is disabled (has no function). Display it with gray font if so.
		local currFont = font
		if(cursor == i) currFont = font2
		if(menu[i].rawin("disabled")) { currFont = font2G }

		local textX = (screenW() / 2) - (menu[i].name().len() * 4)
		local textY = screenH() - menuY - (menuMax * fontH) + ((i - cursorOffset) * fontH)

		drawText(currFont, textX, textY, menu[i].name())
		menuItemsPos.append({index = i, x = textX, y = textY, len = menu[i].name().len() * fontW})

		//Draw scroll indicators
		if(cursorOffset > 0) for(local i = 0; i < 4; i++) drawSprite(font2, 103, (screenW() / 2 - 24) + (i * 12), screenH() - menuY - (fontH * (menuMax + 1)))
		if(cursorOffset < menu.len() - menuMax) for(local i = 0; i < 4; i++) drawSprite(font2, 98, (screenW() / 2 - 24) + (i * 12), screenH() - menuY)
	}
	else for(local i = 0; i < menu.len(); i++) {
		//Detect if menu item is disabled (has no function). Display it with gray font if so.
		local currFont = font
		if(cursor == i) currFont = font2
		if(menu[i].rawin("disabled")) { currFont = font2G }

		local textX = (screenW() / 2) - (menu[i].name().len() * 4)
		local textY = screenH() - menuY - (menu.len() * fontH) + (i * fontH)

		drawText(currFont, textX, textY, menu[i].name())
		menuItemsPos.append({index = i, x = textX, y = textY, len = menu[i].name().len() * fontW})
	}

	//Mouse cursor update + left click input check
	updateCursor()
	if(mouseRelease(0)) processCursorInput()

	//Keyboard input
	if(keyPress(k_down) || (keyDown(k_down) && cursorTimer <= 0)) {
		cursor++
		if(cursor >= cursorOffset + menuMax) cursorOffset++
		if(cursor >= menu.len()) {
			cursor = 0
			cursorOffset = 0
		}
		if(keyPress(k_down)) cursorTimer = 40
		else cursorTimer = 10
		playSound(sndMenuMove, 0)
	}

	if(keyPress(k_up) || (keyDown(k_up) && cursorTimer <= 0)) {
		cursor--
		if(cursor < cursorOffset) cursorOffset--
		if(cursor < 0) {
			cursor = menu.len() - 1
			if(menu.len() > menuMax) cursorOffset = menu.len() - menuMax
		}
		if(keyPress(k_up)) cursorTimer = 40
		else cursorTimer = 10
		playSound(sndMenuMove, 0)
	}

	if(keyDown(k_down) || keyDown(k_up)) cursorTimer--

	if(keyPress(k_space) || keyPress(k_enter)) {
		if(menu[cursor].rawin("disabled")) return;
		menu[cursor].func()
		playSound(sndMenuSelect, 0)
	}

	if(keyPress(k_escape)) {
		for(local i = 0; i < menu.len(); i++) {
				if(menu[i].rawin("back")) {
					menu[i]["back"]()
					break
				}
		}
	}

	if(mouseWheelY() < 0 && cursorOffset < menu.len() - menuMax) {
		cursorOffset++
		cursor++
	}
	if(mouseWheelY() > 0 && cursorOffset > 0) {
		cursorOffset--
		cursor--
	}
}

//Names are stored as functions because some need to change each time
//they're brought up again.
::meMain <- [
	{
		name = function(){ return "Singleplayer" },
		func = function(){ gvPlayers = 1; gvDual = 0; startPlay(0) }
	},
	{
		name = function(){ return "Multiplayer" },
		func = function(){ gvPlayers = 2; gvDual = 0; startPlay(1) }
	},
	{
		name = function(){ return "Options" },
		func = function(){ cursor = 0; menu = meOptions }
	},
	{
		name = function(){ return "Quit" },
		func = function(){ gvQuit = 1 }
	}
]

::meOptions <- [
	{
		name = function(){ return "Difficulty: " + strDifficulty[config.difficulty] },
		func = function(){ cursor = 0; menu = meDifficulty }
	},
	{
		name = function(){ return "Prey 1: " + config.prey0 },
		func = function(){}
	},
	{
		name = function(){ return "Prey 2: " + config.prey1 },
		func = function(){}
	},
	{
		name = function(){ return "Predator: " + config.pred },
		func = function(){}
	},
	{
		name = function(){ return "Back" },
		func = function(){ cursor = 0; menu = meMain }
	}
]

::meDifficulty <- [
	{
		name = function(){ return "Easy" },
		func = function(){ config.difficulty = 0; cursor = 0; menu = meOptions }
	},
	{
		name = function(){ return "Normal" },
		func = function(){ config.difficulty = 1; cursor = 0; menu = meOptions }
	},
	{
		name = function(){ return "Hard" },
		func = function(){ config.difficulty = 2; cursor = 0; menu = meOptions }
	}
]
