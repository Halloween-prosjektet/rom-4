extends RichTextLabel
@export var typing_time: float #typing time in second(s)

func soundplay():
	$"../glurf".play()
	await get_tree().create_timer(0.8).timeout
	$"../glurf".stop()

func _ready() -> void:
	await change_text("EEK!")
	await get_tree().create_timer(1).timeout
	soundplay()
	await change_text("Hvor er jeg? Inngangen er blokkert...")
	await get_tree().create_timer(1).timeout
	soundplay()
	await change_text("Vent... dette er den gamle kokkelinja!")
	await get_tree().create_timer(1).timeout
	soundplay()
	await change_text("Jeg tror jeg kan finne en utvei.")
func reveal_text():
	var tween = create_tween()
	tween.tween_property(self, "visible_ratio", 1.0, typing_time).from(0.0)
	return tween
	
func change_text(role : String):
	self.text = role
	reveal_text()
	await get_tree().create_timer(2.0).timeout
