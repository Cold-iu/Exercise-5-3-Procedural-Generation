extends Node3D

func _ready():
	name = "Victory"


func _on_win_area_body_entered(body):
	if len(Global.inventory) > 0:
		get_tree().change_scene_to_file("res://UI/secret_ending.tscn")
	else:
		print("You need a key") # Replace with function body.

