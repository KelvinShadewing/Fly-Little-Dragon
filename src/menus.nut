///////////
// MENUS //
///////////

::menu = [];
::cursor = 0;
::textMenu <- (){
	//Draw options
	for(local i = 0; i < menu.len(); i++){
		//if(cursor == i) drawText(200, 238 - (menu.len() * 9) + (i * 9), "=> " + menu[i][0] + " <=", font, 0xF8F8F8, ha_center, va_bottom);
		//else drawText(200, 238 - (menu.len() * 9) + (i * 9), menu[i][0], font, 0xF8F8F8, ha_center, va_bottom);
	};

	//Keyboard input
	if(keyPress(k_down)){
		cursor++;
		if(cursor >= menu.len()) cursor = 0;
	};

	if(keyPress(k_up)){
		cursor--;
		if(cursor < 0) cursor = menu.len() - 1;
	};

	if(keyPress(k_space) || keyPress(k_enter)){
		menu[cursor][1]();
	};
};

::meMain = [
	["Singleplayer", function(){ gvPlayers = 1; gm = gmPlay; }],
	["Multiplayer", function(){ gvPlayers = 2; gm = gmPlay; }],
	["Options", function(){ gvPlayers = 1; gm = gmPlay(); }],
	["Quit", function(){ gvQuit = 1; }]
];