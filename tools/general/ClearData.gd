extends Node


export (String) var data
export (String, "Array", "Dictionary") var type

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "_on_pressed")

func _on_pressed():
	match type:
		"Array":
			CurrentGame.state[data] = []
		"Dictionary":
			CurrentGame.state[data] = {}
