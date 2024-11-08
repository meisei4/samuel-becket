extends TileMapLayer

func _ready():
	var tile_set_source = tile_set.get_source(0)
	var map_width = 8
	var map_height = 8
	for y in range(map_height):
		for x in range(map_width):
			var random_tile_id = randi() % 13
			set_cell(Vector2i(x,y), 0, tile_set_source.get_tile_id(random_tile_id))
			print("Set tile at ", tile_set_source.get_tile_id(random_tile_id), " with tile ID ", random_tile_id)
