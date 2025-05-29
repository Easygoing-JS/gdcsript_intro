# scripts/item.gd

extends Area2D

@export var item_type: String = "default_item"  # Тип предмета, задаётся в инспекторе
@onready var player = null

#func _ready():
	#connect("body_entered", Callable(self, "_on_body_entered"))
	#connect("body_exited", Callable(self, "_on_body_exited"))

var player_in_area = false

func _on_body_entered(body):
	if body.name == "Player":
		player = body
		player_in_area = true

func _on_body_exited(body):
	if body.name == "Player":
		player_in_area = false
		player = null

func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("interact"):
		if player and player.has_method("add_to_inventory"):
			player.add_to_inventory(item_type)  # <--- теперь передаём тип
			print("Item collected:", item_type)
			queue_free()
