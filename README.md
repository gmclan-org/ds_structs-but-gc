# ds_structs-but-gc
DS Structs but Garbage Collected (for GMS/GML 2.3+)

This repository contains WIP (Work in progress) version of GameMaker Studio 2.3+ ds_xxx structures, which can be garbage collected.

General naming convention is to use just common ds_xxx name for each structure (ds_map, ds_list, ds_whatever) for each type.

As for now, only examples of ds_map() and ds_lists() are made.

Example code:
```
var map = ds_map(); // returns special struct
map.add("foo", "bar");

/// game runs, room changes, objects gets destroyed, struct gets destroyed too if it's not referenced anymore
weak_map_gc(); // collect garbage, ds_map which was in variable "map" is now freed, without ds_map_destroy()!
```
Intead of being destroyed at room end on when instance is removed, ds-structs can be also removed this way:
```
delete map;
```


---

How it works?

`global.__weak_ds_observer` (whis is a ds_map) keeps data about every created structure, as 3 row array (first is weak ref data, second is struct id, third is struct type).

When calling `weak_map_gc()` it iterates over existing weak references, and when finding an inactive one, thanks to having struct id saved in array too (as this is integer, not reference), it removes now data structure. Then, this key with weak ref data is removed from array too (to keep `global.__weak_ds_observer` as small as possible).

This library might be slow when creating thousands of data structures per second.

Feel free to report improvements.
