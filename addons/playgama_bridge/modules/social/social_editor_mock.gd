# This file is part of Playgama Bridge.
#
# Playgama Bridge is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Playgama Bridge is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Playgama Bridge. If not, see <https://www.gnu.org/licenses/>.

var is_share_supported setget , _is_share_supported_getter
var is_join_community_supported setget , _is_join_community_supported_getter
var is_invite_friends_supported setget , _is_invite_friends_supported_getter
var is_create_post_supported setget , _is_create_post_supported_getter
var is_add_to_favorites_supported setget , _is_add_to_favorites_supported_getter
var is_add_to_home_screen_supported setget , _is_add_to_home_screen_supported_getter
var is_external_links_allowed setget , _is_external_links_allowed_getter
var is_rate_supported setget , _is_rate_supported_getter


func _is_share_supported_getter():
	return false

func _is_join_community_supported_getter():
	return false

func _is_invite_friends_supported_getter():
	return false

func _is_create_post_supported_getter():
	return false

func _is_add_to_favorites_supported_getter():
	return false

func _is_add_to_home_screen_supported_getter():
	return false

func _is_external_links_allowed_getter():
	return false

func _is_rate_supported_getter():
	return false


func share(options = null, callback = null):
	if callback != null:
		callback.call_func(false)

func join_community(options = null, callback = null):
	if callback != null:
		callback.call_func(false)

func invite_friends(options = null, callback = null):
	if callback != null:
		callback.call_func(false)

func create_post(options = null, callback = null):
	if callback != null:
		callback.call_func(false)

func add_to_favorites(callback = null):
	if callback != null:
		callback.call_func(false)

func add_to_home_screen(callback = null):
	if callback != null:
		callback.call_func(false)

func rate(callback = null):
	if callback != null:
		callback.call_func(false)
