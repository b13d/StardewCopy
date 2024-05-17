extends CharacterBody2D


const SPEED = 150.0
#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_close_tree = false
var current_tree


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		pass
		#velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		pass
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_horizontal = Input.get_axis("left", "right")
	var direction_vertical = Input.get_axis("up", "down")
	
	if direction_vertical:
		velocity.y = direction_vertical * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if direction_horizontal:
		velocity.x = direction_horizontal * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Tree"):
		is_close_tree = true
		current_tree = body
		Global.ui.tree_icon.visible = true
		pass


func _on_area_2d_body_exited(body):
	if body.is_in_group("Tree"):
		is_close_tree = false
		current_tree = null
		Global.ui.tree_icon.visible = false
		pass

func _input(event):
	if event.is_action_pressed("damage"):
		if is_close_tree:
			current_tree.get_node("AnimationPlayer").play("hit")
		
		print(Global.ui.get_item_in_head())
