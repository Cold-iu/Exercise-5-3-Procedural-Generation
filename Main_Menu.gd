extends Control

func _physics_process(delta):
	pass
	


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Player/game.tscn") # Replace with function body.


func _on_exit_pressed():
	get_tree().quit() # Replace with function body.
