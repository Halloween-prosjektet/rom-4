extends Control

@onready var label: Label = $Label
@onready var timer: Timer = $Timer


##Variabler



func _ready() -> void:
	timer.timeout.connect(animate_label)
	
	animate_label()


func animate_label() -> void: 
	label.visible_characters += 1
	
	timer.start()
	
