extends CharacterBody2D


const speed = 100
var current_dir = "none"
var can_move:bool = false


func _physics_process(delta):
	if can_move:
		return player_movement(delta)

##player animations
func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x= speed
		velocity.y= 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x= -speed
		velocity.y= 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y= speed
		velocity.x= 0
	elif Input.is_action_pressed("ui_up"):
		current_dir= "up"
		play_anim(1)
		velocity.y= -speed
		velocity.x= 0
	else:
		play_anim(0)
		velocity.y=0
		velocity.x=0
		
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
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
