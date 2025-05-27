extends CanvasLayer

@onready var inventory_label = $InventoryLabel

func update_inventory_display(inventory: Array) -> void:
	var text := "Inventory:\n"
	for item in inventory:
		text += "- " + item + "\n"
	inventory_label.text = text
