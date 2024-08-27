extends CharacterBody2D


const SPEED = 200.0 #velocidade constante
const JUMP_VELOCITY = -350.0 #velocidade do pulo
var estapulando = false
# adiciona gravidade
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#comentário teste
signal morreu


func _physics_process(delta):
	# adciona gravidade
	if not is_on_floor():
		velocity.y += gravity * delta

	# adiciona pulo se o personagem estiver no chão.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		estapulando = true
		# adicona entrada de movimento.
	# permite substitui as ações por ações personalizadas
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction !=0:
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.scale.x = direction
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle")

	move_and_slide()


func tomoDano():
	print("tomo dano")
	emit_signal("morreu")


