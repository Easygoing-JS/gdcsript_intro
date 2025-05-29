extends CharacterBody2D

var inventory: Dictionary = {}

@onready var ui = $UI

const SPEED := 200

# Добавление предмета в инвентарь
func add_to_inventory(item_type: String) -> void:
	inventory[item_type] = inventory.get(item_type, 0) + 1
	ui.update_inventory_display(inventory)

func _physics_process(_delta):
	var direction := Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	velocity = direction.normalized() * SPEED
	move_and_slide()
