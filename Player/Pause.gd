extends Control


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Player/game.tscn") # Replace with function body.


func _on_quit_pressed():
	get_tree().quit() # Replace with function body.
