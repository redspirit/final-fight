extends KinematicBody2D

export (int) var anim_frame = 0

var frames = [
	Rect2(8, 9, 22, 32),
	Rect2(80, 10, 15, 31),
	Rect2(101, 10, 17, 31),
	Rect2(124, 9, 15, 32),
	Rect2(146, 10, 17, 31)
]
var flip = false
var motionX = 0
var motionY = 0
var speedX = 50
var speedY = 30


func _ready():
	$anim.play("stay")
	pass


func _process(delta):
	
	
	if Input.is_action_pressed("ui_up"):
		motionY = -1
		$anim.play("walk")
	elif Input.is_action_pressed("ui_down"):
		motionY = 1
		$anim.play("walk")
	else :
		motionY = 0
	
	if Input.is_action_pressed("ui_right"):
		$anim.play("walk")
		flip = false
		motionX = 1
	elif Input.is_action_pressed("ui_left"):
		$anim.play("walk")
		flip = true
		motionX = -1
		pass
	else :
		if motionY == 0 :
			$anim.play("stay")
		motionX = 0
	
	$cody.flip_h = flip
	$cody.region_rect = frames[anim_frame]
	$cody.position.x += motionX * delta * speedX
	$cody.position.y += motionY * delta * speedY