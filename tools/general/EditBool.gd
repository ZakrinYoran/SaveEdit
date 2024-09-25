extends CheckButton


export (String) var path = ""
export (String) var entry = ""
export (String) var group_suffix = ""

var data : Dictionary

func _ready():
	add_to_group("save_edit%s" % group_suffix)
	connect("toggled", self, "_on_toggled")

func _on_toggled(new_value):
	data[entry] = new_value

func _on_save_changed():
	_on_data_changed()

func _on_data_changed(target : String = ""):
	data = CurrentGame.state
	if path:
		for category in path.split("."):
			data = data[category]
	if target:
		data = data[target]

	pressed = data[entry]
