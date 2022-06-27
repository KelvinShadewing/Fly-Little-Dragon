::main <- function() {
	//Set up the window
	setFPS(60)
	setResolution(424, 240)
	setWindowTitle("Fly, Little Dragon!")
	gm = gmMain
	menu = meMain
	gvQuit = 0

	if(fileExists("config.json")) config = mergeTable(config, jsonRead(fileRead("config.json")))

	//Start the music
	//playMusic(music, -1)

	//Main game loop
	while(!gvQuit) {
		if(getQuit()) break

		gm()
		drawDebug()

		update()
	}
}
