extends MenuBar


const ITEM_FILE_NEW_ID = 0
const ITEM_FILE_OPEN_ID = 1
const ITEM_FILE_QUIT_ID = 6


@onready var file_menu: PopupMenu = $File as PopupMenu
@onready var open_dialog: FileDialog = $File/OpenDialog as FileDialog
@onready var quit_confirm: ConfirmationDialog = $File/QuitConfirm as ConfirmationDialog
@onready var text_edit: TextEdit = $/root/Main/VBoxContainer/TextEdit as TextEdit
@onready var context_label: Label = $/root/Main/VBoxContainer/StatusBar/ContextLabel as Label


func _ready():
	file_menu.id_pressed.connect(on_file_menu_id_pressed)
	open_dialog.file_selected.connect(on_open_dialog_file_selected)
	quit_confirm.confirmed.connect(on_quit_confirmed)
	
	GuiUtil.add_shortcut(file_menu, ITEM_FILE_NEW_ID, KEY_N, GuiUtil.Modifier.MOD_CTRL)
	GuiUtil.add_shortcut(file_menu, ITEM_FILE_OPEN_ID, KEY_O, GuiUtil.Modifier.MOD_CTRL)
	GuiUtil.add_shortcut(file_menu, ITEM_FILE_QUIT_ID, KEY_Q, GuiUtil.Modifier.MOD_CTRL)


func on_file_menu_id_pressed(id: int):
	print("File Menu Pressed: ", id)
	match id:
		ITEM_FILE_OPEN_ID:
			open_dialog.popup()
		ITEM_FILE_QUIT_ID:
			quit_confirm.popup()


func on_open_dialog_file_selected(path: String):
	context_label.text = "Loading..."
	var file = FileAccess.open(path, FileAccess.READ)
	text_edit.text = file.get_as_text()
	context_label.text = path


func on_quit_confirmed():
	get_tree().quit()
