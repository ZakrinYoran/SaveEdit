extends Label


func _ready():
	add_to_group("save_edit_astrogation")

func _on_data_changed(what):
	text = CurrentGame.state.astrogation[what]
