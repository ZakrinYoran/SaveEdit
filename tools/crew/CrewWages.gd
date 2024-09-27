extends "res://SaveEdit/tools/templates/EditCategory.gd"

export (NodePath) var date_node

func _ready():
	if date_node: date_node = get_node(date_node)

func enable_editing():
	if date_node:
		date_node.data = CurrentGame.state.wages
		date_node.entry = current_key
		date_node.enable_editing()

func disable_editing():
	date_node.data = null
	date_node.entry = null
	date_node.disable_editing()
