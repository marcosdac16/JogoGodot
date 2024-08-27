extends Control

@onready var item_contador = $MarginContainer/HBoxContainer/item_contador as Label
@onready var timer_count = $MarginContainer/HBoxContainer2/timer_count as Label
@onready var player = $"../../player"

@onready var timer = $"../../Timer" as Timer

signal tempo_acabou()

var minutos = 0
var segundos = 0

@export_range(0,2) var min_padrao = 1
@export_range(0,59) var seg_padrao = 0

func _ready():
	item_contador.text=str("%02d"%global.ponto)
	timer_count.text = str ("%02d" % min_padrao) + ":" + ("%02d" % seg_padrao)
	
	minutos = min_padrao
	segundos = seg_padrao
	
func _process(delta):
	item_contador.text=str("%02d"%global.ponto)


func _on_timer_timeout():
	if segundos == 0:
		if minutos > 0:
			minutos -= 1
			segundos = 60
	segundos -=1 
	timer_count.text = str ("%02d" % minutos) + ":" + ("%02d" % segundos)

func _can_drop_data(at_position, data):
	if segundos == 0:
		if minutos == 0:
			global.ponto = 0
