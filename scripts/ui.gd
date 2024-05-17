extends CanvasLayer

@onready var tree_icon = $TextureTree

@export var default_inventory_place_icon: Texture
@export var inventory_hover_place_icon: Texture

@export var label_count_wood: Label
@export var label_count_seeding: Label

@export var arr_texture_items:Array[Texture] 
@export var items:Dictionary = {"Wood": 0, "Seeding": 0}
@export var items_in_inventory: Array[Panel]
@export var inventory_place: Array[TextureRect]

var current_inventory_index = 0

func _ready():
	inventory_place[current_inventory_index].texture = inventory_hover_place_icon
	Global.ui = self
	pass

func _input(event):
	if event.is_action_pressed("next_item"):
		inventory_place[current_inventory_index].texture = default_inventory_place_icon
		
		if current_inventory_index + 1 >= inventory_place.size():
			current_inventory_index = 0
		else:
			current_inventory_index += 1
		
		inventory_place[current_inventory_index].texture = inventory_hover_place_icon
	elif event.is_action_pressed("previous_item"):
		inventory_place[current_inventory_index].texture = default_inventory_place_icon
		
		if current_inventory_index - 1 < 0:
			current_inventory_index = inventory_place.size() - 1
		else:
			current_inventory_index -= 1
		
		inventory_place[current_inventory_index].texture = inventory_hover_place_icon
		

func get_item_in_head() -> int:
	if inventory_place[current_inventory_index].get_child_count() == 0:
		return 0
	else:
		if items.values()[current_inventory_index] == 0:
			return 0
		else:
			return 1
	pass
