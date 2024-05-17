extends StaticBody2D

var health_tree = 3
@export var wood_prefab: PackedScene
@export var seeding_prefab: PackedScene

func hit_tree():
	health_tree -= 1
	
	if health_tree == 0:
		queue_free()


func get_new_position() -> Vector2:
	var posX : float = randf_range(self.position.x - 25, self.position.x + 25)
	var posY : float = randf_range(self.position.y - 25, self.position.y + 25)
	
	return Vector2(posX, posY)

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "hit":
		hit_tree()
		
		if randf() < .3:
			print("spawn new seeding")
			
			var new_seeding = seeding_prefab.instantiate()
			new_seeding.position = get_new_position()
			Global.wood_place.add_child(new_seeding)
			pass
			
		var new_wood = wood_prefab.instantiate()
		new_wood.position = get_new_position()
		Global.wood_place.add_child(new_wood)
	pass # Replace with function body.
