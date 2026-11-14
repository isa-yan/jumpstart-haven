extends CharacterBody2D

@export var speed = 400
const jump_velocity = -500
var jumpcount=0
var counter=0


func _physics_process(delta):
	var direction=Input.get_axis('left','right')
	if not is_on_floor():
		velocity+=get_gravity() * delta
		if Input.is_action_just_pressed('ui_accept') and jumpcount<2:
			jumpcount+=1
			velocity.y=jump_velocity
	else:
		jumpcount=1
	
	if Input.is_action_just_pressed('ui_accept') and is_on_floor():
		velocity.y = jump_velocity
		
	if Input.is_action_pressed('left') or Input.is_action_pressed('right'):
		velocity.x=speed*direction
		
	if Input.is_action_pressed('dash') and (Input.is_action_pressed('left') or Input.is_action_pressed('right')):
		velocity.x=speed*direction*2
		counter += 1 
		if counter > 50:
			velocity.x=speed*direction
		elif Input.is_action_pressed('dash'):
			velocity.x=speed*direction*2
			counter=0
		
	move_and_slide()
	
