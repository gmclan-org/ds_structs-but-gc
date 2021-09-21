/// @description event


var _arr = [];
var _keys = ds_map_keys_to_array(global.__weak_ds_observer, _arr);
	
draw_text(200, 0, "Total refs " + string(array_length(_keys)) + ".");
for(var i = 0; i < array_length(_keys); i++) {
	var _alive = weak_ref_alive(global.__weak_ds_observer[? _keys[i] ][0]);
	draw_text(200, 20 + i * 30, "DS map is kept under key [" + string(_keys[i]) + "] and is " + (_alive ? "alive" : "dead"));
}
