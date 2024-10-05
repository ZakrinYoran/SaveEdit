extends "res://SaveEdit/tools/templates/EditBase.gd"

export (String) var entry

func _on_data_changed(new_data = null, new_key = ""):
	if new_data: data = new_data
	if new_key: data = data[new_key]

	enable_editing()

func _on_key_changed(new_data = null, new_key = ""):
	if new_data: data = new_data
	if new_key: entry = new_key

	enable_editing()

func _on_no_target(new_data = null):
	data = null
	disable_editing()
