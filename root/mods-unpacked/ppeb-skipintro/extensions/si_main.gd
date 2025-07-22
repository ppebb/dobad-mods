extends "res://scenes/main.gd"

func continue_loading():
	GlobalSettings.store_default_keybinds()
	load_settings()
	UserUnlocks.load_data()

	$ViewportContainer / Viewport / ShaderComp_bg.visible = false
	$ShaderComp_lbl.visible = false

	if $FpsTimer.connect("timeout", self, "_update_fps"):
		pass

	if UserUnlocks.connect("unlocks_reset", self, "_on_unlocks_reset"):
		pass

	if $InGameMenuTimer.connect("timeout", self, "_in_game_menu_ready"):
		pass

	manual.hide()

	open_main_menu()
