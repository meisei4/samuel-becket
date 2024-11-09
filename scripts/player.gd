extends CharacterBody2D

const SPEED = 500 # Movement speed in pixels per second

@onready var _animated_sprite = $AnimatedSprite2D # defined in the Player Scene 

# Just for animations?? could be in physics but unrelated, they both run at a frame by frame
func _process(_delta):
	self._animated_sprite.play()

func _physics_process(_delta):
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# TODO: delta here is often too low as the time for frame draw 
	self.velocity = input_dir * SPEED # * delta
	# print("fps: ", 1 / delta)
	move_and_slide()
