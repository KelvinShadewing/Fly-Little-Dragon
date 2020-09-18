::main <- function(){
	//Set up the window
	setFPS(30);
	setResolution(320, 240);
	setWindowTitle("Fly, Little Dragon!");
	gm = gmMain;
	menu = meMain;
	gvQuit = 0;

	//Start the music
	playMusic(music, -1);

	//Main game loop
	while(!gvQuit){
		if(keyPress(k_escape) || getQuit()) break;

		gm();
		drawDebug();

		update();
	};
};
