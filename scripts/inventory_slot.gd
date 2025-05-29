extends Control

@onready var icon = $Icon
@onready var count_label = $CountLabel
@onready var name_label = $NameLabel

# Установка данных предмета в ячейку
func set_item(texture: Texture, item_name: String, count: int) -> void:
	if not icon or not count_label or not name_label:
		push_warning("Один или несколько узлов (Icon, CountLabel, NameLabel) не найдены!")
		return

	icon.texture = texture                          # Установка иконки
	name_label.text = item_name                     # Название предмета
	count_label.text = str(count)                   # Количество предметов
	count_label.visible = count > 1                 # Показывать только если больше 1
