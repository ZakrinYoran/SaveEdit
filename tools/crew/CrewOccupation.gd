extends OptionButton

var data : Dictionary

func _ready():
	add_to_group("save_edit_crew")
	connect("item_selected", self, "_on_item_selected")
	for occupation in CurrentGame.occupations:
		add_item(occupation)


func _on_item_selected(item):
	data.occupation = get_item_text(item)

func _on_data_changed(who):
	data = CurrentGame.state.crew[who]
	for item in items:
		if get_item_text(item) == data.occupation:
			select(item)
			break
