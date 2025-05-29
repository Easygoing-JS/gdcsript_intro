extends CanvasLayer

@onready var inventory_grid = $InventoryGrid
@onready var slot_scene = preload("res://scenes/inventory_slot.tscn")

# Метод отображения инвентаря
func update_inventory_display(inventory: Dictionary):
	# Удаляем старые слоты
	for child in inventory_grid.get_children():
		child.queue_free()

	# Используем inventory как есть
	var item_counts = inventory

	for item_name in item_counts.keys():
		var slot = slot_scene.instantiate()
		inventory_grid.add_child(slot)

		var item_data = get_item_data(item_name)

		var icon_node = slot.get_node("Icon")
		var count_label = slot.get_node("CountLabel")
		var name_label = slot.get_node("NameLabel")

		if icon_node:
			icon_node.texture = item_data.icon if item_data.has("icon") else null
		if count_label:
			count_label.text = str(item_counts[item_name])
			count_label.visible = item_counts[item_name] > 1
		if name_label:
			name_label.text = item_data.display_name if item_data.has("display_name") else item_name

# Метод с данными о типах предметов
func get_item_data(item_name: String) -> Dictionary:
	var dummy_data: Dictionary = {
		"wood": {
			"display_name": "Wood",
			"icon": preload("res://assets/icons/wood.png")
		},
		"rock": {
			"display_name": "Rock",
			"icon": preload("res://assets/icons/rock.png")
		},
		"food": {
			"display_name": "Fruit",
			"icon": preload("res://assets/icons/fruit.png")
		}
	}
	return dummy_data.get(item_name, {})
