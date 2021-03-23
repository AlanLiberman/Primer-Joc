extends KinematicBody2D

var velocity : Vector2
	
func _process(delta):
	velocity.x = 0
	$AnimatedSprite.flip_v = false
	if Input.is_action_pressed("right"):
		velocity += Vector2.RIGHT * 300
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("left"):
		velocity += Vector2.LEFT * 300
		$AnimatedSprite.flip_h = true
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y += -200
			
	velocity.y += 200 * delta
			
	velocity = move_and_slide(velocity, Vector2.UP)
	
	animate(velocity)
	
func animate(velocity:Vector2):
	if velocity.length() == 0:
		$AnimatedSprite.play("player")
	if velocity.x > 0:
		$AnimatedSprite.play("walk")
	if velocity.x < 0:
		$AnimatedSprite.play("walk")
