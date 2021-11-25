extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ani = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_death_body_entered(body):
	if body.name == "player":
		if ani == false:
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://src/level1-main/level1.tscn")
