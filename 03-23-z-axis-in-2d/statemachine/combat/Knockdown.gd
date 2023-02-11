extends "../motion/on_ground/on_ground.gd"

#modified in the animation
export var get_up_roll_speed = 0
onready var input_direction = get_input_direction()

func enter():
	owner._give_velocity(0, Vector2(0,0))
	
	input_direction = get_input_direction()
	#input_direction += Vector2(owner.knockback_direction.x,input_direction.y)
	#####this might change to a get up roll state if theres a direction pressed
	#####or it might just change the animation which woul dhave a different roll speed
	owner.get_node("AnimationPlayer").play("knockdown")
	
func handle_input(event):
	pass
#	return .handle_input(event)

func update(_delta):
	owner._give_velocity(get_up_roll_speed, input_direction.normalized())

func _on_animation_finished(anim_name):
	emit_signal("finished", "idle")
