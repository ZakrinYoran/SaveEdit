extends "res://SaveEdit/tools/templates/EditKey.gd" #OptionButton

export (String) var call_group
export (String) var call_func

onready var node = self

func _ready():
	self.clip_text = true
	connect("item_selected", self, "_on_item_selected")

func _on_item_selected(_idx):
	if call_group: get_tree().call_group(call_group, call_func, data, node.text)

func fill_options(last := false):
	node.clear()

	for entry in data: node.add_item(entry)

	var item_count = node.get_item_count()
	if item_count: 
		if last:
			node.selected = item_count-1
			_on_item_selected(item_count-1)
		else: 
			node.selected = 0
			_on_item_selected(0)

	else:
		get_tree().call_group(call_group, "_on_no_target", data)

func enable_editing():
	fill_options()

func disable_editing():
	fill_options()
