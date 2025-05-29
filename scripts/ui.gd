# scripts/ui.gd

extends CanvasLayer

@onready var inventory_grid = $InventoryGrid
@export var slot_scene: PackedScene  # Подключается inventory_slot.tscn через инспектор

func update_inventory_display(inventory: Array) -> void:
	# Очищаем текущие ячейки
	for child in inventory_grid.get_children():
		child.queue_free()

	# Подсчитываем количество каждого предмета
	var counts := {}
	for item in inventory:
		counts[item] = counts.get(item, 0) + 1

	# Для каждого уникального предмета создаём ячейку
	for item_name in counts.keys():
		var slot = slot_scene.instantiate()
		inventory_grid.add_child(slot)

		# Загружаем иконку (заглушка — замени на свою систему иконок)
		var icon = preload("res://assets/icons/basic_texture.png")

		# Ждём один кадр, чтобы сработали @onready в inventory_slot.gd
		await get_tree().process_frame

		# Устанавливаем иконку и количество
		slot.set_item(icon, counts[item_name], item_name)
