extends CharacterBody2D

const SPEED = 200 # Movement speed in pixels per second

func _physics_process(delta):
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# TODO: delta here is often too low as the time for frame draw 
	# just writing self to make it clear im in OOP
	self.velocity = input_dir * SPEED # * delta
	print("fps: ", 1 / delta)
	move_and_slide()
