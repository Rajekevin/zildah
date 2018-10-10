extends "res://engine/entity.gd"

const SPEED = 70

func _physics_process(delta):
	controls_loop()
	movement_loop()
	spritedir_loop()
	
	if is_on_wall():
		if spritedir == "left" and test_move(transform, Vector2(-1,0)):
			anim_switch("push")
		if spritedir == "right" and test_move(transform, Vector2(1,0)):
			anim_switch("push")
		if spritedir =="up" and test_move(transform, Vector2(0,-1)):
			anim_switch("push")
		if spritedir =="down" and test_move(transform, Vector2(0,1)):
			anim_switch("push")
	elif movedir != Vector2(0,0):
		anim_switch("walk")
	else:
		anim_switch("idle")
	
	print(spritedir)

func controls_loop():
	var LEFT  =	 Input.is_action_pressed("ui_left")
	var RIGHT =	 Input.is_action_pressed("ui_right")
	var UP    =	 Input.is_action_pressed("ui_up")
	var DOWN  =	 Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT) 
	movedir.y = -int(UP) + int(DOWN)
	
