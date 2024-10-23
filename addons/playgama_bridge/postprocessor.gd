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

extends EditorExportPlugin

const INDEX_FILE_NAME = "index.html"
const JS_SDK_FILE_NAME = "playgama-bridge.js"
const JS_SDK_PATH = "res://addons/playgama_bridge/template/" + JS_SDK_FILE_NAME
const SETTINGS_PATH = "addons/playgama_bridge/general/"
const SETTINGS_GAME_DISTRIBUTION_GAME_ID_KEY = "game_distribution_game_id"
const SETTINGS_VK_PLAY_GAME_ID_KEY = "vk_play_game_id"
const SETTINGS_Y8_GAME_ID_KEY = "y8_game_id"
const SETTINGS_LAGGED_DEV_ID_KEY = "lagged_dev_id"
const SETTINGS_LAGGED_PUBLISHER_ID_KEY = "lagged_publisher_id"
const SETTINGS_ADSGRAM_BLOCK_ID_KEY = "adsgram_block_id"

var _path = null

func _export_begin(features, is_debug, path, flags):
	if features.has("web"):
		_path = path
		
		var file_from = File.new()
		file_from.open(JS_SDK_PATH, File.READ)
		
		var file_to = File.new()
		file_to.open(path.get_base_dir() + "/" + JS_SDK_FILE_NAME, File.WRITE)
		file_to.store_string(file_from.get_as_text())
		
		file_from = null
		file_to = null

func _export_end():
	if _path == null:
		return
	
	var game_distribution_game_id = ""
	var vk_play_game_id = ""
	var y8_game_id = ""
	var lagged_dev_id = ""
	var lagged_publisher_id = ""
	var adsgram_block_id = ""
	
	if ProjectSettings.has_setting(SETTINGS_PATH + SETTINGS_GAME_DISTRIBUTION_GAME_ID_KEY):
		game_distribution_game_id = ProjectSettings.get(SETTINGS_PATH + SETTINGS_GAME_DISTRIBUTION_GAME_ID_KEY)
	
	if ProjectSettings.has_setting(SETTINGS_PATH + SETTINGS_VK_PLAY_GAME_ID_KEY):
		vk_play_game_id = ProjectSettings.get(SETTINGS_PATH + SETTINGS_VK_PLAY_GAME_ID_KEY)
	
	if ProjectSettings.has_setting(SETTINGS_PATH + SETTINGS_Y8_GAME_ID_KEY):
		y8_game_id = ProjectSettings.get(SETTINGS_PATH + SETTINGS_Y8_GAME_ID_KEY)

	if ProjectSettings.has_setting(SETTINGS_PATH + SETTINGS_LAGGED_DEV_ID_KEY):
		lagged_dev_id = ProjectSettings.get(SETTINGS_PATH + SETTINGS_LAGGED_DEV_ID_KEY)

	if ProjectSettings.has_setting(SETTINGS_PATH + SETTINGS_LAGGED_PUBLISHER_ID_KEY):
		lagged_publisher_id = ProjectSettings.get(SETTINGS_PATH + SETTINGS_LAGGED_PUBLISHER_ID_KEY)
	
	if ProjectSettings.has_setting(SETTINGS_PATH + SETTINGS_ADSGRAM_BLOCK_ID_KEY):
		adsgram_block_id = ProjectSettings.get(SETTINGS_PATH + SETTINGS_ADSGRAM_BLOCK_ID_KEY)
	
	var index = File.new()
	index.open(_path.get_base_dir() + "/" + INDEX_FILE_NAME, File.READ_WRITE)
	
	var content = index.get_as_text()
	content = content.format({"game_distribution_game_id":game_distribution_game_id})
	content = content.format({"vk_play_game_id":vk_play_game_id})
	content = content.format({"y8_game_id":y8_game_id})
	content = content.format({"lagged_dev_id":lagged_dev_id})
	content = content.format({"lagged_publisher_id":lagged_publisher_id})
	content = content.format({"adsgram_block_id":adsgram_block_id})
	
	index.store_string(content)
	index = null
