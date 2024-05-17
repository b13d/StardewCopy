extends Node

@export var place_woods:Node
@export var place_tree:Node

func _ready():
	Global.wood_place = place_woods
	Global.tree_place = place_tree

