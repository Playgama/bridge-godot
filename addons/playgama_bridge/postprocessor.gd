extends EditorExportPlugin

const INDEX_FILE_NAME = "index.html"
const JS_SDK_FILE_NAME = "playgama-bridge.js"
const JS_SDK_CONFG_FILE_NAME = "playgama-bridge-config.json"
const JS_SDK_PATH = "res://addons/playgama_bridge/template/"

var _path = null

func _export_begin(features, is_debug, path, flags):
	if features.has("web"):
		_path = path
		
		_copy_file(JS_SDK_FILE_NAME)
		_copy_file(JS_SDK_CONFG_FILE_NAME)

func _copy_file(file_name):
	var file_from = File.new()
	if file_from.open(JS_SDK_PATH + file_name, File.READ) != OK:
		push_error("Bridge: failed to read " + JS_SDK_PATH + file_name)
		return
	
	var file_to = File.new()
	if file_to.open(_path.get_base_dir() + "/" + file_name, File.WRITE) != OK:
		push_error("Bridge: failed to write " + file_name)
		file_from.close()
		return
	
	file_to.store_string(file_from.get_as_text())
	file_from.close()
	file_to.close()
