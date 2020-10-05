::cerealTimer <- 30;

::gmPlay <- function(){
	drawBackground();

	if(cerealTimer > 0) cerealTimer--;
	else{
		newActor(Cereal, 320, randInt(240));
		cerealTimer = 10 + randInt(10);
	};

	runActors();

	//Draw stamina
	local p = findActor("Prey0");
	if(p != -1){
		drawText(font, 8, 8, (round(actor[p].energy)).tostring());
	} else drawText(font, 8, 8, (0).tostring());
};

::startPlay <- function(playmode){
	switch(playmode){
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
			break;
		case 2:
			gvPlayers = 2;
			gvDual = 1;
			newActor(Prey0, 200, 100);
			newActor(Prey1, 200, 140);
			break;
	};

	gvScore0 = 0;
	gvScore1 = 0;

	gm = gmPlay;
};
