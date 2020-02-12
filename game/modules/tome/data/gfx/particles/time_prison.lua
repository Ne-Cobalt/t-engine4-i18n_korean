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

base_size = 32
can_shift = true

return { generator = function()
	local ad = rng.range(0, 360)
	local a = math.rad(ad)
	local dir = math.rad(ad + 180)
	local r = rng.range(12, 20)

	return {
		trail = 1,
		life = 30,
		size = 2, sizev = 0.08, sizea = 0,

		x = r * math.cos(a), xv = 0, xa = 0,
		y = r * math.sin(a), yv = 0, ya = 0,
		dir = dir, dirv = math.rad(3), dira = math.rad(3) / 3,
		vel = 1, velv = 0, vela = 0,

		r = rng.range(10, 220)/255, rv = rng.range(0, 10), ra = 0,
		g = rng.range(100, 100)/255,   gv = 0, ga = 0,
		b = rng.range(120, 255)/255, bv = rng.range(0, 10), ba = 0,
		a = rng.range(25, 220)/255,   av = 0, aa = 0,
	}
end, },
function(self)
	self.ps:emit(5)
end,
150
