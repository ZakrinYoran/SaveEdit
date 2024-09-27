extends "res://SaveEdit/tools/templates/EditBase.gd"

var current_key : String

func _on_data_changed(new_data = null, new_key = ""):
	if new_data: data = new_data
	if new_key: current_key = new_key

	enable_editing()

func _on_no_target(new_data = null):
	data = null
	current_key = ""
	disable_editing()
