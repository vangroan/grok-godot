## Common utility functions.
class_name GuiUtil extends Object

enum Modifier { MOD_NONE = 0, MOD_CTRL = 1, MOD_ALT = 2, MOD_SHIFT = 4 }

## Adds a shortcut hotkey to PopupMenu item.
static func add_shortcut(menu: PopupMenu, id: int, keycode: Key, mod: Modifier = Modifier.MOD_NONE):
	var shortcut = Shortcut.new()
	var input_event = InputEventKey.new()
	input_event.keycode = keycode
	
	if mod & Modifier.MOD_CTRL != 0:
		input_event.command_or_control_autoremap = true
	
	if mod & Modifier.MOD_ALT != 0:
		input_event.alt_pressed = true
	
	if mod & Modifier.MOD_SHIFT != 0:
		input_event.shift_pressed = true
	
	shortcut.events.append(input_event)
	menu.set_item_shortcut(id, shortcut)
