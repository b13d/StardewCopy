extends StaticBody2D

@export var tree: PackedScene
@export var arr_seeding_sprite: Array[Texture]
var stage = 0


func _ready():
	$Sprite2D.texture = arr_seeding_sprite[0]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_timer_evolution_timeout():
	stage += 1
	
	if stage == 3:
		var new_tree = tree.instantiate()
		new_tree.position = self.position
		Global.tree_place.add_child(new_tree)
		self.queue_free()
		pass
	else:
		$Sprite2D.texture = arr_seeding_sprite[stage]
