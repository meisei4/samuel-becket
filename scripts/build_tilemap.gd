extends TileMapLayer

# TODO this is where you need to start learning how godot uses inheretance. 
# start focusing on how the Scene implicitly runs these scripts when you use them as Resources

func _ready():
	var tile_set_source = self.tile_set.get_source(0)
	var map_width = 20
	var map_height = 20
	for y in range(map_height):
		for x in range(map_width):
			var random_tile_id = randi() % 13
			self.set_cell(Vector2i(x, y), 0, tile_set_source.get_tile_id(random_tile_id))
			# print("Set tile at ", tile_set_source.get_tile_id(random_tile_id), " with tile ID ", random_tile_id)
