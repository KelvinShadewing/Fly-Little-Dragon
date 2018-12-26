/*===========*\
| PREY SOURCE |
\*===========*/

::Cereal <- class extends Actor{
	color = 0;
	frame = 0;

	constructor(_x, _y){
		base.constructor(_x, _y);
		color = randInt(10) * 4
	};

	function step(){
		x -= 0;
		if(x < -8) deleteActor(id);
		frame += 0.25;
		if(frame >=4) frame -= 4;
		drawSprite(sprCereal, floor(frame) + color, x, y);
		x -= 6;
	};

	function _typeof(){ return "Cereal"; };
};

::Prey0 <- class extends Actor{
	frame = 0;
	xspd = 0;
	yspd = 0;
	mspd = 4;
	r = 16;
	colbuff = [];
	energy = 100;
	rings = 0;
	blink = 0;
	invis = false;
	rush = 0;

	constructor(_x, _y){
		base.constructor(_x, _y);
	};

	function step(){
		//Acceleration
		if(keyDown(k_left)) xspd--;
		if(keyDown(k_right)) xspd++;
		if(keyDown(k_up)) yspd--;
		if(keyDown(k_down)) yspd++;

		//Friction
		if(xspd > -1) xspd -= 0.5;
		if(xspd < -1) xspd += 0.5;
		if(xspd > mspd) xspd = mspd;
		if(xspd < -mspd) xspd = -mspd;
		if(yspd > 0) yspd -= 0.5;
		if(yspd < 0) yspd += 0.5;
		if(yspd > mspd) yspd = mspd;
		if(yspd < -mspd) yspd = -mspd;

		//Move
		x += xspd;
		y += yspd;

		//Screen limits
		if(x > 388){
			x = 388;
			xspd--;
		};
		if(x < 16){
			x = 16;
			xspd++;
		};
		if(y < 8){
			y = 8;
			yspd++;
		};
		if(y > 232){
			y = 232;
			yspd--;
		};

		//Draw
		frame += 0.5;
		invis = !invis;
		if(blink == 0 || !invis) drawSprite(sprPrey[config.prey0].fly, frame, x, y);

		//Collision
		foreach(i in actor){
			if(typeof i == "Cereal"){
				if(i.x <= x + 20 && i.x >= x - 20 && i.y >= y - 12 && i.y <= y + 12){
					energy += 10;
					if(energy > 100) energy = 100;
					deleteActor(i.id);
				};
			};

			if(typeof i == "Bird" && blink == 0 && rush == 0){
				xspd = -4;
				blink = 60;
			};
		};
	};

  function _typeof(){ return "Prey0"; };
};
