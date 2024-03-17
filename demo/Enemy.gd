extends PathFollow2D

signal die(coin, node)

export (int) var coin

var speed = 30
var blood = 100


func _ready():
	$Haram.connect("area_entered", self, "on_haram")

func _process(delta):
	var direction = rad2deg(get_rotation())
	if (85<direction && direction<95):
		$AnimatedSprite.play("walk_down")
		$AnimatedSprite.rotation_degrees = -90
	if (-5<direction && direction<5):
		$AnimatedSprite.play("walk_right")
		$AnimatedSprite.rotation = 0
	if (-95<direction && direction<-85):
		$AnimatedSprite.rotation_degrees = 90
		$AnimatedSprite.play("walk_up")
	
	offset = offset + delta * speed
	if (blood <= 0):
		emit_signal("die", coin, self)

func on_haram(area2d):
	blood = blood - 10
