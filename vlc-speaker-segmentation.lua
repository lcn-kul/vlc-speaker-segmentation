
function descriptor()
	return {
		title = "VLC Speaker Segmentation",
		version = "1.0",
		author = "btamm12",
		description = [[
Generate speaker segmentation timestamps that can be copied anywhere.
]],
		capabilities = {"menu"},
	}
end

function activate()
	Create_dialog()
end

function deactivate()
end


function meta_changed()
end

function menu()
	return {"Show dialog"}
end

function trigger_menu(id)
	if id==1 then
		d:show()
	end
end

function close()
	d:hide()
end

----------------------

function Create_dialog()
	local ampersand="&" -- for button hotkeys (not OS X)
	local dir=""
	if not vlc.misc then
		dir = vlc.config.userdatadir()
	else
		dir = vlc.misc.userdatadir()
	end
	vlc.msg.info(dir)
	if string.match(dir,"^/Users/") then -- OS X
		ampersand=""
	end

	d = vlc.dialog(descriptor().title)

	d:add_button(ampersand.."Speech Start", click_speech_start, 1,1,1,1)
	d:add_button(ampersand.."Speech Stop", click_speech_stop, 2,1,1,1)
	d:add_button(ampersand.."Clear", click_clear, 3,1,1,1)
	textinput_time = d:add_text_input("", 1,2,3,1)

end

function click_clear()
	local input=vlc.object.input()
	local result = time2str(vlc.var.get(input,"time"))
	if input then textinput_time:set_text("") end
end


function click_speech_start()
	local input=vlc.object.input()
	local result = time2str(vlc.var.get(input,"time"))
	local cur_text = textinput_time:get_text()
	local starting_text = remove_last_start(cur_text)
	local to_append = ""
	if starting_text == "" then
		to_append = result .. "-"
	else
		to_append = ", " .. result .. "-"		
	end
	if input then textinput_time:set_text(starting_text .. to_append) end
end

function click_speech_stop()
	local input=vlc.object.input()
	local result = time2str(vlc.var.get(input,"time"))
	local cur_text = textinput_time:get_text()
	local starting_text = remove_last_stop(cur_text)
	if input then textinput_time:set_text(starting_text .. result) end
end



function time2str(timestamp)
	local currentMillis = timestamp/1000
	local currentSeconds = currentMillis/1000
	local currentMinutes = currentSeconds/60
	local currentHours = currentMinutes/60
	local hours = math.floor(currentHours)
	local minutes = math.floor(currentMinutes-60*hours)
	local seconds = currentSeconds-3600*hours-60*minutes
	local timeString = string.format("%02d:%05.2f",minutes,seconds)
	if hours > 0 then
		timeString = string.format("%02d:%s",hours,timeString)
	end
	return timeString
end

function remove_last_start(s)
	local result, last, j, k
	result, last = string.match(s,'(.*)(, .*-)$')
	if result then
		return result
	else
		j,k = string.match(s,'(.*-)(.*)')
		if k == "" then
			return ""
		else
			return s
		end
	end
end

function remove_last_stop(s)
	local result, last, j, k
	result, last = string.match(s,'(.*-)(.*)')
	j,k = string.find(last, ",", 1)
	if j then
		return s
	else
		return result
	end
end
