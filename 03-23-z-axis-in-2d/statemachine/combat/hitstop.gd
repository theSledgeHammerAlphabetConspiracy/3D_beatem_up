"""
The stagger state end with the stagger animation from the AnimationPlayer
The animation only affects the Body Sprite"s modulate property so 
it could stack with other animations if we had two AnimationPlayer nodes
"""
### stagger is not hitstun it is hitstop

extends "../state.gd"

#probabyl get rid of this
var knockback_direction = Vector2()

var stun_type = 0#this will get passed in from both the physics_type the character had before 
#the hit (1=air or 0=ground) and will be compared to the hit type the attack forces (dont have this 
#started yet 1/24)

func _init():
	cancelable = true

func enter():
	#print(get_parent().states_stack)
	
	##############this is all on the take daamge function on the player script
	#if ABOX stuntype == 0 or w/e
	
	if owner.knockback_type == 0:
		stun_type = get_parent().states_stack[1].physics_type#this is if the ABox doesnt have an overriding
		#print(get_parent().states_stack[1].get_name())
	elif owner.knockback_type == 6:#blowback
		stun_type = 6
	#hitstun type like launcher or grab probably should be in the owner.take_damage function too
	
	owner.get_node("AnimationPlayer").play("hitstop")

func _on_animation_finished(anim_name):
	#emit_signal("finished", "hitstunA")
	if stun_type == 0:
		#emit_signal("finished", "hitstunA")
		emit_signal("finished", "hitstunGr")
	elif stun_type == 1:
		emit_signal("finished", "hitstunA")
	elif stun_type == 6:
		emit_signal("finished", "blowback")
		
