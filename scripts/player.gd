extends CharacterBody2D

const SPEED = 200  # Movement speed in pixels per second

func _physics_process(delta):
	var input_vector = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)

	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()
		print("Input detected: ", input_vector)

	velocity = input_vector * SPEED
	move_and_slide()
