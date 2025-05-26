extends Area2D
var player
var player_in_area = false

@onready var hint_label = $Label

func _ready():
	hint_label.text = "Press [E] to collect"
	hint_label.visible = false

func _on_body_entered(body):
	if body.name == "Player":
		player = body
		player_in_area = true
		hint_label.visible = true
		print("Player entered area:", name)

func _on_body_exited(body):
	if body.name == "Player":
		player_in_area = false
		hint_label.visible = false
		print("Player exited area:", name)

func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("interact"):
		if player and player.has_method("add_to_inventory"):
			player.add_to_inventory(name)
			print("Item collected:", name)
			queue_free()
