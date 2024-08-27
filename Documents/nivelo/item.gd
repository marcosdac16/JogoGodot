extends Area2D

var ponto = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

signal coletado
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "player":
		global.ponto+=ponto
		print(global.ponto)
		$AnimatedSprite2D.play("coletavel") 
		await $AnimatedSprite2D.animation_finished
		queue_free() 


func coletou():
	print("coletado")
	emit_signal("coletou")
