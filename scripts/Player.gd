extends KinematicBody2D

export (int) var anim_frame = 0

var frames = [
	#stay
	Rect2(8, 9, 22, 32),
	#walk
	Rect2(80, 10, 15, 31),
	Rect2(101, 10, 17, 31),
	Rect2(124, 9, 15, 32),
	Rect2(146, 10, 17, 31),
	#beat
	Rect2(4, 135, 23, 31),
	Rect2(39, 135, 31, 31)
]
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

	move_and_slide(Vector2(motionX * speedX, motionY * speedY))
	
func _input(event):
	
	if event.is_action_pressed("ui_accept"):
		#print("action")
		anim_frame = 5
	
	
	pass