extends "on_ground.gd"

func enter():
	owner._give_velocity(0, Vector2(0,0))
	owner.get_node("AnimationPlayer").play("idle")
	#if owner.on_ground == false:
		

func handle_input(event):
	return .handle_input(event)

func update(_delta):
	var input_direction = get_input_direction()
	if input_direction:
		emit_signal("finished", "move")
