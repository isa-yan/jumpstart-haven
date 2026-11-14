extends Label

signal godown(value)

var value = 0

func _ready():
	var coin = get_tree().get_first_node_in_group("coin")
	print("label ready, coin = ", coin)
	coin.coin_collected.connect(coin_hit)
	text = "Collisions: 0"

func coin_hit():
	value += 1
	text = "Collisions: " + str(value)
	godown.emit(value)
