extends CanvasLayer

@onready var inventory_label = $InventoryLabel  # Добавлено: ссылка на Label внутри UI

# Добавлено: метод для обновления текста инвентаря на экране
func update_inventory_display(inventory: Array) -> void:
	var text := "Inventory:\n"  # Заголовок
	for item in inventory:  # Для каждого предмета в массиве
		text += "- " + item + "\n"  # Добавляем его в текст
	inventory_label.text = text  # Обновляем текст в Label
