# scripts/ui.gd
extends CanvasLayer

@onready var inventory_grid: GridContainer = $InventoryGrid
@onready var slot_scene: PackedScene = preload("res://scenes/inventory_slot.tscn")

# Метод для обновления визуального инвентаря
func update_inventory_display(inventory: Dictionary):
	# Очистить предыдущие слоты
	for child in inventory_grid.get_children():
		child.queue_free()

	# Подсчёт количества каждого типа предметов
	var item_counts: Dictionary = {}
	for item_name in inventory:
		if item_counts.has(item_name):
			item_counts[item_name] += 1
		else:
			item_counts[item_name] = 1

	# Создание новых слотов с обновлённой информацией
	for item_name in item_counts.keys():
		var slot = slot_scene.instantiate()
		inventory_grid.add_child(slot)

		# Пытаемся получить информацию из item_data.gd или по заглушке
		var item_data = get_item_data(item_name)
		
		# Настройка иконки и текста
		var icon_node = slot.get_node("Icon")
		var count_label = slot.get_node("CountLabel")
		var name_label = slot.get_node("NameLabel")

		if icon_node:
			icon_node.texture = item_data.icon if item_data.has("icon") else null
		if count_label:
			count_label.text = str(item_counts[item_name])
		if name_label:
			name_label.text = item_data.display_name if item_data.has("display_name") else item_name

# Временно заглушка для получения данных о предмете
func get_item_data(item_name: String) -> Dictionary:
	# В будущем можно заменить загрузкой из ресурса или базы данных
	var dummy_data: Dictionary = {
		"wood": {
			"display_name": "Wood",
			"icon": preload("res://assets/icons/wood.png")
		},
		"stone": {
			"display_name": "Rock",
			"icon": preload("res://assets/icons/rock.png")
		},
		"food": {
			"display_name": "Fruit",
			"icon": preload("res://assets/icons/fruit.png")
		}
	}
	return dummy_data.get(item_name, {})
