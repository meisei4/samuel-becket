# res://scripts/build_tilemap.gd
extends SceneTree

func _initialize():
    randomize()  # Initialize the random number generator for varied tile placement

    # Define paths for the TileSet and the TileMap scene
    const TILESET_PATH = "res://tilesets/tileset.tres"
    const TILEMAP_SCENE_PATH = "res://scenes/BackgroundTileMap.tscn"

    # Load the existing TileSet
    var tileset = load(TILESET_PATH) as TileSet
    if not tileset:
        push_error("TileSet not found at: " + TILESET_PATH)
        return
    else:
        print("TileSet loaded successfully from: ", TILESET_PATH)

    # Retrieve all tile IDs from the TileSet source index 1, including alternatives
    var tile_ids = []
    var source_index = 1
    var source = tileset.get_source(source_index)
    if not source:
        push_error("TileSetSource at index ", source_index, " not found.")
        return
    else:
        print("TileSetSource at index ", source_index, " loaded.")

    var tiles_count = source.get_tiles_count()
    print("Source ", source_index, " has ", tiles_count, " tiles.")

    # Iterate over each tile in the source and collect its ID
    for tile_index in range(tiles_count):
        var tile_id = source.get_tile_id(tile_index)
        print("Added tile ID ", tile_id, " from tile index ", tile_index)
        # TODO: This is absolutely insane:
        # https://docs.godotengine.org/en/stable/classes/class_tilesetatlassource.html#class-tilesetatlassource-method-create-alternative-tile
        source.create_tile(tile_id, Vector2i(64, 64))
        var alt_id = source.create_alternative_tile(tile_id, -1)
        tile_ids.append(alt_id)
        print("Added alt tile ID ", alt_id)


    # Create a new TileMap node
    var tile_map = TileMap.new()
    tile_map.tile_set = tileset

    # Define the dimensions of the TileMap (e.g., 8x8)
    var map_width = 8
    var map_height = 8

    # Populate the TileMap with random tiles from the TileSet
    for y in range(map_height):
        for x in range(map_width):
            var random_tile_id = tile_ids[randi() % tile_ids.size()]
            tile_map.set_cell(0, Vector2(x, y), random_tile_id) # 0 is for the layre????!?!?

    # Create a new PackedScene to hold the TileMap
    var tilemap_scene = PackedScene.new()
    # https://docs.godotengine.org/en/stable/classes/class_tilemap.html
    tilemap_scene.pack(tile_map)

    # Save the PackedScene to the specified path
    ResourceSaver.save(tilemap_scene, TILEMAP_SCENE_PATH)
    # Exit the script
    quit()
