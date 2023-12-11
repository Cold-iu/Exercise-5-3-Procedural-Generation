extends Node3D

func _ready():
	name = "enemy"


func die():
	print("Before queue_free")
	queue_free()
	print("After queue_free")
