extends Node2D

@onready var player = $player
@onready var item = $item
@onready var frutamal = $frutamal


func _ready():
	player.morreu.connect(resetGame)
	
	
func resetGame():
		get_tree().reload_current_scene()
		global.ponto = 0
		
		
func _colect():
	item.coletou.connect()
	



