--[[
Copyright © 2020, DaneBlood
All rights reserved.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of SirPopaLot nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Sammeh BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

_addon.name = 'Leave'
_addon.author = 'Daneblood'
_addon.version = '23.3.19'
_addon.command = 'Leave'

require('resources')
res = require('resources')





windower.register_event('addon command', function(...)
    local args = T{...}
    local cmd = args[1]
	local var_thiszone = windower.ffxi.get_info()['zone']

    if cmd == 'all' then
        windower.send_ipc_message('Leave_all')
	end

	if var_thiszone == 78 then -- Einhejar
		greeting()
		windower.send_command('Treasury drop add "Glowing lamp";wait 1;Treasury drop remove "Glowing lamp"')

	elseif var_thiszone == 129 then -- Meeble Burrows
		greeting()
		windower.send_command('Input /item "Hiatus Whistle" <me>')

	elseif var_thiszone == 133 then -- Sortie
		greeting()
		windower.send_command('Input /item "Obsid. Wing" <me>')

	elseif var_thiszone == 271 then -- Incursion & Delve
		greeting()
		windower.send_command('Input /item "Ontic Extremity" <me>')

	elseif var_thiszone == 275 or var_thiszone == 189 then -- Vagary
		greeting()
		windower.send_command('Input /item "Ontic Extremity" <me>')
	
	elseif var_thiszone == 294 or var_thiszone == 295 or var_thiszone == 296 or var_thiszone == 297 then -- Dynamis Divergence
		greeting()
		windower.send_command('Input /item "Black hourglass " <me>')

	elseif var_thiszone == 298 then -- Odyssey & HTMB: A Stygian Pact, Champion of the Dawn, Divine Interference, Maiden of the Dusk
		greeting()
		windower.send_command('Input /item "moglophone II" <me>') -- Odyssey
		windower.send_command('Input /item "V. Con. Shard" <me>') -- HTMB: A Stygian Pact, Champion of the Dawn, Divine Interference, Maiden of the Dusk

	else
		windower.add_to_chat(chatColor, 'This location is unknown. Unable to leave')
	end


end)



windower.register_event('ipc message',function (msg)
    if msg == 'Leave_all' then
		windower.send_command('Leave')
    end
end)



function greeting()
	windower.send_command('tr passall"')
	windower.send_command('roller off"')
	windower.send_command('cpaddon cmd stop"')

	local var_random = math.random(1,14)
	if var_random == 1 then
		windower.add_to_chat(chatColor, 'See you later, Alligator')
	elseif var_random == 2 then
		windower.add_to_chat(chatColor, 'Gotta run, Skeleton')
	elseif var_random == 3 then
		windower.add_to_chat(chatColor, 'See you soon, Baboon')
	elseif var_random == 4 then
		windower.add_to_chat(chatColor, 'Gotta go, Buffalo')
	elseif var_random == 5 then
		windower.add_to_chat(chatColor, 'Out the door, Dinosaur')
	elseif var_random == 6 then
		windower.add_to_chat(chatColor, 'Chop chop, Lolipop')
	elseif var_random == 7 then
		windower.add_to_chat(chatColor, 'Better swish, Jellyfish')
	elseif var_random == 8 then
		windower.add_to_chat(chatColor, 'Bye bye, Butterfly')
	elseif var_random == 9 then
		windower.add_to_chat(chatColor, 'Toodle-loo, Kangaroo')
	elseif var_random == 10 then
		windower.add_to_chat(chatColor, 'Blow a kiss, Goldfish')
	elseif var_random == 11 then
		windower.add_to_chat(chatColor, 'Goodbye hug, LadyBug')
	elseif var_random == 12 then
		windower.add_to_chat(chatColor, 'Hit the trail, Tiny Snail')
	elseif var_random == 13 then
		windower.add_to_chat(chatColor, 'Gotta scram, Litle Lamb')
	elseif var_random == 14 then
		windower.add_to_chat(chatColor, 'Take care, Polar Bear')
	end
end

