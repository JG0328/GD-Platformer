extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 250
var maxSpeed = 500
var jump = 150
var gravity = 300

func _process(delta):
	var movement = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if movement != 0:
		velocity.x += movement * speed * delta
		$Anim.flip_h = movement < 0
		$Anim.play("Walk")
	else:
		velocity.x = 0
		$Anim.play("Idle")
	
	velocity = move_and_slide(velocity, Vector2.UP)
