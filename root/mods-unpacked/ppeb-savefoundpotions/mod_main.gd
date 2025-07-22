extends Node

const PPEB_SFP_DIR := "ppeb-savefoundpotions"
const PPEB_SFP_LOG_MAIN := "ppeb-savefoundpotions:main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""

var unlocked_potions = [];

func _init() -> void:
	ModLoaderLog.info("Init", PPEB_SFP_LOG_MAIN)
	mod_dir_path = ModLoaderMod.get_unpacked_dir().plus_file(PPEB_SFP_DIR)

	install_script_extensions()


func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.plus_file("extensions")

	# Handles saving and loading potion data.
	ModLoaderMod.install_script_extension(extensions_dir_path.plus_file("sfp_user_unlocks.gd"))

	# Hook into unlocks to persist potions when picked up and initialize them
	# as discovered on run reset.
	ModLoaderMod.install_script_extension(extensions_dir_path.plus_file("sfp_play_session_data_manager.gd"))

	# Hook into potion drinking to unlock potions.
	ModLoaderMod.install_script_extension(extensions_dir_path.plus_file("sfp_player.gd"))


func _ready() -> void:
	ModLoaderLog.info("Ready", PPEB_SFP_LOG_MAIN)


func unlock_potion(potion_id: String):
	if !unlocked_potions.has(potion_id):
		unlocked_potions.push_back(potion_id)
		UserUnlocks.save_data()
