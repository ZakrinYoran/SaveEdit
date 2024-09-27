extends "res://SaveEdit/tools/templates/EditCategory.gd" #Button

export (NodePath) var selector_node

func _ready():
	if selector_node: selector_node = get_node(selector_node)
	connect("pressed", self, "_on_button_pressed")

func _on_button_pressed():
	disable_editing()
	if data: data.clear()
	if selector_node: selector_node.fill_options()

func enable_editing():
	self.disabled = false

func disable_editing():
	self.disabled = true
