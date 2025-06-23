extends Node

@onready var coin_collected: Label = $Score/coinCollected

var coins = 0

func add_point():
	coins += 1
	coin_collected.text = "Score: " + str(coins)
	
