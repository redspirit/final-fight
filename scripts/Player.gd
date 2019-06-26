extends KinematicBody2D


var speed = 200

var motion = Vector2(0, 0)
var dir = 1

func _ready():
	$anim.play("stay-right")
	pass


func _physics_process(delta):
	
	if Input.is_action_pressed("ui_up"):
		motion.y = -1
		walk()
	elif Input.is_action_pressed("ui_down"):
		motion.y = 1
		walk()
	else :
		motion.y = 0
		#stay()
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 1
		dir = 1
		walk()
	elif Input.is_action_pressed("ui_left"):
		motion.x = -1
		dir = -1
		walk()
	else :
		motion.x = 0
		#stay()
	
	
	if Input.is_action_just_released("ui_right") || Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_up") || Input.is_action_just_released("ui_down")  :
		stay()
	
	
	
	move_and_slide(motion * speed)
	
	
	
func walk():
	if dir > 0:
		$anim.play("walk-right")
	if dir < 0:
		$anim.play("walk-left")
		
func stay():
	
	if motion.length() > 0 :
		return
	
	if dir > 0:
		$anim.play("stay-right")
	if dir < 0:
		$anim.play("stay-left")
	
	
func beat():
	
	if dir > 0:
		$anim.play("beat-right")
	if dir < 0:
		$anim.play("beat-left")	
	
func _input(event):
	

	if event.is_action_pressed("beat"):
		beat()
		
	if event.is_action_released("beat"):
		stay()
		pass

