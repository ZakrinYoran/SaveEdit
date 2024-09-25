extends OptionButton

var data : Dictionary

func _ready():
	add_to_group("save_edit_crew")
	connect("item_selected", self, "_on_item_selected")
	for agenda in Agenda.agendaPool:
		add_item(agenda)


func _on_item_selected(item):
	data.agenda = get_item_text(item)

func _on_data_changed(who):
	data = CurrentGame.state.crew[who]
	for item in items:
		if get_item_text(item) == data.agenda:
			select(item)
			break
