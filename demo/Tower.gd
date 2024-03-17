extends Node2D

signal shooter
signal unShooter

# 攻击范围
export (float) var attack_range
# 攻击冷却
export (float) var cd

# 炮塔范围内存在的敌人
var enemys = []

func _ready():
	# cd 计时
	$CoolDown.start()
	$AnimatedSprite.play("idle")
	# 设置炮塔的攻击范围
	$Attack/CollisionShape2D.shape.radius = attack_range
	$Attack.connect("area_entered", self, "svae_enemy")
	$Attack.connect("area_exited", self, "del_enemy")

func _process(delta):
	pass


func svae_enemy(area2d):
	enemys.append(area2d.get_parent())
	
func del_enemy(area2d):
	var node = area2d.get_parent()
	enemys.erase(node)
