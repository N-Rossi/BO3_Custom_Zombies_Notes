// Functions

// All BO3 scripting functions can be found in
// bo3 root/docs_modtools/bo3_scriptapifunctions.html

// To call in main put: 	thread printToScreen("Nick");
function printToScreen(name) {
	// Wait until game has loaded
	level flag::wait_till("initial_blackscreen_passed");
	while(1) {
		IPrintLn("Hi "+name+". This will display on the screen for 2 seconds");
		wait 2;
		IPrintLn("This will display on the screen again");
		wait 2;
	}
}

// Print credits to the screen
// thread credit();
function credit() {
	level flag::wait_till("initial_blackscreen_passed");
	IPrintLnBold("Scripted by NRNJ");
	wait 2;
}

// for zombies to walk on the moving object it must be on grid 4
//  or lower or have a 45 or less degree angle on edges
function movingObject() {
	level flag::wait_till("initial_blackscreen_passed");
	// make sure DYNAMICPATH in radiant item is true
	// make sure moving_platform_enabled is true also if moving
	// Dont need these as true if it is out of reach of player
	platform = GetEnt("platform", "targetname");
	spinner = GetEnt("spinner", "targetname");
	IPrintLnBold("Move started");

	spinner RotateYaw(360, 8);
	wait 8;

	// while(1) will run forever 
	// for(;;) also runs forever
	for(i=0; i<3; i++) {
	platform MoveY(-128, 2);
	wait 2;
	platform MoveX(128, 2);
	wait 2;
	platform MoveY(128, 2);
	wait 2;
	platform MoveX(-128, 2);
	wait 2;
	}
	IPrintLnBold("Movement Complete, time to spin");
	while(1) {
		spinner RotateYaw(360, 4);
		wait 4;
	}
}