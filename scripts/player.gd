extends CharacterBody2D

const SPEED = 100
var current_dir = "down"
var can_move: bool = true


func _physics_process(_delta):
	if can_move:
		player_movement()
	else:
		velocity = Vector2.ZERO
		move_and_slide()
		$AnimatedSprite2D.play("front_idle")


func player_movement():
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		velocity = Vector2(SPEED, 0)
		play_anim(1)
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		velocity = Vector2(-SPEED, 0)
		play_anim(1)
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		velocity = Vector2(0, SPEED)
		play_anim(1)
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		velocity = Vector2(0, -SPEED)
		play_anim(1)
	else:
		velocity = Vector2.ZERO
		play_anim(0)

	move_and_slide()


func play_anim(movement: int) -> void:
	var anim = $AnimatedSprite2D

	match current_dir:
		"right":
			anim.flip_h = false
			anim.play("side_walk" if movement == 1 else "side_idle")
		"left":
			anim.flip_h = true
			anim.play("side_walk" if movement == 1 else "side_idle")
		"down":
			anim.flip_h = false
			anim.play("front_walk" if movement == 1 else "front_idle")
		"up":
			anim.flip_h = false
			anim.play("back_walk" if movement == 1 else "back_idle")
