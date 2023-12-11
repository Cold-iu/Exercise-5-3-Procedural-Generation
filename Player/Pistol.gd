extends Node3D

var Bullet_Hole = preload("res://Player/bullet_hole.tscn")
var Dropped_gun = preload("res://Player/dropped_gun.tscn")

func shoot():
	$Muzzle.visible = true
	$Sound.play()
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


func drop():
	var game = get_node_or_null("/root/Game")
	if game != null:
		var dropped_gun = Dropped_gun.instantiate()
		game.add_child(dropped_gun)
		dropped_gun.global_position = global_position + Vector3(0,2,-1)
		dropped_gun.linear_velocity = Vector3(0,1,-2)
		queue_free()
