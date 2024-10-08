extends "res://SaveEdit/tools/templates/EditKey.gd"

export (NodePath) var x_node
export (NodePath) var y_node
export (NodePath) var map_node
export (NodePath) var label_node

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

func _on_value_changed(_v):
	data[entry] = Vector2(x_node.value * 10000, y_node.value * 10000)
	set_marker_position()

func set_value():
	var vec = data[entry]
	if x_node: x_node.value = vec.x / 10000.0
	if y_node: y_node.value = vec.y / 10000.0
	set_marker_position()

func _on_gui_input(event : InputEvent):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(1):
		var vec : Vector2 = event.position / map_node.rect_size * 30000000
		if x_node: x_node.value = vec.x / 10000.0
		if y_node: y_node.value = vec.y / 10000.0
		data[entry] = vec

func set_marker_position():
	var vec = data[entry]
	var rec = map_node.rect_size
	if label_node and map_node:
		var position := Vector2(vec.x / 30000000 * rec.x, vec.y / 30000000 * rec.y)

		if position.x < 42: label_node.scale.x = -1
		else: label_node.scale.x = 1
		
		if label_node.position.y < 42: label_node.scale.y = -1
		else: label_node.scale.y = 1

		label_node.position = position 

func enable_editing():
	if x_node: x_node.editable = true
	if y_node: y_node.editable = true
	if label_node: label_node.visible = true

	set_value()

func disable_editing():
	if x_node:
		x_node.editable = false
		x_node.value = 0
	if y_node:
		y_node.editable = false
		y_node.value = 0
	if label_node:
		label_node.visible = false
