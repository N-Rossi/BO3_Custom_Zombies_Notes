/* 
	Custom Pickup Script 
	By SharpGamers4You on youtube
	https://www.youtube.com/watch?v=GvWVwi5Am0Y&list=PLFIuoBTza9JCg4pfJc-wELKI7Y-sa5QzQ&index=3
*/


// 1.  In mapname.gsc go to the line `level.pathdist_type = PATHDIST_ORIGINAL;` and paste the following right above it:
level thread item_pickup();

// 2. Add the following script to the bottom of the file:
function item_pickup_init() {
	thread item_pickup();
}

function item_pickup() {
	item_model = GetEnt("sg4y_item_pickup", "targetname");
	item_pickup_trig = GetEnt("sg4y_item_trig", "targetname");

	item_pickup_trig SetHintString("Press and hold &&1 to pickup item"); // Set hint string text here
	item_pickup_trig SetCursorHint("HINT_NOICON");

	item_pickup_trig waittill("trigger", player);
	item_model delete();
	item_pickup_trig delete();

	// you can place more scripts if there is more functions you want to happen
}

/*  In Radiant
- Make a script_model and give it the following targetnameL: sg4y_item_pickup

- Create a trigger_use (or trigger_radius) and give it the following targetname: sg4y_item_trig

- Now make sure the trigger covers up the model and compile.
*/

/* Pickup Place Script */
function item_pickup_place() {
	isPickedup = false;
	item_model = GetEnt("pickup_ball", "targetname");
	item_pickup_trig = GetEnt("pickup_ball_trig", "targetname");
	item_place_trig = GetEnt("place_ball_trig", "targetname");
	item_place_trig Hide();
	item_place_model = GetEnt("place_ball", "targetname");
	item_place_model Hide();
	wait 1;

	item_pickup_trig SetHintString("Press and hold &&1 to pickup ball"); // Set hint string text here
	item_pickup_trig SetCursorHint("HINT_NOICON");

	item_pickup_trig waittill("trigger", player);
	item_model delete();
	item_pickup_trig delete();
	isPickedup = true;
	item_place_trig Show();
	item_place_trig SetHintString("Press and hold &&1 to place ball");
	IPrintLnBold("Ball Picked Up");
	wait 1;

	item_place_trig waittill("trigger", player);
	item_place_model Show();
	item_place_trig delete();
	// you can place more scripts if there is more functions you want to happen
}