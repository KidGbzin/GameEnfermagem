extends Control

func on_ready():
	pass

func _on_Start_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Level.tscn")

func _on_Exit_pressed():
# warning-ignore:standalone_expression
	get_tree().quit
