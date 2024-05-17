extends "res://scripts/item_interactive.gd"

@export var sprite_wood: CompressedTexture2D
@export var sprite_wood_outline: CompressedTexture2D

func _on_body_entered(body):
	if body.is_in_group("Player"):
		can_taked = true
		$Sprite2D.texture = sprite_wood_outline


func _on_body_exited(body):
	if body.is_in_group("Player"):
		can_taked = false
		$Sprite2D.texture = sprite_wood





