extends CanvasLayer


func _ready():
	var baseLevels = get_tree().get_nodes_in_group("base_level")
	if (baseLevels.size() > 0):
		baseLevels[0].connect("coin_total_changed", self, "on_coin_total")
		
func on_coin_total(coin):
	$MarginContainer/HBoxContainer/CoinLabel.text = str(coin)
