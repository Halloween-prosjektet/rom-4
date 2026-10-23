extends Node2D

const SceneTwo = preload("res://scenes/world.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$Transition.transition()


func _on_transition_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(SceneTwo.instantiate())
	print("Scenes swapped")
