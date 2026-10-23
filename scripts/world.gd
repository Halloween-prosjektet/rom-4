
extends Node2D

var client: ControlRoomClient
var player_name := ""  # spilleren rom 1 sendte over

func _ready() -> void:
	## Return er for å playteste uten å være tilkoblet til serveren, ukommenter når det er i prod.
	await get_tree().create_timer(1.0).timeout
	$TileMap2.visible = true
	$Camera2D.screen_shake(20, 0.25)
	await get_tree().create_timer(12.0).timeout
	self.remove_child($Camera2D);
	return
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

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		player_won() 
