extends Area2D

func _ready():
	$Sprite.visible = true

func _on_Welcome_body_exited(body):
	$Sprite.visible = false
	
