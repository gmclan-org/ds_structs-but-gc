function ds_map() constructor {
	// add to GC observed
	_dsid = ds_map_create();
	weak_map_gc_register(weak_ref_create(self), _dsid, ds_type_map);
	
	// to create use "varname = new ds_map();"
	// to destroy, use "delete varname;"
	
	// covers default functions
	//static get_id = function() {
	//	return _dsid;
	//}
	
	static add = function(key, val) {
		ds_map_add(_dsid, key, val);
		return self;
	}
	
	static set = function(key, val) {
		ds_map_set(_dsid, key, val);
		return self;
	}
	
	/// @desc return whether key was existing or not
	static replace = function(key, val) {
		return ds_map_replace(_dsid, key, val);
	}
	
	static remove = function(key) {
		ds_map_delete(_dsid, key);
		return self;
	}
	
	static clear = function() { ds_map_clear( _dsid ); return self; }
	
	static is_empty = function() { return ds_map_empty( _dsid ); }
	
	static count = function() { return ds_map_size( _dsid ); }
	
	static first = function() { return ds_map_find_first( _dsid ); }
	
	static last = function() { return ds_map_find_last( _dsid ); }
	
	static next = function(k) { return ds_map_find_next( _dsid, k ); }
	
	static prev = function(k) { return ds_map_find_previous( _dsid, k ); }
	
	static find = function(k) { return ds_map_find_value( _dsid, k ); }
	
	// GMS built-in
	static toString = function() {
		return string(_dsid);
	}
}