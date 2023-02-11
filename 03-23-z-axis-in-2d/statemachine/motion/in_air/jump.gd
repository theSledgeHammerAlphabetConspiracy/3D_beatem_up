extends "../motion.gd"


export(float) var jump_Hspeed = 6.2#400.0

var enter_velocity = Vector2()

var horizontal_velocity = Vector3()

var input_direction 

func _init():
	cancelable = true
	physics_type = 1#air physics for gethit

	
func enter():
	input_direction = get_input_direction()
	owner.velocity_y = owner.jump_force
	owner._give_velocity(jump_Hspeed,input_direction)
	update_look_direction(input_direction)
	
	owner.get_node("AnimationPlayer").play("jump")
	
func update(delta):
	#u cant change direction mid jump
	input_direction = get_input_direction()
	
	if Input.is_action_just_pressed("stringA"+owner.player_team):
		emit_signal("finished", "airattack")
	
	if owner.on_ground == true and owner.velocity_y <= 0.0:
		emit_signal("finished", "jumpland")


