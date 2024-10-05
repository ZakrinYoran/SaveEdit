extends "res://SaveEdit/tools/templates/EditCategory.gd" #LineEdit

export (NodePath) var selector_node

func _ready():
	self.clip_text = true
	selector_node = get_node(selector_node)
	connect("text_entered", self, "_on_name_changed")

func _on_name_changed(_t = ""):
	data[self.text] = data[current_key]#.duplicate(true)
	data.erase(current_key)
	selector_node.fill_options(true)

func enable_editing():
	self.text = current_key
	self.editable = true

func disable_editing():
	self.editable = false
	self.text = ""
