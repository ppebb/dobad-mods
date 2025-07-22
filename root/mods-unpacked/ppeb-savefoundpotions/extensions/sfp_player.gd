extends "res://scenes/characters/player/player.gd"

const PPEB_SFP_LOG_PLAYER:= "ppeb-savefoundpotions:player"
onready var ppebSFP = get_node("/root/ModLoader/ppeb-savefoundpotions")

func drink_potion(_potion):
	ModLoaderLog.info("Unlocking potion of id %s" % _potion.potion_id, PPEB_SFP_LOG_PLAYER)

	ppebSFP.unlock_potion(_potion.potion_id)
	.drink_potion(_potion)
