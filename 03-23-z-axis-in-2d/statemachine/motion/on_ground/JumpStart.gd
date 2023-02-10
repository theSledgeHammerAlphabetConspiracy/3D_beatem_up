extends "on_ground.gd"

func enter():
	owner._give_velocity(0,Vector2(0,0))
	owner.get_node("AnimationPlayer").play("jumpstart")

func handle_input(event):
	return .handle_input(event)

func update(_delta):
	var input_direction = get_input_direction()
	#if input_direction:
		#emit_signal("finished", "move")


func _on_animation_finished(anim_name):
	emit_signal("finished", "jump")
