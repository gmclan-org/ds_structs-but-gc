global.__weak_ds_observer_cnt = 0;
global.__weak_ds_observer = ds_map_create();

// call this, to remove no more referenced ds structures
function weak_map_gc() {
	var _arr = [];
	var _keys = ds_map_keys_to_array(global.__weak_ds_observer, _arr);
	
	for(var i = 0; i < array_length(_keys); i++) {
		if ( !weak_ref_alive(global.__weak_ds_observer[? _keys[i] ][0]) ) {
			// destroy DS
			switch(global.__weak_ds_observer[? _keys[i] ][2]) {
				case ds_type_map:
					ds_map_destroy(global.__weak_ds_observer[? _keys[i] ][1]);
					break;
					
				case ds_type_list:
					ds_list_destroy(global.__weak_ds_observer[? _keys[i] ][1]);
					break;
					
				default:
					throw("Unsupported data type");
			}
			
			// destroy whole row with weak reference data too
			ds_map_delete(global.__weak_ds_observer, _keys[i]);
		}
	}
}

/// @param ref weak_ref_create(self)
/// @param id id of ds_structure
/// @param type ds_type_map|ds_type_list etc.
function weak_map_gc_register(ref, id, type) {
	global.__weak_ds_observer[? global.__weak_ds_observer_cnt++ ] = [ref, id, type];
}
