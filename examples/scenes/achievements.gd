extends DetailedSceneBase


onready var is_achievements_supported_label = $MarginContainer2/VBoxContainer/IsAchievementsSupported
onready var is_get_list_supported_label = $MarginContainer2/VBoxContainer/IsGetListSupported
onready var is_native_popup_supported_label = $MarginContainer2/VBoxContainer/isNativePopupSupported
onready var achievement_key_input = $MarginContainer2/VBoxContainer/HBoxContainer2/AchievementKeyInput
onready var achievement_name_input = $MarginContainer2/VBoxContainer/HBoxContainer2/AchievementNameInput



func _ready():
	is_achievements_supported_label.text = "Is Achievements Supported: " + str(Bridge.achievements.is_supported)
	is_get_list_supported_label.text = "Is Get List Supported: " + str(Bridge.achievements.is_get_list_supported)
	is_native_popup_supported_label.text = "Is Native Popup Supported: " + str(Bridge.achievements.is_native_popup_supported)


func _on_unlock_button_pressed():
	var options
	
	match Bridge.platform.id:
		"y8":
			options = {
				"achievementkey": achievement_key_input.text,
				"achievement": achievement_name_input.text
			}
		"lagged":
			options = {
				"achievement": achievement_key_input.text,
			}
	
	Bridge.achievements.unlock(options, funcref(self, "_on_unlock_completed"))
	
func _on_unlock_completed(success):
	print(success)



func _on_get_list_button_pressed():
	var options
	
	Bridge.achievements.get_list(options, funcref(self, "_on_get_list_completed"))
	
func _on_get_list_completed(success, list):
	print(success)

	match Bridge.platform.id:
		"y8":
			for item in list:
				print("achievementid:" + str(item.achievementid))
				print("achievement:" + str(item.achievement))
				print("achievementkey:" + str(item.achievementkey))
				print("description:" + str(item.description))
				print("icon:" + str(item.icon))
				print("difficulty:" + str(item.difficulty))
				print("secret:" + str(item.secret))
				print("awarded:" + str(item.awarded))
				print("game:" + str(item.game))
				print("link:" + str(item.link))
				print("playerid:" + str(item.playerid))
				print("playername:" + str(item.playername))
				print("lastupdated:" + str(item.lastupdated))
				print("date:" + str(item.date))
				print("rdate:" + str(item.rdate))


func _on_show_native_popup_button_pressed():
	var options
	
	Bridge.achievements.show_native_popup(options, funcref(self, "_on_show_native_popup_completed"))
	
func _on_show_native_popup_completed(success):
	print(success)
