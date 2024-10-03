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

signal visibility_state_changed
var visibility_state setget , _visibility_state_getter

func _visibility_state_getter():
	return Bridge.VisibilityState.VISIBLE
