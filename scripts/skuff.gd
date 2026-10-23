extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var player_present: bool = false
var is_open: bool = false

func _ready() -> void:
	print("Plate ready")
	sprite.play("closed")
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	if hvitlok_popup != null:
		hvitlok_popup.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_present = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_present = false

func _unhandled_input(event: InputEvent) -> void:
	# Check if player is inside the area and presses the Space key
	if player_present and event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_SPACE:
			toggle_state()

func toggle_state() -> void:
	is_open = !is_open
	if is_open:
		sprite.play("open")
	else:
		sprite.play("closed")

@onready var hvitlok_popup: Label = $Label


		
func vis_popup_midlertidig() -> void:
	if hvitlok_popup == null:
		return
		
	hvitlok_popup.visible = true
	hvitlok_popup.modulate.a = 1.0
	
	# Vent 2 sekunder, og ton den ut
	var tween = create_tween()
	tween.tween_interval(2.0)
	tween.tween_property(hvitlok_popup, "modulate:a", 0.0, 0.5)
	tween.tween_callback(func(): hvitlok_popup.visible = false)
