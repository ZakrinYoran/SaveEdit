extends Control

export (String) var path
export (String) var group

var data

func _ready():
	add_to_group("save_edit%s" % group)

func _on_save_changed():
	data = CurrentGame.state
	if path: for category in path.split("."):
		data = data[category]
	_on_data_changed()

func _on_data_changed(new_data = null, new_key = ""):
	print("%s missing override for `_on_data_changed()`" % self)
	enable_editing()

func _on_no_target(new_data = null):
	print("%s missing override for `_on_no_target()`" % self)
	disable_editing()

func enable_editing():
	print("%s missing override for `enable_editing()`" % self)

func disable_editing():
	print("%s missing override for `disable_editing()`" % self)
