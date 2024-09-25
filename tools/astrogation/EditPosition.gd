extends Node

export (String) var path
export (String) var entry
export (String) var group_suffix

export (NodePath) var x_node
export (NodePath) var y_node
export (NodePath) var map_node
export (NodePath) var label_node

var data : Dictionary

func _ready():
	if x_node:
		x_node = get_node(x_node)
		x_node.connect("value_changed", self, "_on_value_changed")
	if y_node:
		y_node = get_node(y_node)
		y_node.connect("value_changed", self, "_on_value_changed")
	if map_node:
		map_node = get_node(map_node)
		map_node.connect("gui_input", self, "_on_gui_input")
	if label_node:
		label_node = get_node(label_node)
	add_to_group("save_edit%s" % group_suffix)

func _on_value_changed(_v):
	data[entry] = Vector2(x_node.value, y_node.value)
	set_position()

func set_value():
	var vec = data[entry]
	if x_node: x_node.value = vec.x
	if y_node: y_node.value = vec.y
	set_position()

func _on_save_changed():
	_on_data_changed()

func _on_data_changed(target := ""):
	data = CurrentGame.state
	if path:
		for category in path.split("."):
			data = data[category]
	if target:
		data = data[target]

	if x_node: x_node.editable = true
	if y_node: y_node.editable = true
	if label_node: label_node.visible = true

	set_value()

func _on_gui_input(event : InputEvent):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(1):
		var vec : Vector2 = event.position / map_node.rect_size * 30000000
		if x_node: x_node.value = vec.x
		if y_node: y_node.value = vec.y
		data[entry] = vec

func set_position():
	var vec = data[entry]
	var rec = map_node.rect_size
	if label_node and map_node:
		var position := Vector2(vec.x / 30000000 * rec.x, vec.y / 30000000 * rec.y)

		if position.x < 42: label_node.scale.x = -1
		else: label_node.scale.x = 1
		
		if label_node.position.y < 42: label_node.scale.y = -1
		else: label_node.scale.y = 1

		label_node.position = position 

func _on_no_target():
	data = {}
	if x_node:
		x_node.editable = false
		x_node.value = 0
	if y_node:
		y_node.editable = false
		y_node.value = 0
	if label_node:
		label_node.visible = false
