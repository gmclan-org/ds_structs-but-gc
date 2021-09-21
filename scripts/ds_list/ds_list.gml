function ds_list() constructor {
	// add to GC observed
	_dsid = ds_list_create();
	weak_map_gc_register(weak_ref_create(self), _dsid, ds_type_list);
	
	// to create use "varname = new ds_list();"
	// to destroy, use "delete varname;"
	
	// this adds at end
	static add = function(val) {
		ds_list_add(_dsid, val);
		return self;
	}
	
	// this replaces (or fill gaps until pos with 0)
	static set = function(pos, val) {
		ds_list_set(_dsid, pos, val);
		return self;
	}
	
	// this can add in middle
	static insert = function(pos, val) {
		ds_list_insert(_dsid, pos, val);
		return self;
	}
	
	// this replaces, but not creates not-existing
	static replace = function(pos, val) {
		ds_list_replace(_dsid, pos, val);
		return self;
	}
	
	static remove = function(pos, val) {
		ds_list_delete(_dsid, pos);
		return self;
	}
	
	static index = function(val) {
		return ds_list_find_index(_dsid, val);
	}
	
	static value = function(index) {
		return ds_list_find_value(_dsid, index);
	}
	
	static sort = function(asc) { ds_list_sort(_dsid, asc); return self;}
	
	static shuffle = function() { ds_list_shuffle(_dsid); return self;}
	
	static count = function() { ds_list_size(_dsid); }
	
	static clear = function() { ds_list_clear(_dsid); }
	
	static is_empty = function() { ds_list_empty(_dsid); }
	
}