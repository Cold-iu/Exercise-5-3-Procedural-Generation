extends Node3D

var Bullet_Hole = preload("res://Player/bullet_hole.tscn")


func shoot():
	$Muzzle.visible = true
	$Timer.start()
	if $Aim.is_colliding():
		var target = $Aim.get_collider()
		print("Collided with:", target.name)
		
		var bullet_hole = Bullet_Hole.instantiate()
		target.add_child(bullet_hole)
		bullet_hole.global_position = $Aim.get_collision_point()
		bullet_hole.look_at($Aim.get_collision_normal() + $Aim.get_collision_point() + Vector3.UP)
		if target.has_method("die"):
			target.die()
		else:
			print("No die method found")
		
	
	

func _on_timer_timeout():
	print("Timer timeout - hiding Muzzle")
	$Muzzle.visible = false # Replace with function body.
