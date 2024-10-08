extends OptionButton

var data : Dictionary

func _ready():
	add_to_group("save_edit_crew")
	connect("item_selected", self, "_on_item_selected")
	fill_items()

func fill_items():
	clear()
	for occupation in CurrentGame.occupations:
		add_item(occupation)

func _on_item_selected(item):
	data.occupation = get_item_text(item)

func _on_data_changed(new_data = null, new_entry = ""):
	if new_data: data = new_data
	if new_entry: data = data[new_entry]
	fill_items()
	disabled = false
	for item in items:
		if get_item_text(item) == data.occupation:
			select(item)
			break

func _on_no_target():
	data = {}
	disabled = true
	clear()
