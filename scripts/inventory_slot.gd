# scripts/inventory_slot.gd
extends Control

@onready var icon = $Icon
@onready var count_label = $CountLabel
@onready var name_label = $NameLabel  # Новый узел

func set_item(texture: Texture, count: int, item_name: String) -> void:
	icon.texture = texture
	count_label.text = str(count)
	count_label.visible = count > 1
	name_label.text = item_name  # Устанавливаем имя
