extends SubViewport


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#TODO: figure out how to get the second subviewport to show up in the main viewport in some offset
	world_2d = get_viewport().world_2d


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
