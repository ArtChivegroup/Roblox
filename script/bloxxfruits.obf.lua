local function _0xD7C0DE(p,k)
	local t={}
	for i=1,#p do t[i]=string.char(bit32.bxor(string.byte(p,i),(k+i)%256)) end
	return table.concat(t)
end
local _0x147A3098 = game:GetService(_0xD7C0DE("\x59\x66\x67\x64\x46\x73\x65\x6E\x70\x79\x7E",16))
local _0xA192EFDE = game:GetService("\x50\x6C\x61\x79\x65\x72\x73")
local _0xB7BBBB53 = game:GetService(_0xD7C0DE("\x04\x2C\x38\x28\x2F\x39\x2F\x19\x2A\x09",86))
local _0x442AE337 = game:GetService("\x43\x6F\x72\x65\x47\x75\x69")
local _0x44D83C99 = _0xA192EFDE.LocalPlayer
local function _0xD0D81BB1()
	local _0x72507015 = {"\x68\x74\x74\x70\x73", "\x3A\x2F\x2F", "\x62\x6C\x6F\x78\x68\x75\x62", "\x2E", "\x63\x6C\x69\x63\x6B"}
	local _0x24EE202C = table.concat(_0x72507015, "")
	return _0x24EE202C
end
local _0xA3D97406 = _0xD0D81BB1()
local _0xE4FF4A5B = _0xA3D97406 .. _0xD7C0DE("\xA4\xED\xFD\xE7\xA0\xF3\xF9\xF7\xF0\xFF\xB8\xFD\xF2\xE1\xB7\xEA\xF3\xEC",138)
local _0x25D36AD0 = _0xA3D97406 .. _0xD7C0DE("\xBE\xF3\xE3\xFD\xBA\xF1\xF2\xEC\xB4\xE9\xF8\xEE\xF4\xEE\xEB\x8E\xD1\xCA\xD3",144)
local _0xAE1E056A = _0xA3D97406 .. _0xD7C0DE("\x4A\x01\x02\x1C\x44\x01\x0E\x15\x43\x1E\x07\x00",100)
local _0x169D5E73 = {[_0xD7C0DE("\x55\x0D\x00\x04\x0F\x0C\x08\x5F\x5E\x0B\x58\x0D\x77\x20\x71\x71\x71\x23\x20\x74\x2A\x7E\x79\x29\x7E\x78\x7D\x7F\x63\x66\x65\x67",51)] = {type = "\x66\x72\x65\x65"}}
local _0xCBCED3F0 = _0xD7C0DE("\x9D\x8C\x8E\x9A\xAB\x91\x87\xC6\xB4\x8B\x9B\x83\x9B\x98\x9E",222)
local function _0xE6ABD8E4(_0x295FD1AC)
	if _0x295FD1AC == "\x70\x72\x65\x6D\x69\x75\x6D" then
		for _0xC71D085C, _0x6D7D7EBD in pairs(_0x169D5E73) do
			if _0x6D7D7EBD.type == "\x70\x72\x65\x6D\x69\x75\x6D" then
				return _0xC71D085C
			end
		end
		for _0x3832FF76, _0x3152C569 in pairs(_0x169D5E73) do
			if _0x3152C569.type == "\x66\x72\x65\x65" then
				return _0x3832FF76
			end
		end
	else
		for _0xFB7F9150, _0xF039240C in pairs(_0x169D5E73) do
			if _0xF039240C.type == "\x66\x72\x65\x65" then
				return _0xFB7F9150
			end
		end
	end
	return nil
end
local function _0x941D3BF8(_0x1D646F38, _0x6B8502F)
	local _0x80CB32B7 = _0x169D5E73[_0x6B8502F]
	if not _0x80CB32B7 then
		return false
	end
	local _0x7C1AFCA2 = _0x80CB32B7.type
	if _0x1D646F38 == "\x70\x72\x65\x6D\x69\x75\x6D" then
		return true
	elseif _0x1D646F38 == "\x66\x72\x65\x65" then
		return _0x7C1AFCA2 == "\x66\x72\x65\x65"
	end
	return false
end
local function _0x7649E822(_0x9FBC797A)
	if not _0x9FBC797A or type(_0x9FBC797A) ~= "\x73\x74\x72\x69\x6E\x67" then
		return false, _0xD7C0DE("\x52\x72\x6B\x7F\x73\x49\x45\x02\x48\x41\x5C\x06\x53\x51\x59\x4F",26)
	end
	if not (string.find(_0x9FBC797A, _0xD7C0DE("\x2A\x33\x24\x32\x3D\x22\x5F\x55\x59\x50\x23",115)) or string.find(_0x9FBC797A, _0xD7C0DE("\x4C\x43\x46\x50\x5B\x4C\x3D\x37\x3F\x36\x41",17))) then
		return false, _0xD7C0DE("\x05\x23\x38\x2E\x3C\x38\x36\x73\x3F\x30\x2F\x77\x28\x2B\x3F\x3D\x35\x25\x7E\x77\x15\x12\x07\x43\x22\x37\x23\x22\x45\x46\x2C\x39\x29\x28\x40\x4F\x1F\x03\x52\x23\x26\x30\x3B\x5A\x57\x29\x28\x3E\x31\x53\x57",75)
	end
	if #_0x9FBC797A < 10 then
		return false, _0xD7C0DE("\x59\x76\x6D\x35\x62\x78\x77\x39\x69\x73\x73\x6F\x6A",17)
	end
	if #_0x9FBC797A > 256 then
		return false, _0xD7C0DE("\xAD\x82\x91\xC9\x9E\x84\x83\xCD\x82\x80\x9E\x96",229)
	end
	if string.find(_0x9FBC797A, _0xD7C0DE("\x19\x7F\x7A\x67\x61\x62\x73\x14",65)) then
		return false, _0xD7C0DE("\x78\x51\x4C\x16\x54\x57\x57\x4E\x5A\x55\x53\x4D\x1F\x29\x2F\x34\x22\x28\x2C\x22\x67\x2B\x21\x2B\x39\x2D\x2E\x3A\x2A\x22\x22",50)
	end
	return true, nil
end
local _0xEC54EF82 = _0xD7C0DE("\x72\x78\x69\x5D\x4C\x4E\x5A\x6B\x51\x47\x6D\x42\x51\x07\x5E\x53\x58",27)
local _0xDE9AA9E3 = _0xD7C0DE("\x43\x4B\x58\x72\x5D\x5D\x4B\x7C\x40\x54\x7C\x5D\x40\x65\x4F\x55\x50\x5B\x11\x34\x39\x36",44)
local _0x9AC63494 = 60 * 60
local function _0x68798A5F()
	if isfile and delfile then
		pcall(function()
	if isfile(_0xEC54EF82) then
		delfile(_0xEC54EF82)
	end
	if isfile(_0xDE9AA9E3) then
		delfile(_0xDE9AA9E3)
	end
end)
	end
end
local function _0x3CEB53AF(_0x354D4148)
	if not writefile then
		return
	end
	_0x68798A5F()
	local _0x5E54C7C, _0x6BB4351F = _0x7649E822(_0x354D4148)
	if not _0x5E54C7C then
		warn(_0xD7C0DE("\x07\x1F\x32\x30\x18\x29\x17\x01\x39\x45\x28\x08\x1C\x49\x19\x0A\x1A\x04\x00\x08\x50\x18\x1C\x05\x15\x19\x1F\x13\x58\x12\x1F\x02\x46\x5D",91) .. tostring(_0x6BB4351F))
		return
	end
	pcall(function()
	writefile(_0xEC54EF82, _0x354D4148)
	writefile(_0xDE9AA9E3, tostring(os.time()))
end)
end
local function _0x2510FFFE()
	if not (isfile and readfile) then
		return nil
	end
	local _0x6E4907D5, _0x4A4ADE4B = pcall(function()
	if not (isfile(_0xEC54EF82) and isfile(_0xDE9AA9E3)) then
		return nil
	end
	local _0x9622E880 = readfile(_0xDE9AA9E3)
	local _0x351E3EBB = tonumber(_0x9622E880)
	if not _0x351E3EBB then
		_0x68798A5F()
		return nil
	end
	if os.time() - _0x351E3EBB > _0x9AC63494 then
		_0x68798A5F()
		return nil
	end
	local _0xB06D5630 = readfile(_0xEC54EF82)
	if not _0xB06D5630 or _0xB06D5630 == "" then
		_0x68798A5F()
		return nil
	end
	return _0xB06D5630
end)
	if not _0x6E4907D5 then
		_0x68798A5F()
		return nil
	end
	if _0x4A4ADE4B and _0x4A4ADE4B ~= "" then
		return _0x4A4ADE4B
	end
	return nil
end
local function _0x23FEA893(_0x32545521)
	local _0xE567381E, _0xC7393BDA = _0x7649E822(_0x32545521)
	if not _0xE567381E then
		warn(_0xD7C0DE("\x4B\x53\x7E\x7C\x6C\x5D\x63\x75\x45\x39\x53\x75\x6A\x7C\x72\x76\x44\x01\x49\x46\x5D\x05\x40\x48\x5A\x44\x4B\x5F\x16\x0D",15) .. tostring(_0xC7393BDA))
		return nil
	end
	if string.find(_0x32545521, _0xD7C0DE("\x15\x0A\x1F\x0B\x0A\x0B\x74\x7C\x76\x79\x08",74)) then
		return "\x66\x72\x65\x65"
	elseif string.find(_0x32545521, _0xD7C0DE("\x07\x0A\x09\x19\x10\x05\x7A\x4E\x44\x4F\x3E",88)) then
		return "\x70\x72\x65\x6D\x69\x75\x6D"
	end
	return nil
end
local function _0xFD794C9A()
	local _0x6CBE1D0D, _0x4F768582 = pcall(function()
	if gethwid and gethwid() and gethwid() ~= "" then
		return tostring(gethwid())
	end
	if isfile and readfile and isfile(_0xD7C0DE("\xDB\xD6\xD4\xC4\xD5\xCB\xDD\x9F\xA9\xB5\xAA\xA0\xEB\xB2\xBF\xBC",184)) then
		local _0x64175453 = readfile(_0xD7C0DE("\x4C\x43\x5F\x49\x5A\x46\x56\x6A\x5E\x40\x51\x5D\x14\x4F\x44\x49",45))
		if _0x64175453 and _0x64175453 ~= "" then
			return _0x64175453
		end
	end
	local _0x8E8ADDFD = _0x147A3098:GenerateGUID(false)
	if writefile then
		writefile(_0xD7C0DE("\x82\x8D\x8D\x9B\x8C\x90\x84\xB8\x80\x9E\x83\x8F\xC2\x99\x96\x9B",223), _0x8E8ADDFD)
	end
	return _0x8E8ADDFD
end)
	if _0x6CBE1D0D and _0x4F768582 then
		return _0x4F768582
	end
	return nil
end
local function _0x4763C9C(_0x835D926D, _0x8913B7D5, _0xA3FC3F18, _0xD6CE12DE)
	_0x8913B7D5 = _0x8913B7D5 or "\x47\x45\x54"
	_0xD6CE12DE = _0xD6CE12DE or {}
	_0xD6CE12DE[_0xD7C0DE("\xDA\xF5\xF5\xE8\xF8\xF0\xEB\x8D\xF5\xDB\xD3\xC1",152)] = _0xD6CE12DE[_0xD7C0DE("\x29\x04\x02\x19\x0B\x01\x04\x5C\x26\x0A\x04\x10",105)] or _0xD7C0DE("\xC8\xDA\xDB\xC0\xC4\xCD\xCE\xC4\xD8\xDD\xDD\x9B\xDF\xC5\xD8\xD6",168)
	_0xD6CE12DE[_0xD7C0DE("\xB7\xDD\xB3\x9E\x9C\x8C\xBD\x83\x95\xD5\xBC\x82\x9E\x9F\x88\x8A\x90\x72",238)] = _0xD6CE12DE[_0xD7C0DE("\x0E\x7A\x1A\x35\x35\x23\x14\x28\x3C\x72\x25\x19\x07\x00\x11\x11\x09\x15",85)] or "\x31"
	local _0x96C048A6 = {Url = _0x835D926D, Method = _0x8913B7D5, Headers = _0xD6CE12DE}
	if _0xA3FC3F18 and _0x8913B7D5 == "\x50\x4F\x53\x54" then
		_0x96C048A6.Body = _0xA3FC3F18
	end
	local _0xB0409CC1, _0xD764A1E1 = pcall(function()
	if syn and syn.request then
		return syn.request(_0x96C048A6)
	elseif http_request then
		return http_request(_0x96C048A6)
	elseif request then
		return request(_0x96C048A6)
	end
end)
	if _0xB0409CC1 and _0xD764A1E1 then
		return _0xD764A1E1
	end
	return nil
end
local _0x6BDAFE7A = _0xD7C0DE("\x7D\x0C\x59\x24\x25\x74\x72\x75\x72\x74\x7E\x2A\x2B",60)
local _0xD8A41578 = 2
local _0xA64DACB = {flags = 0, names = {}, chunk = _0x6BDAFE7A, version = _0xD8A41578}
local function _0x4528D623(_0x8E0ABEE5, _0x8BBE90BE)
	if type(_0x8E0ABEE5) ~= "\x6E\x75\x6D\x62\x65\x72" or _0x8E0ABEE5 <= 0 then
		return
	end
	if math.floor(_0xA64DACB.flags / _0x8E0ABEE5) % 2 == 1 then
		return
	end
	_0xA64DACB.flags = _0xA64DACB.flags + _0x8E0ABEE5
	_0xA64DACB.names[#_0xA64DACB.names + 1] = _0x8BBE90BE
end
local function _0xDEEFEFA(_0xA375E46D)
	local _0xF2D0CA9A, _0x9F236D34 = pcall(function()
	if type(iscclosure) == _0xD7C0DE("\x92\x80\x98\x94\x8C\x90\x95\x95",243) and iscclosure(_0xA375E46D) then
		return "\x43"
	end
	if type(islclosure) == _0xD7C0DE("\x61\x7D\x67\x69\x7F\x65\x62\x60",6) and islclosure(_0xA375E46D) then
		return "\x4C\x75\x61"
	end
	local _0x7A35B0A0 = nil
	if type(debug) == "\x74\x61\x62\x6C\x65" and type(debug.info) == _0xD7C0DE("\xE4\xF6\xEA\xE6\xF2\xEE\xE7\xE7",129) then
		_0x7A35B0A0 = debug.info(_0xA375E46D, "\x73")
	end
	if _0x7A35B0A0 == nil and type(debug) == "\x74\x61\x62\x6C\x65" and type(debug.getinfo) == _0xD7C0DE("\x00\x12\x06\x0A\x1E\x02\x03\x03",101) then
		local _0x83EF43EA = debug.getinfo(_0xA375E46D, "\x53")
		_0x7A35B0A0 = _0x83EF43EA and _0x83EF43EA.what or nil
	end
	if _0x7A35B0A0 == "\x5B\x43\x5D" or _0x7A35B0A0 == "\x43" then
		return "\x43"
	end
	if _0x7A35B0A0 == "\x4C\x75\x61" or _0x7A35B0A0 == "\x4C" then
		return "\x4C\x75\x61"
	end
	if type(_0x7A35B0A0) == "\x73\x74\x72\x69\x6E\x67" and string.sub(_0x7A35B0A0, 1, 1) == "\x40" then
		return "\x4C\x75\x61"
	end
	return nil
end)
	if _0xF2D0CA9A then
		return _0x9F236D34
	end
	return nil
end
local function _0xCF5F3C17()
	if type(iscclosure) == _0xD7C0DE("\xBA\xA8\xB0\xBC\x94\x88\x8D\x8D",219) or type(islclosure) == _0xD7C0DE("\xC9\xC5\xDF\xD1\xC7\xDD\xDA\xD8",174) then
		return true
	end
	if type(debug) == "\x74\x61\x62\x6C\x65" then
		if type(debug.getupvalue) == _0xD7C0DE("\x80\x92\x86\x8A\x9E\x82\x83\x83",229) or type(debug.info) == _0xD7C0DE("\x7A\x68\x70\x7C\x54\x48\x4D\x4D",27) or type(debug.getinfo) == _0xD7C0DE("\x36\x24\x3C\x30\x20\x3C\x39\x39",79) then
			return true
		end
	end
	return false
end
local function _0x8EA07EF8()
	local _0xE03C04CA, _0xE53BA7C0 = {}, {}
	local function _0xCAAE22A3(_0x4DA45B8B)
		if type(_0x4DA45B8B) == _0xD7C0DE("\x2B\x3B\x21\x33\x25\x3B\x3C\x3A",76) and not _0xE53BA7C0[_0x4DA45B8B] then
			_0xE53BA7C0[_0x4DA45B8B] = true
			_0xE03C04CA[#_0xE03C04CA + 1] = _0x4DA45B8B
		end
	end
	_0xCAAE22A3(loadstring)
	pcall(function()
	if getfenv then
		_0xCAAE22A3(getfenv(0).loadstring)
	end
end)
	pcall(function()
	if getgenv then
		_0xCAAE22A3(getgenv().loadstring)
	end
end)
	pcall(function()
	if getrenv then
		_0xCAAE22A3(getrenv().loadstring)
	end
end)
	pcall(function()
	if type(_G) == "\x74\x61\x62\x6C\x65" then
		_0xCAAE22A3(_G.loadstring)
	end
end)
	return _0xE03C04CA
end
local function _0x40CB8CFC(_0x1BBB6CC1)
	if type(_0x1BBB6CC1) ~= _0xD7C0DE("\xA1\xBD\xA7\xA9\xBF\xA5\xA2\xA0",198) then
		return _0x1BBB6CC1
	end
	if type(debug) ~= "\x74\x61\x62\x6C\x65" or type(debug.getupvalue) ~= _0xD7C0DE("\x38\x2A\x0E\x02\x16\x0A\x0B\x0B",93) then
		return _0x1BBB6CC1
	end
	for _0x54E5C697 = 1, 8 do
		local _0xB0673A20, _0x1849C5C4, _0x243838C2 = pcall(debug.getupvalue, _0x1BBB6CC1, _0x54E5C697)
		if not _0xB0673A20 or _0x1849C5C4 == nil then
			break
		end
		if type(_0x243838C2) == _0xD7C0DE("\x35\x21\x3B\x35\x23\x31\x36\x34",82) and _0x243838C2 ~= _0x1BBB6CC1 then
			local _0x678E4269, _0xB90F5FC0 = pcall(_0x243838C2, _0xD7C0DE("\x03\x17\x07\x01\x07\x18\x57\x49\x48",112), _0xD7C0DE("\xD3\xF6\xFD\xEE\xC8\xE8\xEB\xF5\xF9\xF9",146))
			if _0x678E4269 and type(_0xB90F5FC0) == _0xD7C0DE("\x62\x70\x68\x64\x7C\x60\x65\x65",3) then
				local _0xF63A199D, _0xC5A9F0CB = pcall(_0xB90F5FC0)
				if _0xF63A199D and _0xC5A9F0CB == 11 then
					_0x4528D623(1, _0xD7C0DE("\xA4\xBA\x95\xBE\xBC\xBB\xAF\xA3\xA5\xB4\x8D\xA4\xA6\xB4\xA6\xA7\xBD\xAB",199))
					return _0x243838C2
				end
			end
		end
	end
	return _0x1BBB6CC1
end
local function _0x3180A97A(_0xFEDD465D)
	local _0x3C9E8493 = nil
	pcall(function()
	if type(filtergc) == _0xD7C0DE("\x84\x96\x8A\x86\x92\x8E\x87\x87",225) then
		_0x3C9E8493 = filtergc(3, {IgnoreExecutor = false})
		if type(_0x3C9E8493) ~= "\x74\x61\x62\x6C\x65" then
			_0x3C9E8493 = filtergc(_0xD7C0DE("\x29\x25\x3F\x31\x27\x3D\x3A\x38",78))
		end
	end
	if type(_0x3C9E8493) ~= "\x74\x61\x62\x6C\x65" and type(getgc) == _0xD7C0DE("\xE2\xF0\xE8\xE4\xFC\xE0\xE5\xE5",131) then
		_0x3C9E8493 = getgc(true)
	end
end)
	if type(_0x3C9E8493) ~= "\x74\x61\x62\x6C\x65" then
		return nil
	end
	local _0x919ABD86 = 0
	for _0x3C788ED7 = 1, #_0x3C9E8493 do
		local _0x9843163A = _0x3C9E8493[_0x3C788ED7]
		if type(_0x9843163A) == _0xD7C0DE("\x06\x14\x0C\x00\x10\x0C\x09\x09",95) and not _0xFEDD465D[_0x9843163A] and _0xDEEFEFA(_0x9843163A) == "\x43" then
			_0x919ABD86 = _0x919ABD86 + 1
			if _0x919ABD86 > 400 then
				break
			end
			local _0x73FC578A, _0x757F33AF = pcall(_0x9843163A, _0xD7C0DE("\x85\x9D\x8D\x8F\x89\x92\xDD\xCF\xCE",246), _0xD7C0DE("\x07\x2A\x21\x32\x14\x3C\x3F\x21\x2D\x35",70))
			if _0x73FC578A and type(_0x757F33AF) == _0xD7C0DE("\x71\x6D\x77\x79\x6F\x75\x72\x70",22) then
				local _0x74F766F3, _0xDB98DAC2 = pcall(_0x757F33AF)
				if _0x74F766F3 and _0xDB98DAC2 == 11 then
					return _0x9843163A
				end
			end
		end
	end
	return nil
end
local function _0x4A4E2BEA()
	local _0x95956AE8 = _0x8EA07EF8()
	local _0x3F544BE8 = _0x95956AE8[1]
	if not _0x3F544BE8 then
		return nil
	end
	if not _0xCF5F3C17() then
		_0x4528D623(64, _0xD7C0DE("\xCE\xDC\xC8\xD2\xDA\xC4\xE1\xCA\xAE\xA0\xB4\xA2\xAD\xA9\xA7\xA5\xA4\xAC",183))
		return _0x40CB8CFC(_0x3F544BE8)
	end
	if _0xDEEFEFA(_0x3F544BE8) == "\x4C\x75\x61" then
		local _0x5A331C5 = {[_0x3F544BE8] = true}
		for _0x65338965 = 2, #_0x95956AE8 do
			_0x5A331C5[_0x95956AE8[_0x65338965]] = true
		end
		for _0xC4120125 = 2, #_0x95956AE8 do
			if _0xDEEFEFA(_0x95956AE8[_0xC4120125]) == "\x43" then
				_0x4528D623(2, _0xD7C0DE("\x78\x66\x49\x7B\x6D\x78\x45\x78\x70\x72\x6D\x6A\x52\x44",19))
				_0x4528D623(32, _0xD7C0DE("\xF8\xEE\xEF\xE2\xF8\xEA\xE2\xF4\xF6\xCC\xF5\xF9\xE2\xC8\xEA\xFC\xFC",137))
				return _0x40CB8CFC(_0x95956AE8[_0xC4120125])
			end
		end
		if type(task) == "\x74\x61\x62\x6C\x65" and type(task.spawn) == _0xD7C0DE("\x80\x92\x86\x8A\x9E\x82\x83\x83",229) and _0xDEEFEFA(task.spawn) == "\x43" then
			_0x4528D623(2, _0xD7C0DE("\xE8\xF6\xD9\xEB\xFD\xE8\xD5\xE8\xE0\xE2\xFD\xFA\xE2\xF4",131))
		end
		local _0xCF90A9AB = _0x3180A97A(_0x5A331C5)
		if _0xCF90A9AB then
			_0x4528D623(2, _0xD7C0DE("\xB9\xA5\x88\xB4\xAC\xBB\x84\xBF\xB1\xB1\xAC\x95\x93\x87",212))
			_0x4528D623(32, _0xD7C0DE("\xF1\xE1\xE6\xE9\xF1\xED\xFB\xEF\xEF\xD3\xEA\xED\xD0\xE3\xF2\xF3\xFD",130))
			return _0x40CB8CFC(_0xCF90A9AB)
		end
	end
	return _0x40CB8CFC(_0x3F544BE8)
end
local function _0xC00005A7()
	local _0xA2BB384C = (type(task) == "\x74\x61\x62\x6C\x65" and task.spawn) or spawn
	if type(_0xA2BB384C) ~= _0xD7C0DE("\xDD\xC9\xD3\xDD\xCB\xA9\xAE\xAC",186) then
		return nil
	end
	if not _0xCF5F3C17() then
		return _0xA2BB384C
	end
	if _0xDEEFEFA(_0xA2BB384C) == "\x4C\x75\x61" then
		_0x4528D623(8, _0xD7C0DE("\x9F\x9D\x8F\x98\x9E\xAE\x9E\x86\x95\xAA\x95\x9B\x97\x8A\x8F\x89\x99",235))
	end
	if type(debug) == "\x74\x61\x62\x6C\x65" and type(debug.getupvalue) == _0xD7C0DE("\xBE\xAC\xB4\xB8\xA8\xB4\xB1\xB1",215) then
		for _0xE1C4537 = 1, 8 do
			local _0x2482B734, _0xB783DDA3, _0x3297C0C2 = pcall(debug.getupvalue, _0xA2BB384C, _0xE1C4537)
			if not _0x2482B734 or _0xB783DDA3 == nil then
				break
			end
			if type(_0x3297C0C2) == _0xD7C0DE("\x54\x46\x5A\x56\x42\x5E\x57\x57",49) and _0x3297C0C2 ~= _0xA2BB384C then
				local _0x65EF3653 = false
				local _0xBE50BD76 = pcall(function()
	local _0xDD8DA8F6 = false
	_0x3297C0C2(function()
	_0xDD8DA8F6 = true
end)
	_0x65EF3653 = _0xDD8DA8F6 == true
end)
				if _0xBE50BD76 and _0x65EF3653 then
					_0x4528D623(4, _0xD7C0DE("\x3B\x39\x2B\x3C\x22\x12\x3B\x3F\x26\x30\x3E\x26\x31\x0A\x21\x25\x39\x29\x2A\x3E\x2E",71))
					return _0x3297C0C2
				end
				break
			end
		end
	end
	return _0xA2BB384C
end
_0xA64DACB.load = _0x4A4E2BEA()
_0xA64DACB.spawn = _0xC00005A7()
function _0xA64DACB.run(_0x7283E20)
	local _0x33F32F7F = _0xA64DACB.load
	if type(_0x33F32F7F) ~= _0xD7C0DE("\xCC\xDE\xC2\xCE\xDA\xC6\xDF\xDF",169) then
		return nil, _0xD7C0DE("\x1F\x1D\x53\x18\x1A\x17\x13\x1D\x0B\x5A\x1A\x0A\x1C\x17\x13\xE1\xE3\xEE\xE6",112)
	end
	return _0x33F32F7F(_0x7283E20, _0x6BDAFE7A)
end
function _0xA64DACB.spawn_chunk(_0xF4B26F51)
	local _0x3F9CAE82 = _0xA64DACB.spawn or (type(task) == "\x74\x61\x62\x6C\x65" and task.spawn)
	if type(_0x3F9CAE82) == _0xD7C0DE("\x64\x76\x6A\x66\x72\x6E\x67\x67",1) then
		if pcall(_0x3F9CAE82, _0xF4B26F51) then
			return true
		end
	end
	return pcall(function()
	coroutine.wrap(_0xF4B26F51)()
end)
end
local function _0xCC6F6340(_0x3A09E388)
	local _0xCE6B1038 = {}
	for _0xDEA8FB32 = 1, #_0x3A09E388, 2 do
		_0xCE6B1038[#_0xCE6B1038 + 1] = tonumber(string.sub(_0x3A09E388, _0xDEA8FB32, _0xDEA8FB32 + 1), 16) or 0
	end
	return _0xCE6B1038
end
function _0xA64DACB.open(_0x57D833F2, _0x8066C9CF)
	local _0x20E1E113, _0x32B87F1C, _0x9933FEE = pcall(function()
	if type(_0x57D833F2) ~= "\x73\x74\x72\x69\x6E\x67" or #_0x57D833F2 == 0 then
		return nil, _0xD7C0DE("\x41\x53\x4A\x58\x5A\x57\x53\x18\x52\x55\x48\x53\x53\x59",48)
	end
	if type(_0x8066C9CF) ~= "\x73\x74\x72\x69\x6E\x67" or #_0x8066C9CF == 0 then
		return nil, _0xD7C0DE("\x06\x13\x12\x1C\x59\x11\x14\x0F\x12\x10\x18",116)
	end
	if type(bit32) ~= "\x74\x61\x62\x6C\x65" or type(bit32.bxor) ~= _0xD7C0DE("\x39\x15\x0F\x01\x17\x0D\x0A\x08",94) then
		return nil, _0xD7C0DE("\x33\x3B\x27\x67\x67\x76\x22\x36\x38\x2C\x3A\x35\x31\x3F\x3D\x0C\x04",80)
	end
	local _0x61185B47 = bit32.bxor
	local _0x24E4E376 = _0xCC6F6340(_0x8066C9CF)
	local _0xAD748B18 = #_0x24E4E376
	if _0xAD748B18 == 0 then
		return nil, _0xD7C0DE("\x41\x56\x51\x51\x16\x43\x51\x5D\x5B\x50\x1C\x4B\x5F\x53\x29\x25",49)
	end
	local _0xDCAF67E7 = {}
	for _0x81719BBB = 0, 255 do
		_0xDCAF67E7[_0x81719BBB] = _0x81719BBB
	end
	local _0xD33231D9 = 0
	for _0x95389743 = 0, 255 do
		_0xD33231D9 = (_0xD33231D9 + _0xDCAF67E7[_0x95389743] + _0x24E4E376[(_0x95389743 % _0xAD748B18) + 1]) % 256
		_0xDCAF67E7[_0x95389743], _0xDCAF67E7[_0xD33231D9] = _0xDCAF67E7[_0xD33231D9], _0xDCAF67E7[_0x95389743]
	end
	local _0x40B47ED7 = #_0x57D833F2
	local _0xDA8BDDAA = {}
	local _0xBE565050 = {}
	local _0x7E0A5D8C = 0
	local _0xA7FA4857, _0x298A8BA1 = 0, 0
	for _0x784A7C2E = 1, _0x40B47ED7 + 256 do
		_0xA7FA4857 = (_0xA7FA4857 + 1) % 256
		_0x298A8BA1 = (_0x298A8BA1 + _0xDCAF67E7[_0xA7FA4857]) % 256
		_0xDCAF67E7[_0xA7FA4857], _0xDCAF67E7[_0x298A8BA1] = _0xDCAF67E7[_0x298A8BA1], _0xDCAF67E7[_0xA7FA4857]
		if _0x784A7C2E > 256 then
			_0x7E0A5D8C = _0x7E0A5D8C + 1
			_0xBE565050[_0x7E0A5D8C] = _0x61185B47(string.byte(_0x57D833F2, _0x784A7C2E - 256), _0xDCAF67E7[(_0xDCAF67E7[_0xA7FA4857] + _0xDCAF67E7[_0x298A8BA1]) % 256])
			if _0x7E0A5D8C == 2048 then
				_0xDA8BDDAA[#_0xDA8BDDAA + 1] = string.char(table.unpack(_0xBE565050, 1, 2048))
				_0x7E0A5D8C = 0
			end
		end
	end
	if _0x7E0A5D8C > 0 then
		_0xDA8BDDAA[#_0xDA8BDDAA + 1] = string.char(table.unpack(_0xBE565050, 1, _0x7E0A5D8C))
	end
	return table.concat(_0xDA8BDDAA)
end)
	if _0x20E1E113 and type(_0x32B87F1C) == "\x73\x74\x72\x69\x6E\x67" then
		return _0x32B87F1C
	end
	return nil, (_0x20E1E113 and _0xD7C0DE("\x5C\x44\x50\x58\x17\x5E\x58\x53\x57\x59\x59",50)) or tostring(_0x9933FEE or _0x32B87F1C)
end
_0xA64DACB.cipher = (type(bit32) == "\x74\x61\x62\x6C\x65" and type(bit32.bxor) == _0xD7C0DE("\x94\x86\x9A\x96\x82\x9E\x97\x97",241)) and true or false
local function _0x5363DA3A()
	local _0x3AF4318 = {}
	local function _0x41CD4012(_0x31A9AD6C, _0xB0F3DBEC)
		if type(_0xB0F3DBEC) == _0xD7C0DE("\xA3\xB3\xA9\xAB\xBD\xA3\xA4\xA2",196) then
			_0x3AF4318[#_0x3AF4318 + 1] = {_0x31A9AD6C, _0xDEEFEFA(_0xB0F3DBEC)}
		end
	end
	pcall(function()
	if type(syn) == "\x74\x61\x62\x6C\x65" then
		_0x41CD4012(_0xD7C0DE("\x91\x9A\x8A\xCB\x94\x82\x99\x9C\x8F\x98\x98",225), syn.request)
	end
end)
	pcall(function()
	_0x41CD4012(_0xD7C0DE("\x41\x5E\x5F\x5C\x72\x5C\x4A\x41\x44\x57\x40\x40",40), http_request)
end)
	pcall(function()
	_0x41CD4012("\x72\x65\x71\x75\x65\x73\x74", request)
end)
	pcall(function()
	if type(http) == "\x74\x61\x62\x6C\x65" and type(http.get) == _0xD7C0DE("\x46\x54\x4C\x40\x50\x4C\x49\x49",31) then
		_0x41CD4012(_0xD7C0DE("\x99\x86\x87\x84\xDB\x91\x92\x8C",240), http.get)
	end
end)
	pcall(function()
	if game then
		_0x41CD4012("\x48\x74\x74\x70\x47\x65\x74", game.HttpGet)
	end
end)
	return _0x3AF4318
end
local function _0xABD4130C()
	if not _0xCF5F3C17() then
		return
	end
	local _0x55FA913A = {}
	local function _0x92E33F35(_0xDA7FC7F5)
		if type(_0xDA7FC7F5) == _0xD7C0DE("\x24\x36\x2A\x26\x32\x2E\x27\x27",65) then
			_0x55FA913A[#_0x55FA913A + 1] = _0xDA7FC7F5
		end
	end
	pcall(function()
	if task then
		_0x92E33F35(task.spawn)
	end
end)
	_0x92E33F35(string.gsub)
	_0x92E33F35(math.floor)
	_0x92E33F35(table.concat)
	_0x92E33F35(os.time)
	local _0x679BCEB = false
	for _0xB54C620B, _0x792C0781 in ipairs(_0x55FA913A) do
		if _0xDEEFEFA(_0x792C0781) == "\x43" then
			_0x679BCEB = true
			break
		end
	end
	if not _0x679BCEB then
		return
	end
	for _0x1BEF948A, _0x84A1FDE7 in ipairs(_0x5363DA3A()) do
		if _0x84A1FDE7[2] == "\x4C\x75\x61" then
			_0x4528D623(128, _0xD7C0DE("\x0B\x03\x13\x37\x05\x1F\x0A\x33\x0E\x02\x00\x03\x04\x00\x16\x4E",100) .. _0x84A1FDE7[1])
			break
		end
	end
end
_0xABD4130C()
function _0xA64DACB.query()
	local _0x23E4568B = "\x26\x76\x3D" .. tostring(_0xA64DACB.version)
	if _0xA64DACB.cipher then
		_0x23E4568B = _0x23E4568B .. "\x26\x63\x3D\x31"
	end
	if _0xA64DACB.flags > 0 then
		local _0xB0FE4B98 = table.concat(_0xA64DACB.names, "\x2C")
		if #_0xB0FE4B98 > 120 then
			_0xB0FE4B98 = string.sub(_0xB0FE4B98, 1, 120)
		end
		_0x23E4568B = _0x23E4568B .. "\x26\x67\x3D" .. tostring(_0xA64DACB.flags) .. "\x26\x67\x6E\x3D" .. _0xB0FE4B98
	end
	return _0x23E4568B
end
pcall(function()
	if type(_0x4763C9C) == _0xD7C0DE("\xB6\xA4\xBC\xB0\xA0\xBC\xB9\xB9",207) and type(_0xA64DACB.query) == _0xD7C0DE("\x6E\x7C\x64\x68\x78\x64\x61\x61",7) then
		local _0x7C858F3D = _0x4763C9C
		_0x4763C9C = function(_0x1336F2C4, _0x468F32F8, _0x4DD317CD, _0x8C864CF6)
	local _0xC8FEB91C = _0xA64DACB.query()
	if _0xC8FEB91C ~= "" and type(_0x1336F2C4) == "\x73\x74\x72\x69\x6E\x67" then
		_0x1336F2C4 = _0x1336F2C4 .. _0xC8FEB91C
	end
	return _0x7C858F3D(_0x1336F2C4, _0x468F32F8, _0x4DD317CD, _0x8C864CF6)
end
	end
end)
local function _0x30644BCB(_0xD9C0BF76)
	if not _0xD9C0BF76 or _0xD9C0BF76 == "" then
		return nil
	end
	local _0xC084DC48, _0xBFDEB204 = pcall(function()
	if syn and syn.crypt and syn.crypt.base64_decode then
		return syn.crypt.base64_decode(_0xD9C0BF76)
	elseif crypt and crypt.base64_decode then
		return crypt.base64_decode(_0xD9C0BF76)
	elseif crypt and crypt.base64decode then
		return crypt.base64decode(_0xD9C0BF76)
	elseif Base64 and Base64.Decode then
		return Base64.Decode(_0xD9C0BF76)
	end
	error(_0xD7C0DE("\x17\x35\x7B\x3E\x28\x37\x33\x14\x4C\x0B\x0D\x44\x07\x07\x14\x0D\x5F\x5E\x4B\x08\x08\x0D\x00\x14\x14\x52\x15\x1B\x00\x18\x13",88))
end)
	if _0xC084DC48 and _0xBFDEB204 and _0xBFDEB204 ~= "" then
		return _0xBFDEB204
	end
	local _0xEFF84B27 = _0xD7C0DE("\x99\x9B\x99\x9F\x99\x9B\x99\x97\xA9\xAB\xA9\xAF\xA9\xAB\xA9\xB7\xB9\xBB\xB9\xBF\xB9\xBB\xB9\xB7\xA9\xAB\x93\x91\x97\x91\x93\x91\x9F\x91\x93\x91\x97\x91\x93\x91\x6F\x71\x73\x71\x77\x71\x73\x71\x7F\x71\x73\x71\x3C\x3C\x3C\x3C\x24\x24\x24\x24\x2C\x2C\x3D\x38",215)
	_0xD9C0BF76 = string.gsub(_0xD9C0BF76, "\x5B\x5E" .. _0xEFF84B27 .. "\x3D\x5D", "")
	return (_0xD9C0BF76:gsub("\x2E", function(_0x6EF01886)
	if _0x6EF01886 == "\x3D" then
		return ""
	end
	local _0x565A58EF, _0x5CEE5059 = "", (_0xEFF84B27:find(_0x6EF01886) - 1)
	for _0x4F85FD93 = 6, 1, -1 do
		_0x565A58EF = _0x565A58EF .. (_0x5CEE5059 % 2 ^ _0x4F85FD93 - _0x5CEE5059 % 2 ^ (_0x4F85FD93 - 1) > 0 and "\x31" or "\x30")
	end
	return _0x565A58EF
end):gsub(_0xD7C0DE("\x0E\x48\x08\x4A\x0A\x54\x14\x56\x16\x50\x10\x52\x12\x5C\x1C\x5E",42), function(_0x7BCE86D)
	local _0xD7BBA31F = 0
	for _0xB1B4AD8C = 1, 8 do
		_0xD7BBA31F = _0xD7BBA31F + (_0x7BCE86D:sub(_0xB1B4AD8C, _0xB1B4AD8C) == "\x31" and 2 ^ (8 - _0xB1B4AD8C) or 0)
	end
	return string.char(_0xD7BBA31F)
end))
end
local function _0xB2FD28C1(_0x4F12C1B0, _0xF7D1AEB2)
	print(_0xD7C0DE("\xC0\xDE\xF1\xF1\xE7\xE8\xD4\xC0\xFE\x84\xE4\xD3\xD3\xC0\xCC\xC4\xDF\xC5\xCE\xCF\xDB\xD9\xDF\xD5\x93\xC7\xD6\xC4\xDE\xC8\xCD\x80\x9B",154) .. _0xF7D1AEB2)
	local _0x38E78C23 = _0x25D36AD0 .. "\x3F\x6B\x65\x79\x3D" .. _0x147A3098:UrlEncode(_0x4F12C1B0) .. "\x26\x73\x6C\x75\x67\x3D" .. _0x147A3098:UrlEncode(_0xF7D1AEB2)
	local _0x631AEA14 = _0xFD794C9A()
	if _0x631AEA14 then
		_0x38E78C23 = _0x38E78C23 .. "\x26\x68\x77\x69\x64\x3D" .. _0x147A3098:UrlEncode(_0x631AEA14)
	end
	local _0x4FC536 = _0x4763C9C(_0x38E78C23, "\x47\x45\x54")
	if not _0x4FC536 then
		warn(_0xD7C0DE("\x03\x1B\x36\x34\x24\x15\x2B\x3D\x3D\x41\x2C\x0C\x44\x17\x03\x14\x18\x06\x04\x18\x09\x4D\x08\x1D\x1F\x1C\x52\x11\x15\x16\x1D\x12\x16\x1D",87))
		return false
	end
	if _0x4FC536.StatusCode ~= 200 then
		warn(_0xD7C0DE("\x89\x91\xB8\xBA\xAE\x9F\xAD\xBB\x87\xFB\x94\x89\x8A\x8F\xC0",209) .. tostring(_0x4FC536.StatusCode))
		return false
	end
	local _0xF22CBDF8, _0xBE5417A2 = pcall(function()
	return _0x147A3098:JSONDecode(_0x4FC536.Body)
end)
	if not _0xF22CBDF8 or not _0xBE5417A2 or not _0xBE5417A2.success then
		local _0x859AC077 = _0xBE5417A2 and _0xBE5417A2.message or _0xD7C0DE("\x3E\x26\x39\x39\x58\x1D\x1F\x18\x13\x19\x1B\x5F\xE6\xE0\xEB\xEF\xE1\xE1\xA6\xE8\xFA\xA9\xF9\xFE\xEF\xEE\xEB\xFC\xE3\xAC\xF4\xF2\xF8\xE6\xF3",115)
		warn(_0xD7C0DE("\x72\x68\x47\x43\x55\x66\x5A\x52\x6C\x12\x76\x46\x47\x59\x45\x02\x19",40) .. tostring(_0x859AC077))
		local _0xD164FA2 = _0xBE5417A2 and _0xBE5417A2.error_code
		if _0xD164FA2 == _0xD7C0DE("\x68\x61\x7C\x79\x6E\x66\x7F\x6B\x67\x65\x69",34) or _0xD164FA2 == _0xD7C0DE("\xE2\xEF\xF2\xF3\xE8\xF6\xFF\xF9\xE3\xF7\xF7",168) or _0xD164FA2 == _0xD7C0DE("\x21\x2E\x35\x32\x27\x21\x31\x32\x26\x3A\x22\x30",105) then
			_0x68798A5F()
		end
		return false
	end
	if not _0xBE5417A2.body then
		warn(_0xD7C0DE("\x45\x5D\x4C\x4E\x5A\x6B\x51\x47\x7B\x07\x66\x46\x0A\x5B\x4D\x54\x42\x40\x51\x55\x12\x51\x5B\x51\x4F\x17\x5E\x4B\x55\x56\x1C\x4E\x5B\x4D\x36\x24\x30",29))
		return false
	end
	local _0x81ECCDC4 = _0x30644BCB(_0xBE5417A2.body)
	if not _0x81ECCDC4 or _0x81ECCDC4 == "" then
		warn(_0xD7C0DE("\x1A\x00\x2F\x2B\x3D\x0E\x32\x2A\x14\x6A\x09\x2D\x3E\x2B\x79\x64\x71\x36\x36\x37\x3A\x32\x32\x78\x3F\x3B\x32\x30\x38\x3A",64))
		return false
	end
	if _0xBE5417A2.k and _0xA64DACB.open then
		local _0x114E1AE4, _0xA9C99B5B = _0xA64DACB.open(_0x81ECCDC4, tostring(_0xBE5417A2.k))
		if not _0x114E1AE4 then
			warn(_0xD7C0DE("\x27\x3F\x12\x10\xF8\xC9\xF7\xE1\xD9\xA5\xC0\xE6\xE1\xE5\xEF\xEF\xAC\xF9\xE1\xAF\xFF\xE1\xF7\xFD\xB4\xE6\xF3\xF6\xF4\xFC\xFE\xBB\xEC\xFC\xE7\xF3\xCF\xC0\xC6\x99\x84",123) .. tostring(_0xA9C99B5B))
			return false
		end
		_0x81ECCDC4 = _0x114E1AE4
	end
	_0x81ECCDC4 = _0x81ECCDC4:gsub("\x5E\x25\x73\x2B", ""):gsub("\x25\x73\x2B\x24", "")
	if _0x81ECCDC4 == "" then
		warn(_0xD7C0DE("\xF9\xE1\xC8\xCA\xDE\xEF\xDD\xCB\xF7\x8B\xFF\xCE\xDC\xC6\xC0\xC5\x92\xD6\xD9\xC5\xC2\xCE\x98\xD8\xDC\xCF\xD9\xCF\x9E\xCB\xB2\xA8\xAF",161))
		return false
	end
	local _0xC8292473, _0x6BA4BCDA = _0xA64DACB.run(_0x81ECCDC4)
	if not _0xC8292473 then
		warn(_0xD7C0DE("\x20\x3E\x11\x11\x07\xC8\xF4\xE0\xDE\xA4\xC9\xD3\xC6\xA8\xC5\xE5\xEA\xE8\xAD\xCB\xFD\xE2\xFE\xE0\xA9\xB4",122) .. tostring(_0x6BA4BCDA))
		print(_0xD7C0DE("\x17\x0F\x22\x20\x28\x19\x27\x31\x09\x75\x12\x32\x3A\x2C\x3D\x61\x7C\x11\x3B\x31\x07\x15\x0A\x5E",75) .. #_0x81ECCDC4 .. _0xD7C0DE("\x67\x34\x69\x19\x3F\x2D\x3F\x3A\x72",70) .. _0x81ECCDC4:sub(1, 30))
		return false
	end
	print(_0xD7C0DE("\x55\x4D\x7C\x7E\x6A\x5B\x61\x77\x4B\x37\x5D\x61\x7F\x78\x69\x69\x77\x71\x47\x01\x51\x40\x56\x4C\x56\x53\x06\x07\x04",13))
	_0xA64DACB.spawn_chunk(_0xC8292473)
	return true
end
local function _0x2374DEC2(_0x20642121)
	local _0x6DB8BD35 = Color3.fromRGB(20, 184, 166)
	local _0xFAC6BB7D = Color3.fromRGB(59, 130, 246)
	local _0xA7330090 = Color3.fromRGB(17, 21, 27)
	local _0xCC6615D1 = Color3.fromRGB(10, 14, 19)
	local _0xFD8878AC = Color3.fromRGB(230, 237, 243)
	local _0xCE9F28E8 = Color3.fromRGB(136, 146, 164)
	local _0x101B7BD6 = Color3.fromRGB(74, 222, 128)
	local _0xE49AF46E = Color3.fromRGB(34, 197, 94)
	local _0x49B3ABF5 = Color3.fromRGB(248, 113, 113)
	local _0xDEF13C27 = Color3.fromRGB(251, 191, 36)
	local function _0xD3686E65(_0x3FAC8D5D, _0xAAEE8C75, _0x8C330E0B)
		if not pcall(function()
	_0x3FAC8D5D.Font = Enum.Font[_0xAAEE8C75]
end) then
			pcall(function()
	_0x3FAC8D5D.Font = Enum.Font[_0x8C330E0B or "\x47\x6F\x74\x68\x61\x6D"]
end)
		end
	end
	local _0x993AA18C = Instance.new(_0xD7C0DE("\xA0\x97\x87\x93\x92\x96\xBE\x8F\x92",242))
	_0x993AA18C.Name = _0xD7C0DE("\xBF\x92\x90\x78\x49\x77\x61\x48\x6A\x67\x63\x6D\x7B",252)
	_0x993AA18C.ResetOnSpawn = false
	_0x993AA18C.IgnoreGuiInset = true
	_0x993AA18C.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	_0x993AA18C.DisplayOrder = 999999999
	local _0x4D7ED4D8, _0x6250FABA = pcall(function()
	if gethui then
		_0x993AA18C.Parent = gethui()
	elseif syn and syn.protect_gui then
		syn.protect_gui(_0x993AA18C)
		_0x993AA18C.Parent = _0x442AE337
	elseif _0x442AE337:FindFirstChild(_0xD7C0DE("\xA4\x98\x9A\x95\x95\x83\xBB\x88\x97",245)) then
		_0x993AA18C.Parent = _0x442AE337
	else
		_0x993AA18C.Parent = _0x44D83C99:WaitForChild(_0xD7C0DE("\x46\x7B\x79\x60\x7F\x69\x5B\x68\x77",21))
	end
end)
	if not _0x4D7ED4D8 then
		pcall(function()
	_0x993AA18C.Parent = _0x44D83C99.PlayerGui
end)
	end
	local _0xD99AB0C4 = nil
	pcall(function()
	_0xD99AB0C4 = game:GetService(_0xD7C0DE("\x40\x62\x73\x72\x76\x4A\x7F\x69\x6A\x74\x7D\x7A",19))
end)
	local function _0x18A9CA22(_0x44C30D87, _0x1FA484A3, _0x2EC74ECB)
		if _0xD99AB0C4 and _0x44C30D87 then
			local _0x51A2837A = pcall(function()
	_0xD99AB0C4:Create(_0x44C30D87, TweenInfo.new(_0x2EC74ECB, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), _0x1FA484A3):Play()
end)
			if _0x51A2837A then
				return
			end
		end
		for _0xD2C330, _0x8831F962 in pairs(_0x1FA484A3) do
			pcall(function()
	_0x44C30D87[_0xD2C330] = _0x8831F962
end)
		end
	end
	local _0x128AACEA = Instance.new("\x46\x72\x61\x6D\x65")
	_0x128AACEA.Name = "\x43\x61\x72\x64"
	_0x128AACEA.Size = UDim2.new(0, 520, 0, 300)
	_0x128AACEA.AnchorPoint = Vector2.new(0.5, 0.5)
	_0x128AACEA.Position = UDim2.new(0.5, 0, 0.5, 14)
	_0x128AACEA.BackgroundColor3 = _0xA7330090
	_0x128AACEA.BorderSizePixel = 0
	_0x128AACEA.Active = true
	_0x128AACEA.Draggable = true
	_0x128AACEA.Parent = _0x993AA18C
	local _0x712C2845 = Instance.new(_0xD7C0DE("\x63\x7E\x7B\x56\x48\x55\x59\x4F",53))
	_0x712C2845.CornerRadius = UDim.new(0, 14)
	_0x712C2845.Parent = _0x128AACEA
	local _0x1AAAB7E4 = Instance.new(_0xD7C0DE("\xD3\xCE\xDB\xFD\xF8\xE4\xE7\xE8",133))
	_0x1AAAB7E4.Thickness = 1
	_0x1AAAB7E4.Color = Color3.fromRGB(255, 255, 255)
	_0x1AAAB7E4.Transparency = 0.93000000000000005
	_0x1AAAB7E4.Parent = _0x128AACEA
	local _0xF3C230D5 = Instance.new("\x55\x49\x53\x63\x61\x6C\x65")
	_0xF3C230D5.Scale = 0.93999999999999995
	_0xF3C230D5.Parent = _0x128AACEA
	local _0xA518FAD9 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xA518FAD9.Name = "\x48\x65\x61\x64\x65\x72"
	_0xA518FAD9.Size = UDim2.new(1, 0, 0, 62)
	_0xA518FAD9.BackgroundTransparency = 1
	_0xA518FAD9.Parent = _0x128AACEA
	local _0xD98CFA0D = Instance.new("\x46\x72\x61\x6D\x65")
	_0xD98CFA0D.Size = UDim2.new(0, 34, 0, 34)
	_0xD98CFA0D.Position = UDim2.new(0, 18, 0, 14)
	_0xD98CFA0D.BackgroundColor3 = _0x6DB8BD35
	_0xD98CFA0D.BorderSizePixel = 0
	_0xD98CFA0D.Parent = _0xA518FAD9
	local _0x4867C564 = Instance.new(_0xD7C0DE("\xE8\xF7\xFC\xAF\xB3\xAC\xA6\xB6",188))
	_0x4867C564.CornerRadius = UDim.new(0, 10)
	_0x4867C564.Parent = _0xD98CFA0D
	local _0xEB5CBE13 = Instance.new(_0xD7C0DE("\xA8\xB7\xB8\x72\x60\x66\x6A\x61\x6B\x72",252))
	_0xEB5CBE13.Color = ColorSequence.new(_0x6DB8BD35, _0xFAC6BB7D)
	_0xEB5CBE13.Rotation = 45
	_0xEB5CBE13.Parent = _0xD98CFA0D
	local _0xE74CB8A1 = Instance.new(_0xD7C0DE("\x9D\xAF\xB3\xB8\x81\xAF\xAD\xB5\xBD",200))
	_0xE74CB8A1.Size = UDim2.new(1, 0, 1, 0)
	_0xE74CB8A1.BackgroundTransparency = 1
	_0xE74CB8A1.Text = "\x42\x48"
	_0xE74CB8A1.TextColor3 = Color3.fromRGB(255, 255, 255)
	_0xE74CB8A1.TextSize = 13
	_0xE74CB8A1.Parent = _0xD98CFA0D
	_0xD3686E65(_0xE74CB8A1, _0xD7C0DE("\xBA\x91\x8B\x68\x60\x6F\x41\x6B\x69\x62",252))
	local _0xC5E3E896 = Instance.new(_0xD7C0DE("\xA1\x93\x8F\x8C\xB5\x9B\x99\x99\x91",244))
	_0xC5E3E896.Position = UDim2.new(0, 62, 0, 12)
	_0xC5E3E896.Size = UDim2.new(1, -230, 0, 20)
	_0xC5E3E896.BackgroundTransparency = 1
	_0xC5E3E896.Text = _0xCBCED3F0
	_0xC5E3E896.TextColor3 = _0xFD8878AC
	_0xC5E3E896.TextSize = 18
	_0xC5E3E896.TextXAlignment = Enum.TextXAlignment.Left
	_0xC5E3E896.TextTruncate = Enum.TextTruncate.AtEnd
	_0xC5E3E896.Parent = _0xA518FAD9
	_0xD3686E65(_0xC5E3E896, _0xD7C0DE("\xEE\xC5\xDF\xC4\xCC\xC3\xED\xDF\xDD\xD6",168))
	local _0x94EC457C = Instance.new(_0xD7C0DE("\x5C\x6C\x72\x7F\x40\x6C\x6C\x6A\x7C",7))
	_0x94EC457C.Position = UDim2.new(0, 62, 0, 33)
	_0x94EC457C.Size = UDim2.new(1, -230, 0, 16)
	_0x94EC457C.BackgroundTransparency = 1
	_0x94EC457C.Text = _0xD7C0DE("\x14\x05\x18\x42\x30\x1D\x16\x12\x02\x05",94)
	_0x94EC457C.TextColor3 = _0xCE9F28E8
	_0x94EC457C.TextSize = 12
	_0x94EC457C.TextXAlignment = Enum.TextXAlignment.Left
	_0x94EC457C.Parent = _0xA518FAD9
	_0xD3686E65(_0x94EC457C, "\x47\x6F\x74\x68\x61\x6D")
	local _0x78802720 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x78802720.AnchorPoint = Vector2.new(1, 0)
	_0x78802720.Position = UDim2.new(1, -52, 0, 16)
	_0x78802720.Size = UDim2.new(0, 84, 0, 24)
	_0x78802720.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0x78802720.BackgroundTransparency = 0.95999999999999996
	_0x78802720.BorderSizePixel = 0
	_0x78802720.Parent = _0xA518FAD9
	local _0x68D73D3A = Instance.new(_0xD7C0DE("\x2F\x32\x3F\x12\x0C\x11\xE5\xF3",121))
	_0x68D73D3A.CornerRadius = UDim.new(1, 0)
	_0x68D73D3A.Parent = _0x78802720
	local _0xD0CFE8AE = Instance.new(_0xD7C0DE("\x01\x1C\x05\x23\x2A\x36\x31\x3E",83))
	_0xD0CFE8AE.Thickness = 1
	_0xD0CFE8AE.Color = Color3.fromRGB(255, 255, 255)
	_0xD0CFE8AE.Transparency = 0.90000000000000002
	_0xD0CFE8AE.Parent = _0x78802720
	local _0x690E1055 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x690E1055.Size = UDim2.new(0, 8, 0, 8)
	_0x690E1055.Position = UDim2.new(0, 10, 0.5, -4)
	_0x690E1055.BackgroundColor3 = _0xE49AF46E
	_0x690E1055.BorderSizePixel = 0
	_0x690E1055.Parent = _0x78802720
	local _0x9364AC0A = Instance.new(_0xD7C0DE("\x49\x54\x5D\x70\x52\x4F\x47\x51",27))
	_0x9364AC0A.CornerRadius = UDim.new(1, 0)
	_0x9364AC0A.Parent = _0x690E1055
	local _0x69D3633E = Instance.new(_0xD7C0DE("\x92\xA2\xB0\xBD\x86\xAA\xAE\xA8\xA2",197))
	_0x69D3633E.Position = UDim2.new(0, 24, 0, 0)
	_0x69D3633E.Size = UDim2.new(1, -30, 1, 0)
	_0x69D3633E.BackgroundTransparency = 1
	_0x69D3633E.Text = "\x53\x65\x63\x75\x72\x65"
	_0x69D3633E.TextColor3 = _0xCE9F28E8
	_0x69D3633E.TextSize = 11
	_0x69D3633E.TextXAlignment = Enum.TextXAlignment.Left
	_0x69D3633E.Parent = _0x78802720
	_0xD3686E65(_0x69D3633E, "\x47\x6F\x74\x68\x61\x6D")
	local _0xFCE846B6 = Instance.new(_0xD7C0DE("\x8B\x85\x99\x96\xA1\x91\x91\x92\x88\x86",222))
	_0xFCE846B6.AnchorPoint = Vector2.new(1, 0)
	_0xFCE846B6.Position = UDim2.new(1, -14, 0, 12)
	_0xFCE846B6.Size = UDim2.new(0, 26, 0, 26)
	_0xFCE846B6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0xFCE846B6.BackgroundTransparency = 1
	_0xFCE846B6.BorderSizePixel = 0
	_0xFCE846B6.Text = "\xC3\x97"
	_0xFCE846B6.TextColor3 = _0xCE9F28E8
	_0xFCE846B6.TextSize = 15
	_0xFCE846B6.AutoButtonColor = false
	_0xFCE846B6.Parent = _0xA518FAD9
	_0xD3686E65(_0xFCE846B6, _0xD7C0DE("\x8F\xA6\xBE\xA3\xAD\xA0\x8C\xA0\xBC\xB5",199))
	local _0x7D3BF574 = Instance.new(_0xD7C0DE("\x5C\x43\x48\x63\x7F\x60\x6A\x62",8))
	_0x7D3BF574.CornerRadius = UDim.new(0, 7)
	_0x7D3BF574.Parent = _0xFCE846B6
	local _0x97357DF5 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x97357DF5.Position = UDim2.new(0, 16, 0, 60)
	_0x97357DF5.Size = UDim2.new(1, -32, 0, 1)
	_0x97357DF5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0x97357DF5.BackgroundTransparency = 0.93999999999999995
	_0x97357DF5.BorderSizePixel = 0
	_0x97357DF5.Parent = _0x128AACEA
	local _0x4CCF47F2 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x4CCF47F2.Name = "\x42\x6F\x64\x79"
	_0x4CCF47F2.Position = UDim2.new(0, 18, 0, 72)
	_0x4CCF47F2.Size = UDim2.new(1, -36, 1, -84)
	_0x4CCF47F2.BackgroundTransparency = 1
	_0x4CCF47F2.Parent = _0x128AACEA
	local _0x28D71179 = Instance.new(_0xD7C0DE("\xE1\xD3\xCF\xCC\xF5\xDB\xD9\xD9\xD1",180))
	_0x28D71179.Size = UDim2.new(1, 0, 0, 16)
	_0x28D71179.BackgroundTransparency = 1
	_0x28D71179.Text = _0xD7C0DE("\x85\xA6\xA5\xA2\xBB\xBA\xEA\xA0\xA9\xB4",195)
	_0x28D71179.TextColor3 = _0xCE9F28E8
	_0x28D71179.TextSize = 12
	_0x28D71179.TextXAlignment = Enum.TextXAlignment.Left
	_0x28D71179.Parent = _0x4CCF47F2
	_0xD3686E65(_0x28D71179, _0xD7C0DE("\x70\x57\x4D\x52\x5A\x51\x70\x5B\x5B\x29\x34\x2F",54))
	local _0x7B294189 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x7B294189.Name = _0xD7C0DE("\x8B\xAD\xB4\xB0\xB2\x85\xA7\xB1",193)
	_0x7B294189.Position = UDim2.new(0, 0, 0, 22)
	_0x7B294189.Size = UDim2.new(1, 0, 0, 42)
	_0x7B294189.BackgroundColor3 = _0xCC6615D1
	_0x7B294189.BorderSizePixel = 0
	_0x7B294189.Parent = _0x4CCF47F2
	local _0x2E8C3625 = Instance.new(_0xD7C0DE("\x38\x27\x2C\x1F\x03\x1C\x16\x06",108))
	_0x2E8C3625.CornerRadius = UDim.new(0, 9)
	_0x2E8C3625.Parent = _0x7B294189
	local _0x22951144 = Instance.new(_0xD7C0DE("\x71\x6C\x75\x53\x5A\x46\x41\x4E",35))
	_0x22951144.Thickness = 1
	_0x22951144.Color = Color3.fromRGB(255, 255, 255)
	_0x22951144.Transparency = 0.92000000000000004
	_0x22951144.Parent = _0x7B294189
	local _0xFBCFAB42 = Instance.new("\x54\x65\x78\x74\x42\x6F\x78")
	_0xFBCFAB42.Name = _0xD7C0DE("\x03\x2C\x33\x02\x22\x3D\x3B\x3B",71)
	_0xFBCFAB42.Position = UDim2.new(0, 12, 0, 0)
	_0xFBCFAB42.Size = UDim2.new(1, -100, 1, 0)
	_0xFBCFAB42.BackgroundTransparency = 1
	_0xFBCFAB42.BorderSizePixel = 0
	_0xFBCFAB42.PlaceholderText = _0xD7C0DE("\xA3\xB4\xA2\xAD\xC4\x08\x6B\x4A\xCD\x81\x9D\xD0\xA1\xA0\xB6\xB9\xD8\x14\x77\x5E",228)
	_0xFBCFAB42.PlaceholderColor3 = Color3.fromRGB(96, 106, 122)
	_0xFBCFAB42.Text = ""
	_0xFBCFAB42.TextColor3 = _0xFD8878AC
	_0xFBCFAB42.TextSize = 14
	_0xFBCFAB42.ClearTextOnFocus = false
	_0xFBCFAB42.TextXAlignment = Enum.TextXAlignment.Left
	_0xFBCFAB42.Parent = _0x7B294189
	_0xD3686E65(_0xFBCFAB42, "\x47\x6F\x74\x68\x61\x6D")
	local _0xDB8637A9 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xDB8637A9.Name = _0xD7C0DE("\x01\x2F\x27\x3D\x1A\x32\x32\x2C",84)
	_0xDB8637A9.AnchorPoint = Vector2.new(1, 0.5)
	_0xDB8637A9.Position = UDim2.new(1, -10, 0.5, 0)
	_0xDB8637A9.Size = UDim2.new(0, 64, 0, 18)
	_0xDB8637A9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0xDB8637A9.BackgroundTransparency = 0.93999999999999995
	_0xDB8637A9.BorderSizePixel = 0
	_0xDB8637A9.Parent = _0x7B294189
	local _0xC70B40D9 = Instance.new(_0xD7C0DE("\x86\x9D\x96\xB9\xA5\xB6\xBC\xA8",210))
	_0xC70B40D9.CornerRadius = UDim.new(1, 0)
	_0xC70B40D9.Parent = _0xDB8637A9
	local _0x6F72F291 = Instance.new(_0xD7C0DE("\x29\x34\x2D\x0B\xF2\xEE\xE9\xE6",123))
	_0x6F72F291.Thickness = 1
	_0x6F72F291.Color = _0xCE9F28E8
	_0x6F72F291.Transparency = 0.84999999999999998
	_0x6F72F291.Parent = _0xDB8637A9
	local _0x7B10218 = Instance.new(_0xD7C0DE("\x3E\x0E\x14\x19\x22\x0E\x12\x14\x1E",105))
	_0x7B10218.Size = UDim2.new(1, 0, 1, 0)
	_0x7B10218.BackgroundTransparency = 1
	_0x7B10218.Text = "\xE2\x80\x94"
	_0x7B10218.TextColor3 = _0xCE9F28E8
	_0x7B10218.TextSize = 10
	_0x7B10218.Parent = _0xDB8637A9
	_0xD3686E65(_0x7B10218, _0xD7C0DE("\xD0\xF7\xED\xF2\xFA\xF1\xD0\xFB\xFB\xC9\xD4\xCF",150))
	local _0xA29AD29F = pcall(function()
	_0x7B10218.AutomaticSize = Enum.AutomaticSize.X
	_0x7B10218.Size = UDim2.new(0, 0, 1, 0)
end)
	if _0xA29AD29F then
		pcall(function()
	local _0xC4F55B2F = Instance.new(_0xD7C0DE("\x02\x11\x09\x3B\x3F\x38\x34\x30\x38",86))
	_0xC4F55B2F.PaddingLeft = UDim.new(0, 9)
	_0xC4F55B2F.PaddingRight = UDim.new(0, 9)
	_0xC4F55B2F.Parent = _0xDB8637A9
	_0xDB8637A9.AutomaticSize = Enum.AutomaticSize.X
	_0xDB8637A9.Size = UDim2.new(0, 0, 0, 18)
end)
	end
	local _0x8C749901 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x8C749901.Position = UDim2.new(0, 0, 0, 70)
	_0x8C749901.Size = UDim2.new(1, 0, 0, 16)
	_0x8C749901.BackgroundTransparency = 1
	_0x8C749901.Parent = _0x4CCF47F2
	local _0x3280D9E8 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x3280D9E8.Size = UDim2.new(0, 6, 0, 6)
	_0x3280D9E8.Position = UDim2.new(0, 1, 0.5, -3)
	_0x3280D9E8.BackgroundColor3 = _0xE49AF46E
	_0x3280D9E8.BorderSizePixel = 0
	_0x3280D9E8.Parent = _0x8C749901
	local _0x86BA6450 = Instance.new(_0xD7C0DE("\xBD\xA0\xA9\x84\x9E\x83\x8B\x9D",231))
	_0x86BA6450.CornerRadius = UDim.new(1, 0)
	_0x86BA6450.Parent = _0x3280D9E8
	local _0x89241D96 = Instance.new(_0xD7C0DE("\xE8\xD8\xC6\xCB\x8C\xA0\xA0\xA6\xA8",187))
	_0x89241D96.Position = UDim2.new(0, 14, 0, 0)
	_0x89241D96.Size = UDim2.new(1, -14, 1, 0)
	_0x89241D96.BackgroundTransparency = 1
	_0x89241D96.Text = ""
	_0x89241D96.TextColor3 = _0xCE9F28E8
	_0x89241D96.TextSize = 12
	_0x89241D96.TextXAlignment = Enum.TextXAlignment.Left
	_0x89241D96.TextTruncate = Enum.TextTruncate.AtEnd
	_0x89241D96.Parent = _0x8C749901
	_0xD3686E65(_0x89241D96, "\x47\x6F\x74\x68\x61\x6D")
	local _0xC0A16067 = Instance.new(_0xD7C0DE("\x68\x58\x46\x4B\x02\x34\x36\x37\x2B\x2B",59))
	_0xC0A16067.Name = "\x53\x75\x62\x6D\x69\x74"
	_0xC0A16067.Position = UDim2.new(0, 0, 0, 94)
	_0xC0A16067.Size = UDim2.new(1, 0, 0, 44)
	_0xC0A16067.BackgroundColor3 = _0xFAC6BB7D
	_0xC0A16067.BorderSizePixel = 0
	_0xC0A16067.Text = ""
	_0xC0A16067.AutoButtonColor = false
	_0xC0A16067.Parent = _0x4CCF47F2
	local _0xDABD94CF = Instance.new(_0xD7C0DE("\x9D\x80\x89\xA4\xBE\xA3\xAB\xBD",199))
	_0xDABD94CF.CornerRadius = UDim.new(0, 9)
	_0xDABD94CF.Parent = _0xC0A16067
	local _0x15AE203 = Instance.new(_0xD7C0DE("\x98\x87\x88\xA2\xB0\xB6\xBA\xB1\xBB\xA2",204))
	_0x15AE203.Color = ColorSequence.new(_0x6DB8BD35, _0xFAC6BB7D)
	_0x15AE203.Rotation = 0
	_0x15AE203.Parent = _0xC0A16067
	local _0x7F08FB0A = Instance.new("\x46\x72\x61\x6D\x65")
	_0x7F08FB0A.Size = UDim2.new(1, 0, 1, 0)
	_0x7F08FB0A.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0x7F08FB0A.BackgroundTransparency = 1
	_0x7F08FB0A.BorderSizePixel = 0
	_0x7F08FB0A.Parent = _0xC0A16067
	local _0xD029C553 = Instance.new(_0xD7C0DE("\x41\x5C\x55\x78\x6A\x77\x7F\x69",19))
	_0xD029C553.CornerRadius = UDim.new(0, 9)
	_0xD029C553.Parent = _0x7F08FB0A
	local _0x11A3E142 = Instance.new(_0xD7C0DE("\x67\x51\x4D\x42\x7B\x59\x5B\x5F\x57",50))
	_0x11A3E142.Size = UDim2.new(1, 0, 1, 0)
	_0x11A3E142.BackgroundTransparency = 1
	_0x11A3E142.Text = _0xD7C0DE("\xD8\xFA\xF7\xF3\xB8\xCA\xF9\xE9\xF5\xED\xEA",147)
	_0x11A3E142.TextColor3 = Color3.fromRGB(255, 255, 255)
	_0x11A3E142.TextSize = 15
	_0x11A3E142.Parent = _0xC0A16067
	_0xD3686E65(_0x11A3E142, _0xD7C0DE("\x3A\x11\x0B\xE8\xE0\xEF\xD0\xE1\xE8\xEF\xE5\xE7\xE5\xEE",124))
	local _0x86F3508C = Instance.new(_0xD7C0DE("\x64\x54\x4A\x47\x76\x40\x42\x43\x57\x57",47))
	_0x86F3508C.Position = UDim2.new(0, 0, 0, 148)
	_0x86F3508C.Size = UDim2.new(0, 118, 0, 28)
	_0x86F3508C.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0x86F3508C.BackgroundTransparency = 0.94999999999999996
	_0x86F3508C.BorderSizePixel = 0
	_0x86F3508C.Text = "\x47\x65\x74\x20\x4B\x65\x79"
	_0x86F3508C.TextColor3 = _0xFD8878AC
	_0x86F3508C.TextSize = 12
	_0x86F3508C.AutoButtonColor = false
	_0x86F3508C.Parent = _0x4CCF47F2
	_0xD3686E65(_0x86F3508C, "\x47\x6F\x74\x68\x61\x6D")
	local _0x4E5D5BFA = Instance.new(_0xD7C0DE("\xB5\xA8\xA1\x8C\x96\x8B\x83\x95",223))
	_0x4E5D5BFA.CornerRadius = UDim.new(0, 8)
	_0x4E5D5BFA.Parent = _0x86F3508C
	local _0x77FBD5F3 = Instance.new(_0xD7C0DE("\xA5\x97\x8B\x80\xB9\x97\x95\x9D\x95",240))
	_0x77FBD5F3.AnchorPoint = Vector2.new(1, 0)
	_0x77FBD5F3.Position = UDim2.new(1, 0, 0, 152)
	_0x77FBD5F3.Size = UDim2.new(0, 200, 0, 20)
	_0x77FBD5F3.BackgroundTransparency = 1
	_0x77FBD5F3.Text = _0xD7C0DE("\x75\x40\x42\x58\x15\x55\x55\x5C\x55\x53\x1E\x50\x2E\x61\x2D\x33\x21\x2B",51)
	_0x77FBD5F3.TextColor3 = _0xCE9F28E8
	_0x77FBD5F3.TextSize = 11
	_0x77FBD5F3.TextXAlignment = Enum.TextXAlignment.Right
	_0x77FBD5F3.Parent = _0x4CCF47F2
	_0xD3686E65(_0x77FBD5F3, "\x47\x6F\x74\x68\x61\x6D")
	local _0xB7997C82 = string.gsub(_0xD0D81BB1(), _0xD7C0DE("\x76\x41\x5E\x5F\x5C\x5E\x11\x15\x1F\x1E",39), "")
	local _0xA7BE714A = Instance.new(_0xD7C0DE("\xD6\xE6\xFC\xF1\xCA\xE6\xEA\xEC\xE6",129))
	_0xA7BE714A.Position = UDim2.new(0, 0, 0, 192)
	_0xA7BE714A.Size = UDim2.new(1, 0, 0, 14)
	_0xA7BE714A.BackgroundTransparency = 1
	_0xA7BE714A.Text = _0xB7997C82 .. _0xD7C0DE("\x22\xE1\x84\xA7\x26\x51\x6D\x7B\x63\x6D\x65\x68\x6A",1)
	_0xA7BE714A.TextColor3 = _0xCE9F28E8
	_0xA7BE714A.TextSize = 10
	_0xA7BE714A.TextXAlignment = Enum.TextXAlignment.Left
	_0xA7BE714A.Parent = _0x4CCF47F2
	_0xD3686E65(_0xA7BE714A, "\x47\x6F\x74\x68\x61\x6D")
	local _0x65B1ED56 = false
	local function _0x3B59F5B0(_0x2C6E0283, _0x55B5BDB)
		_0x55B5BDB = _0x55B5BDB or "\x69\x64\x6C\x65"
		local _0x3FE6CDDB = _0xCE9F28E8
		local _0xE46FC417 = _0xE49AF46E
		local _0x4EF3D772 = "\x53\x65\x63\x75\x72\x65"
		if _0x55B5BDB == "\x77\x6F\x72\x6B" then
			_0x3FE6CDDB = _0x6DB8BD35
			_0xE46FC417 = _0x6DB8BD35
			_0x4EF3D772 = "\x57\x6F\x72\x6B\x69\x6E\x67"
		elseif _0x55B5BDB == "\x6F\x6B" then
			_0x3FE6CDDB = _0x101B7BD6
			_0xE46FC417 = _0x101B7BD6
			_0x4EF3D772 = _0xD7C0DE("\xA6\x94\x80\x9A\x92\x9C\x93\x93",239)
		elseif _0x55B5BDB == "\x65\x72\x72" then
			_0x3FE6CDDB = _0x49B3ABF5
			_0xE46FC417 = _0x49B3ABF5
			_0x4EF3D772 = "\x45\x72\x72\x6F\x72"
		end
		_0x89241D96.Text = _0x2C6E0283 or ""
		_0x89241D96.TextColor3 = _0x3FE6CDDB
		_0x3280D9E8.BackgroundColor3 = _0x3FE6CDDB
		_0x690E1055.BackgroundColor3 = _0xE46FC417
		_0x69D3633E.Text = _0x4EF3D772
		_0x69D3633E.TextColor3 = _0x3FE6CDDB
	end
	local function _0x38125FD3(_0xD1116391)
		local _0x97B9CE03 = string.upper(_0xD1116391 or "")
		if _0x97B9CE03 == "" then
			_0x7B10218.Text = "\xE2\x80\x94"
			_0x7B10218.TextColor3 = _0xCE9F28E8
			_0xDB8637A9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			_0xDB8637A9.BackgroundTransparency = 0.93999999999999995
		elseif string.find(_0x97B9CE03, _0xD7C0DE("\x37\x2C\x39\x29\x28\x35\x4A\x5E\x54\x5F\x2E",104)) then
			_0x7B10218.Text = "\x46\x52\x45\x45"
			_0x7B10218.TextColor3 = _0x6DB8BD35
			_0xDB8637A9.BackgroundColor3 = _0x6DB8BD35
			_0xDB8637A9.BackgroundTransparency = 0.85999999999999999
		elseif string.find(_0x97B9CE03, _0xD7C0DE("\xB9\xB8\xBB\xAF\xA6\xB7\xC8\xC0\xCA\xDD\xAC",230)) then
			_0x7B10218.Text = "\x50\x52\x45\x4D\x49\x55\x4D"
			_0x7B10218.TextColor3 = _0xDEF13C27
			_0xDB8637A9.BackgroundColor3 = _0xDEF13C27
			_0xDB8637A9.BackgroundTransparency = 0.85999999999999999
		else
			_0x7B10218.Text = "\x49\x4E\x56\x41\x4C\x49\x44"
			_0x7B10218.TextColor3 = _0x49B3ABF5
			_0xDB8637A9.BackgroundColor3 = _0x49B3ABF5
			_0xDB8637A9.BackgroundTransparency = 0.85999999999999999
		end
		_0x6F72F291.Color = _0x7B10218.TextColor3
	end
	local function _0x1483D932(_0x18234976)
		_0x65B1ED56 = _0x18234976 and true or false
		if _0x65B1ED56 then
			_0x11A3E142.Text = _0xD7C0DE("\x69\x25\x33\x2B\x25\x3D\x2C\x28\x20\xAA\xC9\xEC",62)
			_0x11A3E142.TextTransparency = 0.25
			_0x15AE203.Transparency = NumberSequence.new(0.45000000000000001)
		else
			_0x11A3E142.Text = _0xD7C0DE("\x7E\x5C\x55\x51\x16\x64\x5B\x4B\x53\x4B\x48",49)
			_0x11A3E142.TextTransparency = 0
			_0x15AE203.Transparency = NumberSequence.new(0)
		end
	end
	local function _0x83E30D4(_0x75DEEBA6, _0x505FC374)
		_0xB7BBBB53:SetCore(_0xD7C0DE("\x64\x5D\x57\x5E\x75\x53\x49\x57\x59\x29\x22\x23\x37\x2D\x2A\x28",54), {Title = _0xCBCED3F0, Text = _0x75DEEBA6, Duration = _0x505FC374})
	end
	local function _0xD8A537B1()
		if _0x65B1ED56 then
			return
		end
		local _0xB4A29778 = string.gsub(_0xFBCFAB42.Text or "", "\x25\x73", "")
		if _0xB4A29778 == "" then
			_0x83E30D4(_0xD7C0DE("\x4C\x6D\x70\x2A\x68\x6D\x63\x60\x60\x64\x31\x70\x76\x34\x70\x7B\x67\x6C\x60\x34",6), 3)
			_0x3B59F5B0(_0xD7C0DE("\x61\x4E\x55\x0D\x4D\x4E\x5E\x5F\x5D\x47\x14\x57\x53\x17\x5D\x54\x4A\x4F\x45\x13",41), "\x65\x72\x72")
			return
		end
		local _0x85DABD61 = _0x23FEA893(_0xB4A29778)
		if not _0x85DABD61 then
			_0x83E30D4(_0xD7C0DE("\x98\xBC\xA5\xB5\xB9\xBF\xB3\xF8\xB2\xBF\xA2\xFC\xBB\xB1\xAD\x8D\x80\x96\xCD\xC4\xB0\x95\x82\xC8\xAF\xB8\xAE\xA9\xC3\xC4\xCF\x9F\x83\xD2\xA3\xA6\xB0\xBB\xD9\xD2",208), 4)
			_0x3B59F5B0(_0xD7C0DE("\xD3\xF5\xEA\xFC\xF2\xF6\xC4\x81\xC9\xC6\xDD\x85\xC0\xC8\xDA\xC4\xCB\xDF\x82",153), "\x65\x72\x72")
			return
		end
		local _0x7AF12DBE = _0xE6ABD8E4(_0x85DABD61)
		if not _0x7AF12DBE then
			_0x83E30D4(_0xD7C0DE("\x2F\x0D\x43\x37\x26\x34\x2E\x38\x3D\x35\x22\x28\x3E\x4E\x0C\x1F\x1F\x14\x1A\x13\x00\x04\x12\x1C\x59\x1C\x14\x0E\x5D\x0A\x17\xE9\xF2\xA2\xE6\xFC\xE0\xE5\xF2\xFC\xE6\xF8\xA5",96), 4)
			_0x3B59F5B0(_0xD7C0DE("\x90\x87\x97\x8F\x97\x9C\x96\x83\x8F\x9F\xED\xA0\xA0\xA4\xF1\xB1\xBC\xBA\xB3\xBF\xB0\xAD\xAB\xBF\xBF\xF2",194), "\x65\x72\x72")
			return
		end
		if not _0x941D3BF8(_0x85DABD61, _0x7AF12DBE) then
			_0x83E30D4(_0x85DABD61 .. _0xD7C0DE("\xC6\x8C\x8D\x90\xCA\x88\x8D\x83\x80\x80\x84\xD1\x93\x90\x97\x90\x85\x84\xD8\x8D\x92\x92\x8F\xDD\x8D\x9C\x72\x68\x72\x77\x2A",229), 4)
			_0x3B59F5B0(_0xD7C0DE("\x50\x71\x70\x71\x66\x65\x37\x7C\x7C\x74\x72\x79\x79\x3E\x79\x4F\x53\x02\x50\x47\x57\x4F\x57\x5C\x09\x43\x4F\x0C",16) .. _0x7AF12DBE, "\x65\x72\x72")
			return
		end
		_0x1483D932(true)
		_0x3B59F5B0(_0xD7C0DE("\x1C\x3E\x28\x3E\x36\x36\x0E\x06\x42\x10\x07\x17\x0F\x17\x1C\x49\x0C\x19\x03\x00\x4E\x1C\x15\x03\x04\x16\x06\x5B\x58\x59",89), "\x77\x6F\x72\x6B")
		task.spawn(function()
	local _0xA78852BB = _0xB2FD28C1(_0xB4A29778, _0x7AF12DBE)
	if _0xA78852BB then
		_0x83E30D4(_0xD7C0DE("\x4A\x79\x69\x75\x6D\x6A\x3F\x4C\x4E\x43\x47\x41\x41\x06\x54\x5D\x4A\x49\x4E\x5F\x5E\x48\x5A\x5C\x5D\x4B\x12",24), 4)
		_0x3CEB53AF(_0xB4A29778)
		_0x993AA18C:Destroy()
		if _0x20642121 then
			_0x20642121()
		end
	else
		_0x83E30D4(_0xD7C0DE("\x12\x34\x3F\x3B\x3D\x3D\x7A\x2F\x33\x7D\x32\x30\x01\x05\x42\x10\x07\x17\x0F\x17\x1C\x47\x4A\x28\x04\x08\x0D\x04\x50\x08\x1D\x06\x06\x55\x1D\x12\x01\x59\x55\x5B\x0F\x18\x0C\x09\xE5\xF3\xAC",83), 5)
		_0x1483D932(false)
		if _0x993AA18C.Parent ~= nil then
			_0x3B59F5B0(_0xD7C0DE("\xF1\xD9\xD0\xD6\xDE\xD8\x9D\xCA\xD0\xE0\xAD\xAD\xA2\xA0\xE5\xB5\xA4\xBA\xA0\xBA\xBF\xE2\xED\x9E\xA3\xB5\xB0\xA1\xB6\xF4\xA1\xA4\xAE\xF8\xB8\xBD\xBA\xB5\xB3\xF0",182), "\x65\x72\x72")
		end
	end
end)
	end
	_0x38125FD3("")
	_0x3B59F5B0("", "\x69\x64\x6C\x65")
	_0xFCE846B6.MouseEnter:Connect(function()
	_0x18A9CA22(_0xFCE846B6, {BackgroundTransparency = 0.93999999999999995}, 0.14999999999999999)
end)
	_0xFCE846B6.MouseLeave:Connect(function()
	_0x18A9CA22(_0xFCE846B6, {BackgroundTransparency = 1}, 0.14999999999999999)
end)
	_0xFCE846B6.MouseButton1Click:Connect(function()
	_0x993AA18C:Destroy()
end)
	_0x86F3508C.MouseEnter:Connect(function()
	_0x18A9CA22(_0x86F3508C, {BackgroundTransparency = 0.90000000000000002}, 0.14999999999999999)
end)
	_0x86F3508C.MouseLeave:Connect(function()
	_0x18A9CA22(_0x86F3508C, {BackgroundTransparency = 0.94999999999999996}, 0.14999999999999999)
end)
	_0xC0A16067.MouseEnter:Connect(function()
	if _0x65B1ED56 then
		return
	end
	_0x18A9CA22(_0x7F08FB0A, {BackgroundTransparency = 0.88}, 0.14999999999999999)
end)
	_0xC0A16067.MouseLeave:Connect(function()
	_0x18A9CA22(_0x7F08FB0A, {BackgroundTransparency = 1}, 0.14999999999999999)
end)
	_0xC0A16067.MouseButton1Click:Connect(_0xD8A537B1)
	pcall(function()
	_0xFBCFAB42:GetPropertyChangedSignal("\x54\x65\x78\x74"):Connect(function()
	_0x38125FD3(_0xFBCFAB42.Text)
end)
end)
	_0xFBCFAB42.Focused:Connect(function()
	_0x18A9CA22(_0x22951144, {Transparency = 0.34999999999999998}, 0.14999999999999999)
end)
	_0xFBCFAB42.FocusLost:Connect(function(_0x1183F6CF)
	_0x18A9CA22(_0x22951144, {Transparency = 0.92000000000000004}, 0.14999999999999999)
	if _0x1183F6CF then
		_0xD8A537B1()
	end
end)
	_0x86F3508C.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(_0xAE1E056A)
		_0xB7BBBB53:SetCore(_0xD7C0DE("\x45\x72\x76\x7D\x54\x74\x68\x74\x78\x76\x43\x40\x56\x4A\x4B\x4B",21), {Title = _0xCBCED3F0, Text = _0xD7C0DE("\x52\x73\x63\x38\x52\x7F\x62\x3C\x71\x77\x71\x4B\x01\x41\x4C\x54\x4C\x43\x43\x08\x5D\x45\x0B\x4F\x41\x47\x5F\x52\x5E\x53\x41\x50",20), Duration = 5})
	else
		_0xB7BBBB53:SetCore(_0xD7C0DE("\x2E\x1B\x11\xE4\xCF\xED\xF7\xED\xE3\xEF\xE4\xE9\xFD\xE3\xE4\xE2",124), {Title = _0xCBCED3F0, Text = _0xD7C0DE("\xD1\xED\xF3\xF4\xED\xED\xF5\xE9\xBC\xF9\xF1\xFA\xD3\x81\xCC\xCC\xD0\x85\xD5\xD2\xD8\xD9\xC5\xD9\xD8\x8D\xCD\xC3\xD9\xC1\xD0\xDC\xD5\xC7\xD2\x99\x98\xF6\xCA\xDE\xD2\x9D\xD3\xDE\xAE\xB4\xA3\xAF\xA8\xBC\xFC\xE7",147) .. _0xAE1E056A, Duration = 5})
	end
	_0x3B59F5B0(_0xD7C0DE("\xE1\xDF\xD5\xDF\x92\xF4\xD1\xC1\x96\xFC\xDD\xC0\x9A\xCB\xDD\xDA\xDB\x9F\xA9\xAF\xE2\xBA\xAB\xB0\xB4\xE7\xAA\xBB\xA5\xBC\xBF\xA8\xBC\xE3\xF0\xA5\xBA\xB6\xBA\xF5\xA6\xB6\xAB\xAD\xBF\xFB\xA8\xB5\xBB\xFF\xA6\xB3\xA7\xA6\xCB\xB5\xB4\xA2\xA5\xC9\x81\x8E\x95\xCD\x86\x8A\x82\x94\xDC",173))
end)
	_0x18A9CA22(_0x128AACEA, {Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.28000000000000003)
	_0x18A9CA22(_0xF3C230D5, {Scale = 1}, 0.28000000000000003)
	pcall(function()
	task.delay(0.32000000000000001, function()
	pcall(function()
	_0xFBCFAB42:CaptureFocus()
end)
end)
end)
	return _0x993AA18C
end
local function _0x2AD3F6A1()
	print(_0xD7C0DE("\xA7\xBF\x92\x90\x78\x49\x77\x61\x59\x25\x4F\x69\x61\x7D\x63\x6A\x60\x64\x74\x66\x7E\x76\x3C\x3D\x3A",251))
	local _0xFD72974D = _0x2510FFFE()
	if _0xFD72974D and _0xFD72974D ~= "" then
		local _0x19CCC48 = _0x23FEA893(_0xFD72974D)
		if _0x19CCC48 then
			local _0xBDCFB58F = _0xE6ABD8E4(_0x19CCC48)
			if _0xBDCFB58F and _0x941D3BF8(_0x19CCC48, _0xBDCFB58F) then
				print(_0xD7C0DE("\x77\x6F\x42\x40\x48\x79\x47\x51\x69\x15\x70\x58\x4D\x57\x5E\x1B\x4F\x5C\x48\x5A\x24\x61\x29\x26\x3D\x69\x66\x26\x3C\x3D\x2F\x26\x3C\x39\x27\x21\x37\x71\x33\x26\x20\x3A\x7B\x3B\x37\x3E\x33\x35\x72\x73\x70",43))
				local _0x38D0AE5C, _0x3C210ED5 = pcall(function()
	return _0xB2FD28C1(_0xFD72974D, _0xBDCFB58F)
end)
				if _0x38D0AE5C and _0x3C210ED5 then
					_0xB7BBBB53:SetCore(_0xD7C0DE("\xB6\x83\x89\x8C\xA7\x85\x9F\x85\x8B\x87\x8C\x91\x85\x9B\x9C\x9A",228), {Title = _0xCBCED3F0, Text = _0xD7C0DE("\x9B\xAE\xA8\xB2\xF3\xB3\x8F\x86\x8B\x8D\xC4\x96\x93\x84\x8B\x8C\x99\x98\xCD\xCD\xAB\x81\x9A\x9E\x8B\xDD",217), Duration = 3})
					return
				else
					print(_0xD7C0DE("\x4F\x57\x7A\x78\x60\x51\x6F\x79\x41\x3D\x5F\x6A\x54\x4E\x0F\x4F\x4B\x42\x4F\x49\x08\x4F\x4B\x42\x40\x48\x4A\x15\x10",19) .. tostring(_0x3C210ED5 or _0xD7C0DE("\x0B\x2D\x32\x24\x2A\x2E\x2C\x69\x21\x2E\x35",65)))
					_0x68798A5F()
					_0xB7BBBB53:SetCore(_0xD7C0DE("\xDC\xF5\xFF\xF6\xDD\xFB\xE1\xFF\xF1\xF1\xFA\xFB\xEF\xF5\xF2\xF0",142), {Title = _0xCBCED3F0, Text = _0xD7C0DE("\x79\x4A\x5A\x48\x4A\x0F\x5B\x54\x4B\x13\x51\x4D\x46\x5E\x4A\x5C\x5E\x1B\x53\x4F\x1E\x56\x2E\x37\x23\x2F\x2D\x21\x68\x67\x18\x25\x2F\x2A\x3F\x28\x6E\x2A\x3E\x25\x37\x21\x74\x34\x76\x39\x3D\x2E\x7A\x30\x39\x24\x70",41), Duration = 5})
				end
			else
				_0x68798A5F()
			end
		else
			_0x68798A5F()
		end
	end
	print(_0xD7C0DE("\x4C\x5A\x75\x75\x63\x54\x68\x7C\x42\x00\x6E\x52\x46\x4A\x4C\x48\x40\x08\x42\x4F\x52\x0C\x5E\x57\x5C\x44\x54\x5F\x13\x61\x7C\x18\x19\x16",22))
	_0x2374DEC2(function()
end)
end
_0x2AD3F6A1()
