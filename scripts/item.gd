extends Area2D

var player_in_area = false  # Флаг: игрок находится в зоне

@onready var hint_label = $Label  # Получаем доступ к надписи

func _ready():
	hint_label.text = "Press [E] to collect"  # Задаём текст
	hint_label.visible = false  # Скрываем по умолчанию

# Когда тело входит в зону
func _on_body_entered(body):
	if body.name == "Player":
		player_in_area = true
		hint_label.visible = true
		print("Player entered area:", name)

# Когда тело выходит из зоны
func _on_body_exited(body):
	if body.name == "Player":
		player_in_area = false
		hint_label.visible = false
		print("Player exited area:", name)

# Проверка нажатия клавиши
func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interact"):
		print("Collected:", name)
		queue_free()  # Удаляем предмет
