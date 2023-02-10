extends "on_ground.gd"

export(float) var MAX_WALK_SPEED = 7
export(float) var MAX_RUN_SPEED = 10.5

func enter():
	speed = 0.0
	velocity = Vector2()

	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	owner.get_node("AnimationPlayer").play("walk")

func handle_input(event):
	#pass
	return .handle_input(event)

func update(delta):
	var input_direction = get_input_direction()
	if not input_direction:
		emit_signal("finished", "idle")
	update_look_direction(input_direction)#in motion
	
	speed = MAX_WALK_SPEED #MAX_RUN_SPEED if Input.is_action_pressed("run") else MAX_WALK_SPEED
	owner._give_velocity(speed, get_input_direction())
	#var collision_info = owner.move(speed, input_direction)
#	if not collision_info:
#		return
#	if speed == MAX_RUN_SPEED and collision_info.collider.is_in_group("environment"):
#		return null
	


