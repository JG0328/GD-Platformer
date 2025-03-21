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
	elif velocity.x == 0 && velocity.y < 0:
		$Anim.play("Jump")
	elif velocity.x == 0 && velocity.y > 30:
		$Anim.play("Fall")
	else:
		velocity.x = 0
		$Anim.play("Idle")
	
	if velocity.y > 350:
		get_tree().reload_current_scene()
	
	if is_on_floor() && Input.is_action_just_pressed("ui_accept"):
		velocity.y -= jump
		$Anim.play("Jump")
	elif velocity.y < 0 && velocity.x!= 0:
		$Anim.play("Jump")
	elif velocity.y > 30 && velocity.x != 0:
		$Anim.play("Fall")
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
