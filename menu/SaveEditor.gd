extends Popup

export (NodePath) var FileExplorer
export (NodePath) var AsteroidField
export (NodePath) var AsteroidMap

var import : bool = false

func _ready():
	FileExplorer = get_node(FileExplorer)
	AsteroidField = get_node(AsteroidField)
	AsteroidMap = get_node(AsteroidMap)
	FileExplorer.connect("file_selected", self, "_on_file_selected")

func _on_SaveGame_pressed():
	CurrentGame.state.hash = 0
	CurrentGame.saveToFile()
	hide()

func _on_ExportGame_pressed():
	import = false
	FileExplorer.mode = FileDialog.MODE_SAVE_FILE
	FileExplorer.popup()

func _on_ImportGame_pressed():
	import = true
	FileExplorer.mode = FileDialog.MODE_OPEN_FILE
	FileExplorer.popup()

func _on_file_selected(path : String):
	if import:
		loadFromRaw(path)
		get_tree().call_group("save_edit", "_on_save_changed")
	else:
		saveToRaw(path)

func loadFromRaw(path : String):
	CurrentGame.init()
	var file := File.new()
	file.open(path, File.READ)
	var data := file.get_line()
	file.close()
	CurrentGame.state = parse_json(data)
	CurrentGame.state.hash = 0
	CurrentGame.validateState()

func saveToRaw(path : String):
	var file := File.new()
	CurrentGame.state.hash = 0
	file.open(path, File.WRITE)
#	file.store_line(JSON.print(CurrentGame.state, "\t"))
	file.store_line(to_json(CurrentGame.state))
	file.close()

func loadForEditing():
	CurrentGame.init()
	if not CurrentGame.hasSaveGame():
		CurrentGame.state = CurrentGame.initialState.duplicate(true)
		return 
	var file := File.new()
	file.open_encrypted_with_pass(CurrentGame.saveFile, File.READ, CurrentGame.password)
	var data := file.get_line()
	file.close()
	CurrentGame.state = parse_json(data)
	CurrentGame.state.hash = 0
	CurrentGame.validateState()

var lastFocus = null
func _about_to_show():
	lastFocus = get_focus_owner()
	AsteroidField.set_process(false)
	AsteroidMap.set_process(false)
	loadForEditing()
	get_tree().call_group("save_edit", "_on_save_changed")

func _on_SaveEditor_popup_hide():
	AsteroidField.set_process(true)
	AsteroidMap.set_process(true)









func _on_resize():
	if visible:
		var viewportSize = get_parent().rect_size
		var size = rect_size
		rect_position = (viewportSize - size) / 2

func cancel():
	hide()
	refocus()

func refocus():
	if lastFocus and lastFocus.has_method("grab_focus"):
		lastFocus.grab_focus()
	else :
		Debug.l("I have no focus to fall back to!")

func _unhandled_input(event):
	if visible and event.is_action_pressed("ui_cancel"):
		cancel()
		get_tree().set_input_as_handled()



