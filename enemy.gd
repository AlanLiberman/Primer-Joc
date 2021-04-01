extends StaticBody2D

var ball
var velocityball : Vector2

func _ready():
	ball = $Ball
	$AnimatedSprite.play("standby")
	ball.visible = false
	velocityball = Vector2.ZERO
func _on_Area2D_body_entered(body):
	ball.visible = true
	$AnimatedSprite.play("attack")
	print('why')
	velocityball = Vector2.RIGHT
	
func _process(delta):
	ball.position += velocityball * 8

func _on_Area2D_body_exited(body):
	$AnimatedSprite.play("standby")
	ball.visible = false
	velocityball = Vector2.ZERO
	ball.position = Vector2.ZERO
