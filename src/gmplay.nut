::cerealTimer <- 30;

::gmPlay <- function()
{
	drawBackground();

	if(cerealTimer > 0) cerealTimer--;
	else
	{
		newActor(Cereal, 408, randInt(240));
		cerealTimer = 10 + randInt(10);
	};

	runActors();

	//Draw stamina
	local p = findActor("Prey0");
	if(p != -1)
	{
		drawText(font, 8, 8, config.prey0 + ": " + (round(actor[p].energy)).tostring());
	} else drawText(font, 8, 8, config.prey0 + ": " + (0).tostring());
	
	if(gvPlayers == 2)
	{
		p = findActor("Prey1");
		if(p != -1)
		{
			drawText(font, 8, 16, config.prey1 + ": " + (round(actor[p].energy)).tostring());
		} else drawText(font, 8, 16, config.prey1 + ": " + (0).tostring());
	}

	//Quit
	if(keyPress(k_escape)) endPlay();
}

::startPlay <- function(playmode)
{
	switch(playmode)
	{
		case 0:
			gvPlayers = 1;
			gvDual = 0;
			newActor(Prey0, 200, 120);
			newActor(Predator, 64, 120);
			break;
		case 1:
			gvPlayers = 2;
			gvDual = 0;
			newActor(Prey0, 200, 100);
			newActor(Prey1, 200, 140);
			newActor(Predator, 64, 120);
			break;
		case 2:
			gvPlayers = 2;
			gvDual = 1;
			newActor(Prey0, 200, 100);
			newActor(Prey1, 200, 140);
			newActor(Predator, 64, 120);
			break;
	};

	gvScore0 = 0;
	gvScore1 = 0;

	gm = gmPlay;
};

::endPlay <- function()
{
	deleteAllActors();
	gm = gmMain;
}