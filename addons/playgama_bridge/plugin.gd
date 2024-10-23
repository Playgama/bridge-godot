# This file is part of Playgama Bridge.
# 
# Playgama Bridge is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
# 
# Playgama Bridge is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public License
# along with Playgama Bridge. If not, see <https://www.gnu.org/licenses/>.

tool
extends EditorPlugin

const SINGLETON_NAME = "Bridge"
const SINGLETON_PATH = "res://addons/playgama_bridge/bridge.gd"
const POSTPROCESSOR_PLUGIN_PATH = "res://addons/playgama_bridge/postprocessor.gd"
const SETTINGS_PATH = "addons/playgama_bridge/general/"
const SETTINGS_GAME_DISTRIBUTION_GAME_ID_KEY = "game_distribution_game_id"
const SETTINGS_VK_PLAY_GAME_ID_KEY = "vk_play_game_id"
const SETTINGS_Y8_GAME_ID_KEY = "y8_game_id"
const SETTINGS_LAGGED_DEV_ID_KEY = "lagged_dev_id"
const SETTINGS_LAGGED_PUBLISHER_ID_KEY = "lagged_publisher_id"
const SETTINGS_ADSGRAM_BLOCK_ID_KEY = "adsgram_block_id"

func _enter_tree():
	_add_project_settings(SETTINGS_PATH + SETTINGS_GAME_DISTRIBUTION_GAME_ID_KEY, TYPE_STRING, "")
	_add_project_settings(SETTINGS_PATH + SETTINGS_VK_PLAY_GAME_ID_KEY, TYPE_STRING, "")
	_add_project_settings(SETTINGS_PATH + SETTINGS_Y8_GAME_ID_KEY, TYPE_STRING, "")
	_add_project_settings(SETTINGS_PATH + SETTINGS_LAGGED_DEV_ID_KEY, TYPE_STRING, "")
	_add_project_settings(SETTINGS_PATH + SETTINGS_LAGGED_PUBLISHER_ID_KEY, TYPE_STRING, "")
	_add_project_settings(SETTINGS_PATH + SETTINGS_ADSGRAM_BLOCK_ID_KEY, TYPE_STRING, "")
	add_autoload_singleton(SINGLETON_NAME, SINGLETON_PATH)
	add_export_plugin(load(POSTPROCESSOR_PLUGIN_PATH).new())

func _exit_tree():
	remove_autoload_singleton(SINGLETON_NAME)

func _add_project_settings(name, type, default_value, hint = PROPERTY_HINT_NONE, hint_string = ""):
	if ProjectSettings.has_setting(name): 
		return
	
	ProjectSettings.set_setting(name, default_value)
	ProjectSettings.add_property_info({
		"name": name,
		"type": type,
		"hint": hint,
		"hint_string": hint_string
	})
