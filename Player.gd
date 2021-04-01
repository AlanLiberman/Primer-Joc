extends KinematicBody2D

var velocity : Vector2
var life = 1000

func _ready():
	position = Vector2(1800,-3750)
	$Sprite.visible = false
	
func _process(delta):
	velocity.x = 0
	$AnimatedSprite.flip_v = false
	if Input.is_action_just_pressed("start"):
		position = Vector2(25,490)
	if Input.is_action_pressed("right") and Input.is_action_pressed("sprint"):
		velocity += Vector2.RIGHT * 400
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("right"):
		velocity += Vector2.RIGHT * 100
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("left") and Input.is_action_pressed("sprint"):
		velocity += Vector2.LEFT * 400
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("left"):
		velocity += Vector2.LEFT * 100
		$AnimatedSprite.flip_h = true
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y += -250
		
	if position.y >= 1500:
		life -= 1000
	if life <= 0:
		position = Vector2(25,490)
		life = 1000
		
	if position.y < -3900:
		position = Vector2(1800,-3750)
		$Sprite.visible = true
		if Input.is_action_just_pressed("start"):
			position = Vector2(1800, -3750)
		if Input.is_action_pressed("right") and Input.is_action_pressed("sprint"):
			velocity += Vector2.ZERO
			$AnimatedSprite.flip_h = false
		elif Input.is_action_pressed("right"):
			velocity += Vector2.ZERO
			$AnimatedSprite.flip_h = false
		if Input.is_action_pressed("left") and Input.is_action_pressed("sprint"):
			velocity += Vector2.ZERO
			$AnimatedSprite.flip_h = true
		if Input.is_action_pressed("left"):
			velocity += Vector2.ZERO
			$AnimatedSprite.flip_h = true
		if is_on_floor() and Input.is_action_just_pressed("jump"):
			velocity.y += 0

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

