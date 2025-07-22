extends Node

const PPEB_SI_DIR := "ppeb-skipintro"
const PPEB_SI_LOG_MAIN := "ppeb-skipintro:main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""

var unlocked_potions = [];

func _init() -> void:
	ModLoaderLog.info("Init", PPEB_SI_LOG_MAIN)
	mod_dir_path = ModLoaderMod.get_unpacked_dir().plus_file(PPEB_SI_DIR)

	install_script_extensions()


func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.plus_file("extensions")

	ModLoaderMod.install_script_extension(extensions_dir_path.plus_file("si_main.gd"))


func _ready() -> void:
	ModLoaderLog.info("Ready", PPEB_SI_LOG_MAIN)


func unlock_potion(potion_id: String):
	if !unlocked_potions.has(potion_id):
		unlocked_potions.push_back(potion_id)
		UserUnlocks.save_data()
