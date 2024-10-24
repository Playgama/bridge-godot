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

func convert_to_js(data):
	var data_type = typeof(data)
	
	match data_type:
		TYPE_DICTIONARY:
			var js_object = JavaScriptBridge.create_object("Object")
			
			for key in data:
				js_object[key] = convert_to_js(data[key])
			
			return js_object
		
		TYPE_ARRAY:
			var js_array = JavaScriptBridge.create_object("Array")
			
			for i in range(data.size()):
				js_array[i] = convert_to_js(data[i])
			
			return js_array
		
		TYPE_STRING:
			return data
		
		TYPE_BOOL:
			return data
		
		TYPE_INT:
			return data
	
	return null
