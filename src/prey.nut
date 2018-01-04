/*===========*\
| PREY SOURCE |
\*===========*/

::Prey0 <- class extends Actor{
	xspd = 0;
	yspd = 0;
	mspd = 4;
	r = 16;
	colbuff = [];
	energy = 100;
	rings = 0;
	blink = 0;

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
		if(xspd < -mspd) xsod = -mspd;
		if(yspd > 0) yspd -= 0.5;
		if(yspd < 0) yspd += 0.5;
		if(yspd > mspd) yspd = mspd;
		if(yspd < -mspd) yspd = -mspd;

		//Screen limits
		if(x > 288){
				x = 288;
				xspd--;
		};
		if(x < 32){
				x = 32;
				xspd++;
		};
		if(y < 16){
						y = 16;
						yspd++;
		};
		if(y > 224){
						y = 224;
						yspd--;
		};
	};
};
