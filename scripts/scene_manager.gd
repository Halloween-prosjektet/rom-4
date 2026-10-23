extends Node2D

const SceneTwo = preload("res://scenes/world.tscn")
var client: ControlRoomClient
var player_name := ""  # spilleren rom 1 sendte over
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	client = ControlRoomClient.new("ws://172.31.0.200:7321", 4)
	add_child(client)
	client.add_loading_screen()
	# Koble signalene før run(), så ingen blir gått glipp av.
	client.player_incoming.connect(_on_player_incoming)
	client.player_left.connect(_on_player_left)
	client.game_finish_wait.connect(_on_game_finish_wait)
	client.game_finish_ok.connect(_on_game_finish_ok)
	client.run()



func _on_player_incoming(username: String, _player_data: Variant) -> void:
	player_name = username
	print("Velkommen til rom 2, ", username)


func player_won() -> void:
	print("Spilleren er ferdig! Sjekker med kontrollrommet...")
	client.finish_game()


func _on_player_left(username: String) -> void:
	print("Spilleren ", username, " gikk og kommer ikke likevel.")



func _on_game_finish_wait(max_wait: Variant) -> void:
	print("Neste rom er opptatt. Vent til ", max_wait)



func _on_game_finish_ok() -> void:
	print("Klart! Spilleren kan gå videre til rom 3.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_transition_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(SceneTwo.instantiate())
	print("Scenes swapped")
