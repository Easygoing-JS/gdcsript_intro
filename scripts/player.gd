# scripts/player.gd

extends CharacterBody2D

# Добавлено: инвентарь как массив
var inventory: Array = []

# Добавлено: ссылка на UI
@onready var ui = $UI

const  SPEED := 200

# Метод добавления предмета в инвентарь
func add_to_inventory(item_name: String) -> void:
	inventory.append(item_name)  # Добавляем предмет в массив
	print("Collected:", item_name)  # Печатаем собранный предмет
	print("Inventory now:", inventory)  # Печатаем весь инвентарь

	# Добавлено: если UI поддерживает метод обновления — вызываем его
	if ui.has_method("update_inventory_display"):
		ui.update_inventory_display(inventory)

# Метод for moving
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
