/*  
    Custom Pickup Script 
    By SharpGamers4You on youtube
    https://www.youtube.com/watch?v=UUD_2RzlIS8&list=PLFIuoBTza9JCg4pfJc-wELKI7Y-sa5QzQ&index=4
    https://forum.modme.co/wiki/threads/3026.html 
*/
/* CREDITS
Credits to:
    Sharpgamer4you: scripting function to pick up/place a model and prefabs.
    Jules: Helping to make a prefab for version 1 and scripting for the function to place the item
    Scary Branden: Helping with scripting to version 2 (waiting until power is on)
*/

/*
Version 1
is just picking up an item and place it somewhere.
Version 2
is Pick up an item but you need to turn on the power before you can pick it up!
If you go to the location to pick the item up it won't be there.
*/

/*
With that said let us install this script!

https://drive.google.com/file/d/1t0mFMlDZnkf7xBOTFZIo-2qx2V8Z7yFb/view?usp=sharing

Open it up and you'll see a BO3 Root
Folder.
Open that folder and drag the map_source
folder into your bo3 root.
*/


// Once thats done open mapname.GSC and find the line `zm_usermap::main();` and paste the following script under it:
//SG4Y Pickup/Place Model(s)
thread pickup_book();
thread pickup_easter_egg();

// Now at the very bottom of the file paste the following script:
//SG4Y & Jules Pickup/Place Model(s) Funsction V1
function pickup_book() {

wait(0.05);
trig = GetEnt("trig_up", "targetname");
mod = GetEnt("mod_up", "targetname");
level.mod_down = GetEnt("mod_down", "targetname");
level.trig_down = GetEnt("trig_down", "targetname");
level.trig_down setCursorHint("HINT_NOICON");
level.trig_down setHintString("Press [&&1] to place the book");
level.mod_down hide();
level.trig_down hide();

trig setCursorHint("HINT_NOICON");
trig setHintString("Press [&&1] to pickup the book!");

while(1) {

trig waittill("trigger", player);
mod delete();
trig delete();
thread place_book();

}

}

function place_book() {

wait(0.05);
level.trig_down show();

while(1) {

level.trig_down waittill("trigger", player);
level.mod_down show();
level.trig_down delete();

}

}

//SG4Y & Scary Brandon easter egg pickup V2
function pickup_easter_egg() {

    wait(0.05);
    trig = GetEnt("trig_stone_up", "targetname");
    mod = GetEnt("stone_mod_up", "targetname");
    trig hide();
    mod hide();
    level.stone_mod_down = GetEnt("stone_mod_down", "targetname");
    level.stone_trig_down = GetEnt("stone_trig_down", "targetname");
    level.stone_trig_down setCursorHint("HINT_NOICON");
    level.stone_trig_down setHintString("Press [&&1] to place the stone");
    level.stone_mod_down hide();
    level.stone_trig_down hide();
    level flag::wait_till( "power_on" );
    trig show();
    mod show();


    trig setCursorHint("HINT_NOICON");
    trig setHintString("Press [&&1] to pickup the stone!");

    while(1) {

    trig waittill("trigger", player);
    player playsound("zmb_craftable_pickup"); //change the zmb_craftable_pickup to a name of a sound you want.
    mod delete();
    trig delete();
    thread easter_egg_place();
    }
}

function easter_egg_place() {
    wait(0.05);
    level.stone_trig_down show();

    while(1) {
    level.stone_trig_down waittill("trigger", player);
    player playsound("zmb_craftable_pickup"); //change the zmb_craftable_pickup to a name of a sound you want.
    level.stone_mod_down show();
    level.stone_trig_down delete();
    }
}

/*
Now open radiant!

right-click and select misc then Prefab.
(or use Prefab browser by pressing B
then going into "misc
then "Prefab
go into the folder zm
then you should see a new folder called sg4y
open it up
and you'll see Version 1 and Version 2.)

Again version 1 is that the player can pick it up as usual.
version 2 is that the player needs to turn on the power first otherwise the trigger and model will not spawn.

Now choose what version you want and put it into your map.
You can stamp the prefab by right-clicking select prefab
then Stamp prefab
This will allow you to change the models.

place the models wherever you want.
*/