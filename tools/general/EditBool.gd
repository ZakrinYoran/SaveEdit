extends "res://SaveEdit/tools/templates/EditKey.gd" #Button

func _ready():
	connect("toggled", self, "_on_toggled")

func _on_toggled(new_value):
	data[entry] = new_value

func enable_editing():
	self.pressed = data[entry]
	self.disabled = false

func disable_editing():
	self.disabled = true
	self.pressed = false
