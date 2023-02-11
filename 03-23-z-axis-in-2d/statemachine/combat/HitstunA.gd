extends "../motion/motion.gd"


export(float) var BASE_MAX_HORIZONTAL_SPEED = 400.0

export(float) var AIR_ACCELERATION = 1000.0
export(float) var AIR_DECCELERATION = 2000.0
export(float) var AIR_STEERING_POWER = 50.0 # is CV jumps

export(float) var JUMP_HEIGHT = 120.0
export(float) var JUMP_DURATION = 0.8

export(float) var GRAVITY = 1600.0

var enter_velocity = Vector2()

var max_horizontal_speed = 0.0
var horizontal_speed = 0.0
var horizontal_velocity = Vector2()

var vertical_speed = 0.0
var height = 0.0


var h_speed
var h_dir
var v_height

var input_direction 

func _init():
	cancelable = true
	physics_type = 1#air physics for gethit
	
#####as of feb this is being called in the hitstop 
func initialize(speed, velocity, pos):#this is called in the state machine and that is wrong it probably should be called on 
	h_speed = speed
	max_horizontal_speed = speed if speed > 0.0 else BASE_MAX_HORIZONTAL_SPEED
	h_dir = velocity
	height = pos *-1
	
func enter():
	input_direction = get_input_direction()
	owner.velocity_y = owner.knockback_direction.y
	#owner._give_velocity(1,input_direction)
	owner.get_node("AnimationPlayer").play("hitstunA")
	
func update(delta):
	#var collision_info = move_horizontally(owner.knockback_amount, owner.knockback_direction)
	owner._give_velocity(owner.knockback_amount, Vector2(owner.knockback_direction.x,owner.knockback_direction.z))
	if owner.on_ground == true:# and owner.velocity_y < 0.0:
		emit_signal("finished","knockdown")

