extends "../motion.gd"


export(float) var jump_Hspeed = 6.2#400.0
#
#export(float) var AIR_ACCELERATION = 1000.0
#export(float) var AIR_DECCELERATION = 2000.0
#export(float) var AIR_STEERING_POWER = 50.0 # is CV jumps
#
#export(float) var JUMP_HEIGHT = 120.0
#export(float) var JUMP_DURATION = 0.8
#
#export(float) var GRAVITY = 1600.0

var enter_velocity = Vector2()

var max_horizontal_speed = 0.0
var horizontal_speed = 0.0

var horizontal_velocity = Vector3()

var height = 0.0

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
	#update_look_direction(input_direction)
	
	########move_horizontally(delta, Vector3(input_direction.x,0,input_direction.y))
	#animate_jump_height(delta)
	
	if Input.is_action_just_pressed("stringA"+owner.player_team):
		emit_signal("finished", "airattack")
	
	if owner.on_ground == true:# and owner.velocity_y < 0.0:
		emit_signal("finished", "jumpland")
#	if height <= 0.0:
#		emit_signal("finished", "jumpland")
#		#emit_signal("finished", "previous")	
	
func exit():
	height = 0.0
