extends Node2D

signal coin_total_changed

var coin = 0
var enemy_num = 5

func _ready():
	$Tower.connect("shooter", self, "on_shooter")
	$Tower.connect("unShooter", self, "on_un_shooter")
	

func _process(delta):
	var enemys = get_tree().get_nodes_in_group("enemys")
	if (enemys.size() != 0):
		var dir = enemys[0].position - $Arrow.position
		dir = dir.normalized()
		$Arrow.target = dir


func on_shooter():
	$Arrow.visible = true
	$Arrow.position = $Tower.position
	$Arrow.shooter = true
	$Arrow/Timer.start()
	
func on_un_shooter():
	$Arrow.visible = false
	$Arrow.shooter = false


func _on_Timer_timeout():
	if (enemy_num >= 0):
		var enemy = load("res://Enemy.tscn").instance()
		$Path2D.add_child(enemy)
		enemy.connect("die", self, "on_enemy_die")
		enemy_num -= 1

func on_enemy_die(enemy_coin, node):
	coin += enemy_coin
	node.queue_free()
	emit_signal("coin_total_changed", coin)
