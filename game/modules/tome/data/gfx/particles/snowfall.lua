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
toback = true
can_shift = true

return { generator = function()
	local ad = rng.range(0, 360)
	local a = math.rad(ad)
	local dir = math.rad(90)
	local r = rng.range(18, 22)
	local dirchance = rng.chance(2)
	local x = rng.range(-16, 16)
	local y = -20 + math.abs(math.sin(x / 16) * 8)

	return {
		trail = 1,
		life = rng.range(20, 28),
		size = rng.range(3, 4), sizev = 0, sizea = -0.005,

		x = x, xv = 0, xa = 0,
		y = y, yv = 0.5, ya = 0.06,
		dir = 0, dirv = 0, dira = 0,
		vel = 0, velv = 0, vela = 0,

		r = 0.624, rv = 0, ra = 0,
		g = 0.820, gv = 0, ga = 0,
		b = 0.933, bv = 0, ba = 0,
		a = 0.2, av = 0.1, aa = 0,
	}
end, },
function(self)
	self.ps:emit(1)
end,
10,
"weather/snowflake"
