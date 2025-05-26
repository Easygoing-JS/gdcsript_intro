# scripts/player.gd

extends CharacterBody2D

# Инвентарь: список собранных предметов
var inventory: Array = []

const  SPEED := 200

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

# Метод для добавления предмета в инвентарь
func add_to_inventory(item_name: String) -> void:
	inventory.append(item_name)
	print("Collected:", item_name)
	print("Inventory now:", inventory)
