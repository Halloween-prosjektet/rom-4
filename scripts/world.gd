
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
