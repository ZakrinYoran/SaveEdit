extends "res://SaveEdit/tools/templates/EditKey.gd" #LineEdit

func _ready():
	self.clip_text = true
	connect("text_entered", self, "_on_text_entered")

func _on_text_entered(text:String):
	data[entry] = text

func enable_editing():
	self.text = data[entry]
	self.editable = true

func disable_editing():
	self.editable = false
	self.text = ""
