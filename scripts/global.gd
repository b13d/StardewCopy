extends Node

var ui
var wood_place
var tree_place
var wood_count := 0
var seeding_count := 0

var seeding = preload("res://scenes/seeding_item.tscn")
var temp = null

func _input(event):
	if event is InputEventMouseMotion:
		print("position: %s" % event.global_position)
		temp.global_position = event.global_position
		#temp.position = event.relative
	pass

func _ready():
	temp = seeding.instantiate()
	add_child(temp)
	pass

