extends Node

var inventory = []
var health = 3
var kills = 0


func add_item(item):
	inventory.append(item)
	
func use_item(item):
	if item in inventory:
		pass

func _ready():
	
	process_mode = PROCESS_MODE_ALWAYS		# global should never be paused

func _unhandled_input(event):
	if event.is_action_pressed("Menu"):	# instead of quitting, show the menu
		var menu = get_node_or_null("/root/Game/UI/Pause")
		if menu == null:
			get_tree().quit()
		else:
			if not menu.visible:
				menu.show()
				get_tree().paused = true
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE	# pause the game while the menu is visible
			else:
				menu.hide()
				get_tree().paused = false
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	

func update_kills(k):
	kills += k
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.update_score()

func update_health(h):
	health -= h
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.update_health()
	if health <= 0:
		pass
		
