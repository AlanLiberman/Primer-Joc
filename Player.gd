extends KinematicBody2D

var velocity : Vector2
var life = 1000
	
func _process(delta):
	velocity.x = 0
	$AnimatedSprite.flip_v = false
	if Input.is_action_pressed("right") and Input.is_action_pressed("sprint"):
		velocity += Vector2.RIGHT * 300
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("right"):
		velocity += Vector2.RIGHT * 100
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("left") and Input.is_action_pressed("sprint"):
		velocity += Vector2.LEFT * 300
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("left"):
		velocity += Vector2.LEFT * 100
		$AnimatedSprite.flip_h = true
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y += -250
		
	if position.y >= 1500:
		life -= 1000
	if life <= 0:
		position = Vector2(25,490)
		life = 1000

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
	if velocity.x > 100:
		$AnimatedSprite.play("run")
	if velocity.x < -100:
		$AnimatedSprite.play("run")
	if velocity.y > 0:
		$AnimatedSprite.play("fall")

