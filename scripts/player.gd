extends CharacterBody2D

<<<<<<< HEAD
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
=======

const speed = 100
var current_dir = "none"
var can_move:bool = false


func _physics_process(delta):
	if can_move:
		return player_movement(delta)

##player animations
func player_movement(delta):
>>>>>>> 7e1bf621aa36b9df21af3f4caa206a973d43975a
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
<<<<<<< HEAD

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
=======
	
	if dir == "right":
		anim.flip_h=false
		if movement == 1:
			anim.play("side_walk")
		elif movement== 0:
			anim.play("side_idle")
	if dir == "left":
		anim.flip_h=true
		if movement == 1:
			anim.play("side_walk")
		elif movement== 0:
			anim.play("side_idle")
			
	if dir == "down":
		anim.flip_h=true
		if movement == 1:
			anim.play("front_walk")
		elif movement== 0:
			anim.play("front_idle")
	if dir == "up":
		anim.flip_h=true
		if movement == 1:
			anim.play("back_walk")
		elif movement== 0:
			anim.play("back_idle")
		
func _ready() -> void:
	add_to_group("player")
	$AnimationPlayer.play("opening_walk")
	await get_tree().create_timer(1.0).timeout
	$Node2D.visible = true
	await get_tree().create_timer(12.0).timeout
	$Node2D.visible = false
	can_move = true
	return
>>>>>>> 7e1bf621aa36b9df21af3f4caa206a973d43975a
