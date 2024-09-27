extends "res://SaveEdit/tools/templates/EditKey.gd"

export (NodePath) var date_node
export (NodePath) var time_node
export (NodePath) var button_node

func _ready():
	if date_node:
		date_node = get_node(date_node)
		date_node.connect("text_entered", self, "_on_text_entered")
	if time_node:
		time_node = get_node(time_node)
		time_node.connect("text_entered", self, "_on_text_entered")
	if button_node:
		button_node = get_node(button_node)
		button_node.connect("pressed", self, "_on_button_pressed")

func _on_button_pressed():
	data[entry] = CurrentGame.state.time
	set_text()

func _on_text_entered(_text:String):
	var date := Time.get_unix_time_from_datetime_string(date_node.text)
	var time := Time.get_unix_time_from_datetime_string(time_node.text)
	data[entry] = date + time

func set_text():
	if date_node: date_node.text = Time.get_date_string_from_unix_time(data[entry])
	if time_node: time_node.text = Time.get_time_string_from_unix_time(data[entry])

func enable_editing():
	if date_node: date_node.editable = true
	if time_node: time_node.editable = true
	if button_node: button_node.disabled = false
	set_text()

func disable_editing():
	if date_node:
		date_node.editable = false
		date_node.text = ""
	if time_node:
		time_node.editable = false
		time_node.text = ""
	if button_node:
		button_node.disabled = true
