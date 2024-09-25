extends OptionButton

export (String) var category
export (String) var call_group
export (String) var call_func
var object : String

func _ready():
	add_to_group("save_edit")
	connect("item_selected", self, "_on_item_selected")

func _on_item_selected(idx):
	object = get_item_text(idx)
	get_tree().call_group(call_group, call_func, object)

func fill_options(last := false):
	clear()
	for entry in CurrentGame.state[category]: add_item(entry)
	if get_item_count(): 
		if last:
			selected = get_item_count()-1
			_on_item_selected(get_item_count()-1)
		else: 
			selected = 0
			_on_item_selected(0)
	else:
		get_tree().call_group(call_group, "_on_no_target")

func _on_save_changed():
	fill_options()
