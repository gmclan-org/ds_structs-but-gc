global.__weak_ds_observer_cnt = 0;
global.__weak_ds_observer = ds_map_create();

function weak_map_gc() {
	var _arr = [];
	var _keys = ds_map_keys_to_array(global.__weak_ds_observer, _arr);
	
	for(var i = 0; i < array_length(_keys); i++) {
		if ( !weak_ref_alive(global.__weak_ds_observer[? _keys[i] ][0]) ) {
			ds_map_destroy(global.__weak_ds_observer[? _keys[i] ][1]);
			ds_map_delete(global.__weak_ds_observer, _keys[i]);
		}
	}
}

function ds_map() constructor {
	// add to GC observed
	_dsid = ds_map_create();
	global.__weak_ds_observer[? global.__weak_ds_observer_cnt ++ ] = [weak_ref_create(self), _dsid];
	
	// covers default functions
	add = function(key, val) {
		ds_map_add(_dsid, key, val);
	}
	
	set = function(key, val) {
		return ds_map_set(_dsid, key, val);
	}
	
	/// @desc return whether key was existing or not
	replace = function(key, val) {
		return ds_map_replace(_dsid, key, val);
	}
	
	remove = function(key) {
		ds_map_delete(_dsid, key);
	}
	
	clear = function() { ds_map_clear( _dsid ); }
	
	empty = function() { return ds_map_empty( _dsid ); }
	
	size = function() { return ds_map_size( _dsid ); }
	
	toString = function() {
		return json_encode(_dsid);
	}
}
