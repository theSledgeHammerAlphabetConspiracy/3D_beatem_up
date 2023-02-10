extends KinematicBody

export var player_team: String = '1'

const FLOOR_NORMAL = Vector3(0.0, 1.0, 0.0)

export var speed := 7.0
export var gravity := 30.0
export var jump_force := 12.0

var velocity_y := 0.0

###changed or added higher
var direction_ground:Vector2 = Vector2()

###new
var look_direction : Vector2 =  Vector2()
var on_ground: bool = false

func _physics_process(delta: float) -> void:
	#the move nad slide function has to be ran in this physics process
	#print(velocity_y)
	#_get_direction()# will become owner.get_direction() in the states that cause movement
	#print(on_ground)
	
	if not is_on_floor():
		velocity_y -= gravity * delta
		on_ground = false
	
	var velocity = Vector3(
		direction_ground.x * speed,
		velocity_y,
		direction_ground.y * speed)
	move_and_slide(velocity, FLOOR_NORMAL)
	
	if is_on_floor() or is_on_ceiling():
		velocity_y = 0.0
		on_ground = true

#in the on_ground state
#func _unhandled_input(event: InputEvent) -> void:
#	if event.is_action_pressed("jump"+player_team):
#		velocity_y = jump_force

func _get_direction():
	direction_ground = Vector2(
		Input.get_action_strength("move_right"+player_team) - Input.get_action_strength("move_left"+player_team),
		Input.get_action_strength("move_down"+player_team) - Input.get_action_strength("move_up"+player_team)).normalized()
	
func _give_velocity(state_speed,state_dir):
	direction_ground = state_dir
	speed = state_speed
