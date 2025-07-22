extends "res://scenes/game/user_unlocks.gd"

const PPEB_SFP_LOG_UU := "ppeb-savefoundpotions:user_unlocks"
onready var ppebSFP = get_node("/root/ModLoader/ppeb-savefoundpotions")

var potions_save_file = "user://potionsdata.save"

func save_data():
	.save_data()

	ModLoaderLog.info("Saving potion data!", PPEB_SFP_LOG_UU)

	if ppebSFP.unlocked_potions.size() == 0:
		return

	var save_handle = File.new()
	save_handle.open(potions_save_file, File.WRITE)
	save_handle.store_line(to_json(ppebSFP.unlocked_potions))
	save_handle.close()



func load_data():
	ModLoaderLog.info("Loading potion data!", PPEB_SFP_LOG_UU)
	var save_handle = File.new()

	if save_handle.file_exists(potions_save_file):
		save_handle.open(potions_save_file, File.READ)
		var parsed = parse_json(save_handle.get_line())
		if parsed != null:
			ppebSFP.unlocked_potions = parsed

		save_handle.close()

	.load_data()
