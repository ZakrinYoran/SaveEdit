extends Node


export (String) var path = ""
export (String) var entry = ""
export (String) var group_suffix = ""
export (NodePath) var date_node
export (NodePath) var time_node

var data : Dictionary

func _ready():
	if date_node:
		date_node = get_node(date_node)
		date_node.connect("text_entered", self, "_on_text_entered")
	if time_node:
		time_node = get_node(time_node)
		time_node.connect("text_entered", self, "_on_text_entered")
	add_to_group("save_edit%s" % group_suffix)

func _on_text_entered(_text:String):
	var date := Time.get_unix_time_from_datetime_string(date_node.text)
	var time := Time.get_unix_time_from_datetime_string(time_node.text)
	data[entry] = date + time

func _on_save_changed():
	_on_data_changed()

func _on_data_changed(target := ""):
	data = CurrentGame.state
	if path:
		for category in path.split("."):
			data = data[category]
	if target:
		data = data[target]

	if date_node: date_node.text = Time.get_date_string_from_unix_time(data[entry])
	if time_node: time_node.text = Time.get_time_string_from_unix_time(data[entry])
