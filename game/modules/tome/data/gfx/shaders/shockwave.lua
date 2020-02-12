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
	frag = "shockwave",
	vert = nil,
	args = {
		tex = { texture = 0 },
		time_factor = time_factor or 4000,
		
		shockwaveWidth = shockwaveWidth or 0.5, --0.1 is very thin wave, 0.9 is thick
		shockwaveSpeed = shockwaveSpeed or 7.0,
		flameIntensity = flameIntensity or 0.4, 

		ellipsoidalFactor = {1.0, 1.0}, --1 is perfect circle, >1 is ellipsoidal
	},
	resetargs = {
		tick_start = function() return core.game.getFrameTime() end,
	},	
	clone = false,
}
