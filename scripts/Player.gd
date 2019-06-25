extends KinematicBody2D


var flip = false
var motionX = 0
var motionY = 0
var speedX = 200
var speedY = 150


func _ready():
	$anim.play("stay")
	pass


func _physics_process(delta):
	
	if Input.is_action_pressed("ui_up"):
		motionY = -1
	elif Input.is_action_pressed("ui_down"):
		motionY = 1
	else :
		motionY = 0
	
	if Input.is_action_pressed("ui_right"):
		flip = false
		motionX = 1
	elif Input.is_action_pressed("ui_left"):
		flip = true
		motionX = -1
	else :
		motionX = 0
	
	#$cody.flip_h = flip

	move_and_slide(Vector2(motionX * speedX, motionY * speedY))
	
	
	
	
var isHorWalking = false
var isVerWalking = false
	
func _input(event):
	
	if event.is_action_pressed("ui_right") :
		$anim.play("walk-right")
		isHorWalking = true
	
	if event.is_action_released("ui_right") :
		if !isVerWalking :
			$anim.play("stay-right")
		isHorWalking = false
	
	###############################################
	
	if event.is_action_pressed("ui_left") :
		$anim.play("walk-left")
		isHorWalking = true
	
	if event.is_action_released("ui_left") :
		if !isVerWalking :
			$anim.play("stay-left")
		isHorWalking = false
	
	###############################################
	
	if event.is_action_pressed("ui_up") :
		#$anim.play("walk")
		isVerWalking = true
	
	if event.is_action_released("ui_up") :
		if !isHorWalking && !isVerWalking :
			$anim.play("stay")
			
		isVerWalking = false
	
	#################################################
	
	if event.is_action_pressed("ui_down") :
		#$anim.play("walk")
		isVerWalking = true
	
	if event.is_action_released("ui_down") :
		if !isHorWalking && !isVerWalking:
			$anim.play("stay")
			
		isVerWalking = false

	#################################################
	
	if event.is_action_pressed("ui_accept"):
		$anim.play("beat-left")
		
	if event.is_action_released("ui_accept"):
		#$anim.play("stay-right")
		pass

