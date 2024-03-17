extends Node2D

export (bool) var shooter
export (Vector2) var target
signal haram

# 1 - 10
export (float) var shootSpeed
var hasCD = true

var arrow_position = Vector2.ZERO
var old_rotation_degrees = 0

func _ready():
	$Timer.wait_time = 2 / shootSpeed
	arrow_position = position
	old_rotation_degrees = rotation_degrees
	$AnimatedSprite/Haram.connect("area_entered", self, "haram")
	$Timer.connect("timeout", self, "cool_down")

func _process(delta):
	if (shooter && hasCD):
		visible = true
		var d = target.angle()
		rotation_degrees = old_rotation_degrees + rad2deg(d) + 90
		position = position + target * (delta * 500)

func haram(area2d):
	hasCD = false
	position = arrow_position
	visible = false

func cool_down():
	hasCD = true
