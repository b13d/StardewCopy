extends Node

enum Items {Wood, Seeding}


@export var current_item: Items
var can_taked = false


func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("use"):
		if can_taked and current_item == Items.Wood:
			Global.wood_count += 1
			Global.ui.label_count_wood.text = str(Global.wood_count)
			Global.ui.items["Wood"] = Global.wood_count
			queue_free()
			
		elif can_taked and current_item == Items.Seeding:
			Global.seeding_count += 1
			Global.ui.label_count_seeding.text = str(Global.seeding_count)
			Global.ui.items["Seeding"] = Global.seeding_count
			queue_free()
