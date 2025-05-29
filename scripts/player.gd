extends CharacterBody2D

# Инвентарь как словарь: { "wood": 2, "rock": 1, ... }
var inventory: Dictionary = {}

# Ссылка на UI
@onready var ui = $UI

const SPEED := 200

# Метод добавления предмета в инвентарь
func add_to_inventory(item_name: String) -> void:
	if inventory.has(item_name):
		inventory[item_name] += 1
	else:
		inventory[item_name] = 1

	if ui.has_method("update_inventory_display"):
		ui.update_inventory_display(inventory)

# Движение
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
