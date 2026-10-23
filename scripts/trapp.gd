extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var player_present: bool = false

func _ready() -> void:
	print("Plate ready")
	sprite.play("off")
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
 
func _on_body_entered(body: Node2D) -> void:
	print("entered: ", body.name, " groups: ", body.get_groups())
	if body.is_in_group("player"):
		print("aasdasd")
		sprite.play("on")
		player_present = true
		
func _input(event: InputEvent) -> void:
	if (player_present):
		if event.is_action_pressed("ui_accept"):
			if get_parent().has_method("player_won"):
				get_parent().player_won()

 
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		sprite.play("off")
		player_present = false
