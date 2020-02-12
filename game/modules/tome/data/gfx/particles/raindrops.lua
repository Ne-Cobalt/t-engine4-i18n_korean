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

dir = math.rad(110)

return { generator = function()
	local x, y = rng.range(-width/2, width), rng.range(-height/2, height)
	local vel = rng.float(60, 120)
	local dir = dir + math.rad(rng.float(-5, 5))

	return {
		trail = 1,
		life = 30,
		size = rng.float(3, 6), sizev = 0, sizea = 0,

		x = x, xv = 0, xa = 0,
		y = y, yv = 0, ya = 0,
		dir = dir, dirv = blur, dira = 0,
		vel = vel, velv = 0, vela = 0,

		r = r or 0.2, rv = 0, ra = 0,
		g = g or 0.5, gv = 0, ga = 0,
		b = b or 0.7, bv = 0, ba = 0,
		a = rng.float(0.5, 0.8), av = 0, aa = 0,
	}
end, },
function(self)
	if first then
		self.ps:emit(700)
	else
		self.ps:emit(intensity or 2)
	end
	first = false
end,
1000,
"particle_drop"
