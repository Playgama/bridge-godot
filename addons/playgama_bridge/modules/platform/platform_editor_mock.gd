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

var id : get = _id_getter
var payload : get = _payload_getter
var language : get = _language_getter
var tld : get = _tld_getter

func _id_getter():
	return "mock"

func _payload_getter():
	return null

func _language_getter():
	return "en"

func _tld_getter():
	return null

func send_message(message):
	pass

func get_server_time(callback):
	if callback != null:
		callback.call(Time.get_unix_time_from_system() * 1000)
