/// @desc Notifies the player that stats have changed
/// @arg character The stat block to spawn it on
/// @arg stat Which stat you got
var block = argument0;
var stat = argument1;


with (instance_create_layer(block.x-10,block.y,"Stats",objGotStats)) {sprite_index = stat;}