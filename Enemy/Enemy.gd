extends CharacterBody3D


@onready var NA =$NavigationAgent3D
const speed = 3.
var initial_pos = Vector3.ZERO

var dying = false
var attacking = false
var life = 3
var death_count = 0


func _ready():
	$AnimationPlayer.play("Walk")
	initial_pos = global_transform.origin

func _physics_process(delta):
	var player = get_node_or_null("/root/Game/Player")
	if player != null and not dying and not attacking:
		look_at(player.global_position)
		NA.set_target_position(player.global_position)
		var current_pos = global_position
		var next_pos = NA.get_next_path_position()
		var new_speed = (next_pos - current_pos).normalized()
		velocity = new_speed
	if !is_on_floor():
		velocity.y -= 9.8
	else:
		velocity.y = 0
	
	move_and_slide()
	
func die():
	life -= 1
	if life <= 0:
		if death_count <= 2:
			if death_count == 2:
				$CollisionShape3D.disabled = true
				dying = true
				$AnimationPlayer.play("Death")
				velocity = Vector3.ZERO
				$Timer.start()
			else:
				$CollisionShape3D.disabled = true
				death_count += 1
				dying = true
				$AnimationPlayer.play("Death")
				velocity = Vector3.ZERO
				$Timer.start()
	
		

func _on_area_3d_body_entered(body):
	if not dying:
		attacking = true # Replace with function body.
		$AnimationPlayer.play("Attack")
		$hit_check.start()
			

func _on_area_3d_body_exited(body):
	if not dying:
		attacking = false
		$AnimationPlayer.play("Walk")
		$hit_check.stop() # Replace with function body.


func _on_timer_timeout():
	if death_count < 2:
		Global.update_kills(1)
		respawn()
	else:
		Global.update_kills(1)
		queue_free()
	# Replace with function body.


func _on_hit_check_timeout():
	for b in $Area3D.get_overlapping_bodies():
		if b.has_method("die"):
			print(b, "has_method: die")
			b.die()
			# Replace with function body.


func respawn():
	$CollisionShape3D.disabled = false
	life = 3
	global_transform.origin = initial_pos
	dying = false
	$AnimationPlayer.play("Walk")
