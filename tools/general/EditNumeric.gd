extends "res://SaveEdit/tools/templates/EditKey.gd"

export (Array, NodePath) var node_paths
var nodes : Array

export (float) var range_min = 0.0
export (float) var range_max = 1.0
export (float) var range_step = 1.0
#export (Vector3) var value_range = Vector3(0, 1, 1)

func _ready():
	for node in node_paths:
		node = get_node(node)
		nodes.append(node)
		node.connect("value_changed", self, "_on_value_changed")
		node.min_value = range_min
		node.max_value = range_max
		node.step = range_step

func _on_value_changed(new_value):
	for node in nodes: node.value = new_value
	data[entry] = new_value

func enable_editing():
	for node in nodes:
		node.value = data[entry]
		node.editable = true

func disable_editing():
	for node in nodes:
		node.value = 0
		node.editable = false
