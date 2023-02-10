pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
#include main.lua
#include objects.lua
#include physics.lua
#include input.lua
#include particles.lua
#include tool.lua
#include player.lua
#include camera.lua
#include box.lua
#include map.lua
#include grid.lua


__gfx__
00000000077777700000000006777760000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777700777777007d66d70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000666666007777770066dd660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000761766600666666006166160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000667766607666666001666610000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dddddd00666666066dd666001dddd10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd06666660066666600d1dd1d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dddddd0006006000666666001dddd10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777700777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666600777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066671670666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066677660666666700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666600666dd6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666600666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000006006000666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777700777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666600777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666600666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666600666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666600666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666600666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000006006000666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777700777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666600777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000006d77d600666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000006d66d6006d77d6000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000006dddd6006d66d6000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000666666006dddd6000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000006006000666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000111111111111111166666661111111110000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000166666666666666666666661166666610000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000166666666666666666666661166666610000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000001dddddddddddddddddddddd1166666610000000000000000000000000000000000000000000000000000000000000000
111111111111111111111111111111111dddddddddddddddddddddd1166666610000000000000000000000000000000000000000000000000000000000000000
166666666666666666666661166666611dddddddddddddddddddddd1166666610000000000000000000000000000000000000000000000000000000000000000
166666666666666666666661166666611dddddddddddddddddddddd1166666610000000000000000000000000000000000000000000000000000000000000000
16666666666666666666666116666661111111111111111111111111166666610000000000000000000000000000000000000000000000000000000000000000
16666666666666666666666116666661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16666666666666666666666116666661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16666666666666666666666116666661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16666666666666666666666116666661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16666666666666666666666116666661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16666666666666666666666116666661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16666666666666666666666116666661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16666666666666666666666116666661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16666666666666666666666116666661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16666666666666666666666116666661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16666666666666666666666116666661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1dddddddddddddddddddddd11dddddd1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1dddddddddddddddddddddd11dddddd1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1dddddddddddddddddddddd11dddddd1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1dddddddddddddddddddddd11dddddd1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d0d0d0d0d0d0d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002020202010101010000000000000000010101010101010100000000000000000101010101010101000000000000000004040401010101010000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
6161616161616161616161616161616161616161616161616161616161616161000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7070707070707070707070707070707070707070707070707070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000404142000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000505152000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000505152000040414142000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000605162000060516162000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0003000000705371000071637071000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000006300010000710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007100000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000300000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000000000000000000000000000000000000000000000000000000000000003000030000300000000000000300000000000000000002f0000000000000000002d000000000000000000000000000000000