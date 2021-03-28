extends KinematicBody2D

var ball
var timer = 0.0

func _ready():
	ball = $RigidBody2D
	$AnimatedSprite.play("standby")
	ball.visible = false

func _process(delta):
	timer += 10

func _on_Area2D_body_entered(body):
	timer = 0
	ball.visible = true
	$AnimatedSprite.play("attack")
	print('why')
	#if timer < 1:
	#	ball.visible = true
	#	ball.position += 100
	#else:
	#	ball.visible = false
	#	ball.position == Vector2(0,0)

func _on_Area2D_body_exited(body):
	$AnimatedSprite.play("standby")
	ball.visible = false

