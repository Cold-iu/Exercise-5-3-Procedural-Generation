extends RigidBody3D


func _physics_process(delta):
	print(global_position)


@onready var Weapon = load("res://Player/pistol.tscn")

func _input(event):
	if event.is_action_pressed("Pickup"):
		for b in $Pickup_Range.get_overlapping_bodies():
			if b.has_method("pickup"):
				var weapon = Weapon.instantiate()
				b.pickup(weapon)
				queue_free()

