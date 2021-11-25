extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var path = rng.randf_range(1, 2)
	print(path)
	if path >= 1.5:
		$"3-1".show()
		$"3-1".collision_use_parent = false
		$"3-2".hide()
		$"3-2".collision_use_parent = true
	else:
		if path <= 1.5:
			$"3-2".show()
			$"3-2".collision_use_parent = false
			$"3-1".hide()
			$"3-1".collision_use_parent = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
