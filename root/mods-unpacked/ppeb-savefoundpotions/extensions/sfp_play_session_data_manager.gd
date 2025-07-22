extends "res://scenes/game/play_session_data_manager.gd"

const PPEB_SFP_LOG_PSDM := "ppeb-savefoundpotions:play_session_data_manager"
onready var ppebSFP = get_node("/root/ModLoader/ppeb-savefoundpotions")

func init_potions():
	.init_potions()

	ModLoaderLog.info("Initializing potions with loaded data", PPEB_SFP_LOG_PSDM)

	for i in ppebSFP.unlocked_potions:
		potions[i].discovered = true


func potion_discovered(_potion_id):
	ModLoaderLog.info("Unlocking potion of id %s" % _potion_id, PPEB_SFP_LOG_PSDM)

	ppebSFP.unlock_potion(_potion_id)
	.potion_discovered(_potion_id)
