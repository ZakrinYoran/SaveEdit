extends Node

export (String) var data

func _ready():
	connect("pressed", self, "_on_pressed")

func _on_pressed():
	CurrentGame.state[data] = CurrentGame.initialState[data]
