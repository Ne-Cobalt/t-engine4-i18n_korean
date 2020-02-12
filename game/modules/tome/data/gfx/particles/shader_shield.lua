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

base_size = 64

local r = r or 1
local g = g or 1
local b = b or 1
local a = a or 1

return { blend_mode = blend and core.particles.BLEND_SHINY or nil, system_rotation = dir or 0, system_rotationv = rotspeed or 0, generator = function()
	return {
		trail = 0,
		life = 10,
		size = 2*38 * (size_factor or 1), sizev = 0, sizea = 0,

		x = (x or 0) * 64, xv = 0, xa = 0,
		y = (y or 0) * 64, yv = 0, ya = 0,
		dir = 0, dirv = dirv, dira = 0,
		vel = 0, velv = 0, vela = 0,

		r = r, rv = 0, ra = 0,
		g = g, gv = 0, ga = 0,
		b = b, bv = 0, ba = 0,
		a = a, av = -0.02, aa = 0.005,
	}
end, },
function(self)
	self.ps:emit(1)
end,
1,
"particles_images/"..(img or "shield7")
