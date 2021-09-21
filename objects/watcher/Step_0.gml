/// @description collect garbage

	//gc_collect(); // this would force GMS GC to perform every frame
	weak_map_gc(); // check removed references
	
	/*
	further improvement - instead of every step, this could be called
	when irandom(50) == 1, or only when new element is created
	*/