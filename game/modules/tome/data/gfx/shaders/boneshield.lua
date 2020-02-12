-- ToME - Tales of Maj'Eyal
-- Copyright (C) 2009 - 2019 Nicolas Casalini
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- Nicolas Casalini "DarkGod"
-- darkgod@te4.org

return {
	frag = "boneshield",
	vert = nil,
	args = {
		tex = { texture = 0 },
		ellipsoidalFactor = {1,1}, --1 is perfect circle, >1 is ellipsoidal
		side = noup or 0,
		verticalIntensityAdjust = 0,
		scrollingSpeed = scrollingSpeed or 0.004,
	},
	resetargs = {
		chargesCount = function(self) return self.args.chargesCount or 0 end,
	},
	clone = true,
}
