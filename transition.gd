extends CanvasLayer

signal transitioned

# Called when the node enters the scene tree for the first time.
func _ready():
	transition()
	
func transition():
	$AnimationPlayer.play("fade_to_black")
	print("Fading to black")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		print("Transition signal emitted")
		await get_tree().create_timer(3.0).timeout
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_to_normal")
	if anim_name == "fade_to_normal":
		print("Finished fading")
