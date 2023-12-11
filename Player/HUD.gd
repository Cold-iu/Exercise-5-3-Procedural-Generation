extends Control
func _ready():
	update_score()
	update_health()
	


func update_score():
	$Kills.text = "Kills: " + str(Global.kills)
	
func update_health():
	$Health.text = "Health: " + str(Global.health)
