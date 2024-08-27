extends CanvasLayer


func _ready():
	pass
	
func _process(delta):
	pass
	
	
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true

func _on_button_pressed():
	pass # Replace with function body.
	get_tree().paused = false
	visible = false

func _on_button_2_pressed():
	pass # Replace with function body.
	get_tree().paused = false
	get_tree().change_scene_to_file("res://nive4.tscn")
	global.ponto = 0


func _on_reiniciar_pressed():
	pass # Replace with function body.
	get_tree().quit()
