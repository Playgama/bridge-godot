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

var is_authorization_supported : get = _is_authorization_supported_getter
var is_authorized : get = _is_authorized_getter
var id : get = _id_getter
var name : get = _name_getter
var photos : get = _photos_getter


func _is_authorization_supported_getter():
	return false
	
func _is_authorized_getter():
	return false
	
func _id_getter():
	return null

func _name_getter():
	return null

func _photos_getter():
	return []


func authorize(options = null, callback = null):
	if callback != null:
		callback.call(false)
