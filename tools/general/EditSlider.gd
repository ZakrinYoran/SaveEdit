extends HSlider

export (String) var path = ""
export (String) var entry = ""
export (String) var group_suffix = ""
export (NodePath) var box

var data : Dictionary

func _ready():
	if box:
		box = get_node(box)
		box.connect("value_changed", self, "_on_value_changed")

	add_to_group("save_edit%s" % group_suffix)
	connect("value_changed", self, "_on_value_changed")

func _on_value_changed(new_value):
	data[entry] = new_value
	value = new_value
	if box:
		box.value = new_value

func _on_save_changed():
	_on_data_changed()

func _on_data_changed(target : String = ""):
	data = CurrentGame.state
	if path:
		for category in path.split("."):
			data = data[category]
	if target:
		data = data[target]

	value = data[entry]
	if box: (box.value = data[entry])
