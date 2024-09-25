extends RichTextLabel


func _ready():
	add_to_group("save_edit_factions")

func _on_data_changed(what):
	text = CurrentGame.state.factions[what]
