extends CharacterBody3D

var d = 0
var dialogue = [
	"Testing..."
	,"Testing Testing"
	,"TESTING!!!!!!"

]

func _ready():
	$AnimationPlayer.play("Idle")


func _on_area_3d_body_entered(body):
	print("Entered dialogue")
	$Area3D.queue_free()
	if d < dialogue.size():
		$Dialogue.show()
		$Dialogue/Control/Label.text = dialogue[d]
		d += 1
		$Dialogue/Timer.start()
	else:
		print("No more dialogue")

func _on_timer_timeout():
	print("Timer timeout")

	if d < dialogue.size() - 1:
		d += 1
		$Dialogue/Control/Label.text = dialogue[d]
		$Dialogue/Timer.start()
	else:
		print("No more dialogue")
		$Dialogue.queue_free()
		