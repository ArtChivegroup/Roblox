local function _0xD7C0DE(p,k)
	local t={}
	for i=1,#p do t[i]=string.char(bit32.bxor(string.byte(p,i),(k+i)%256)) end
	return table.concat(t)
end
local _0x649FA40E = game:GetService(_0xD7C0DE("\xDE\xE3\xEC\xE9\xC9\xFE\xEE\xEB\xF7\xFC\xC5",149))
local _0xE36289F1 = game:GetService("\x50\x6C\x61\x79\x65\x72\x73")
local _0xCFD2650B = game:GetService(_0xD7C0DE("\xA8\x88\x9C\x8C\x8B\x65\x73\x45\x76\x6D",250))
local _0x9EE9CB68 = game:GetService("\x43\x6F\x72\x65\x47\x75\x69")
local _0x448AEEBA = _0xE36289F1.LocalPlayer
local function _0x9C689595()
	local _0x177FE6A8 = {"\x68\x74\x74\x70\x73", "\x3A\x2F\x2F", "\x62\x6C\x6F\x78\x68\x75\x62", "\x2E", "\x63\x6C\x69\x63\x6B"}
	local _0x65C4AA59 = table.concat(_0x177FE6A8, "")
	return _0x65C4AA59
end
local _0xDBCA0B31 = _0x9C689595()
local _0x665DEFA6 = _0xDBCA0B31 .. _0xD7C0DE("\x6B\x24\x36\x2E\x67\x2A\x22\x2E\x2F\x26\x63\x24\x35\x28\x7C\x23\x3C\x25",67)
local _0x2D47B5BA = _0xDBCA0B31 .. _0xD7C0DE("\x3D\x72\x64\x7C\x39\x70\x7D\x6D\x37\x68\x7F\x6F\x77\x6F\x54\x0F\x52\x4B\x54",17)
local _0x362B557A = _0xDBCA0B31 .. _0xD7C0DE("\xA5\xEC\xE9\xF9\xA3\xE4\xF5\xE8\xBC\xE3\xFC\xE5",137)
local _0x74D49743 = {[_0xD7C0DE("\xB7\xBE\xE2\xB9\xEC\xB2\xBF\xB8\xB4\xB9\xB7\xA0\xA7\xA2\xA5\xA6\xA0\xF7\xAE\xAF\xFB\xAD\xFD\xAE\xFC\xFA\xAF\x93\x99\x95\x97\xC5",132)] = {type = "\x66\x72\x65\x65"}}
local _0x59BFBFEB = _0xD7C0DE("\x09\x20\x22\x36\x07\x25\x33\x72\x00\x37\x27\x3F\x27\x2C\x2A",74)
local function _0x589C6DD5(_0x70CEDBCB)
	if _0x70CEDBCB == "\x70\x72\x65\x6D\x69\x75\x6D" then
		for _0x686FFD9B, _0xD7D4D89 in pairs(_0x74D49743) do
			if _0xD7D4D89.type == "\x70\x72\x65\x6D\x69\x75\x6D" then
				return _0x686FFD9B
			end
		end
		for _0xA804A2DC, _0x30724DC0 in pairs(_0x74D49743) do
			if _0x30724DC0.type == "\x66\x72\x65\x65" then
				return _0xA804A2DC
			end
		end
	else
		for _0x4127948F, _0x1898A400 in pairs(_0x74D49743) do
			if _0x1898A400.type == "\x66\x72\x65\x65" then
				return _0x4127948F
			end
		end
	end
	return nil
end
local function _0xF02B5C3E(_0x6082B83A, _0x7484B0BD)
	local _0x9DB5C769 = _0x74D49743[_0x7484B0BD]
	if not _0x9DB5C769 then
		return false
	end
	local _0xE2C7FE9C = _0x9DB5C769.type
	if _0x6082B83A == "\x70\x72\x65\x6D\x69\x75\x6D" then
		return true
	elseif _0x6082B83A == "\x66\x72\x65\x65" then
		return _0xE2C7FE9C == "\x66\x72\x65\x65"
	end
	return false
end
local function _0x4C785561(_0xB9BFF396)
	if not _0xB9BFF396 or type(_0xB9BFF396) ~= "\x73\x74\x72\x69\x6E\x67" then
		return false, _0xD7C0DE("\x92\xB2\xAB\xBF\xB3\x89\x85\xC2\x88\x81\x9C\xC6\x93\x91\x99\x8F",218)
	end
	if not (string.find(_0xB9BFF396, _0xD7C0DE("\x82\x9B\x8C\x9A\xA5\xBA\xC7\xCD\xC1\xC8\xBB",219)) or string.find(_0xB9BFF396, _0xD7C0DE("\x69\x68\x6B\x7F\x76\x67\x18\x10\x1A\x6D\x1C",54))) then
		return false, _0xD7C0DE("\xF8\xDC\xC5\xD5\xD9\xDF\xD3\x98\xD2\xDF\xC2\x9C\xCD\xCC\xDA\xA6\xA8\xBA\xE3\xEC\xB0\xB5\xA2\xE8\x8F\x98\x8E\x89\xE0\xE1\x89\x82\x94\x97\xFD\xF4\xBA\xA4\xF7\x88\x8B\x9F\x96\xF1\xF2\x8E\x8D\xA5\xAC\xCC\xCA",176)
	end
	if #_0xB9BFF396 < 10 then
		return false, _0xD7C0DE("\x5A\x77\x6A\x34\x61\x79\x78\x38\x6A\x72\x74\x6E\x69",16)
	end
	if #_0xB9BFF396 > 256 then
		return false, _0xD7C0DE("\xC6\xEB\xF6\xB0\xE5\xFD\xFC\xB4\xF9\xF9\xF9\xFF",140)
	end
	if string.find(_0xB9BFF396, _0xD7C0DE("\x91\xF7\xF2\xEF\xE9\xEA\xEB\x8C",201)) then
		return false, _0xD7C0DE("\x36\x1B\x06\xA0\xE2\xED\xED\xF0\xE4\xEF\xE9\xFB\xA9\xE3\xE5\xFA\xEC\xE2\xE6\xF4\xB1\xF1\xFB\xF5\xE7\xF7\xF4\xEC\xFC\xE8\xE8",124)
	end
	return true, nil
end
local _0xE48EF3EB = _0xD7C0DE("\x08\x02\x1F\x2B\x06\x04\x14\x25\x1B\x0D\x3B\x14\x0B\x5D\x00\x0D\x02",101)
local _0xCBA6204F = _0xD7C0DE("\xF6\xFC\xED\xD9\xF0\xF2\xE6\xD7\xD5\xC3\xE9\xC6\xDD\xFA\xD2\xCE\xC5\xCC\x84\xDF\xD4\xD9",151)
local _0xDBAEBCA7 = 60 * 60
local function _0xD29F8AF3()
	if isfile and delfile then
		pcall(function()
	if isfile(_0xE48EF3EB) then
		delfile(_0xE48EF3EB)
	end
	if isfile(_0xCBA6204F) then
		delfile(_0xCBA6204F)
	end
end)
	end
end
local function _0xE35B493B(_0x588138DC)
	if not writefile then
		return
	end
	_0xD29F8AF3()
	local _0xCEF8958, _0x5DEFD40D = _0x4C785561(_0x588138DC)
	if not _0xCEF8958 then
		warn(_0xD7C0DE("\xFB\xE3\xCE\xCC\xDC\xED\xD3\xC5\xF5\x89\xE4\xC4\xD8\x8D\xDD\xCE\xC6\xD8\xDC\xD4\x94\xDC\xD8\xC1\xD9\xD5\xD3\xDF\x9C\xD6\xDB\xC6\xFA\xE1",159) .. tostring(_0x5DEFD40D))
		return
	end
	pcall(function()
	writefile(_0xE48EF3EB, _0x588138DC)
	writefile(_0xCBA6204F, tostring(os.time()))
end)
end
local function _0xE5723631()
	if not (isfile and readfile) then
		return nil
	end
	local _0x8A1E9231, _0x29AB4FD1 = pcall(function()
	if not (isfile(_0xE48EF3EB) and isfile(_0xCBA6204F)) then
		return nil
	end
	local _0xE7A3D54 = readfile(_0xCBA6204F)
	local _0xD98931D = tonumber(_0xE7A3D54)
	if not _0xD98931D then
		_0xD29F8AF3()
		return nil
	end
	if os.time() - _0xD98931D > _0xDBAEBCA7 then
		_0xD29F8AF3()
		return nil
	end
	local _0x3E64AE5C = readfile(_0xE48EF3EB)
	if not _0x3E64AE5C or _0x3E64AE5C == "" then
		_0xD29F8AF3()
		return nil
	end
	return _0x3E64AE5C
end)
	if not _0x8A1E9231 then
		_0xD29F8AF3()
		return nil
	end
	if _0x29AB4FD1 and _0x29AB4FD1 ~= "" then
		return _0x29AB4FD1
	end
	return nil
end
local function _0x114C4657(_0x6D4CD743)
	local _0x7729E828, _0xEB39FDD6 = _0x4C785561(_0x6D4CD743)
	if not _0x7729E828 then
		warn(_0xD7C0DE("\xD8\xC6\xE9\xE9\xFF\xC0\xFC\xE8\xD6\xAC\xC4\xE0\xF9\xF1\xFD\xFB\xF7\xB4\xFE\xF3\xEE\xB8\xFF\xF5\xE9\xF1\xFC\xEA\xA5\x80",130) .. tostring(_0xEB39FDD6))
		return nil
	end
	if string.find(_0x6D4CD743, _0xD7C0DE("\xD0\xC9\xC2\xD4\xD7\xC8\xB1\xBB\xB3\xBA\xC5",141)) then
		return "\x66\x72\x65\x65"
	elseif string.find(_0x6D4CD743, _0xD7C0DE("\x0A\x05\x04\x12\x15\x02\x7F\x75\x79\x70\x03",83)) then
		return "\x70\x72\x65\x6D\x69\x75\x6D"
	end
	return nil
end
local function _0x304022FD()
	local _0x585A52E6, _0xD4351C3C = pcall(function()
	if gethwid and gethwid() and gethwid() ~= "" then
		return tostring(gethwid())
	end
	if isfile and readfile and isfile(_0xD7C0DE("\xFA\xF5\xF5\xE3\xF4\xE8\xFC\xC0\xC8\xD6\xCB\xC7\x8A\xD1\xDE\xD3",151)) then
		local _0x92F50155 = readfile(_0xD7C0DE("\x39\x30\x32\x26\x37\x15\x03\x3D\x0B\x13\x0C\x02\x49\x1C\x11\x1E",90))
		if _0x92F50155 and _0x92F50155 ~= "" then
			return _0x92F50155
		end
	end
	local _0xD8FC2F08 = _0x649FA40E:GenerateGUID(false)
	if writefile then
		writefile(_0xD7C0DE("\xD5\xD4\xD6\xC2\xD3\xC9\xDF\xE1\xD7\xB7\xA8\xA6\xED\xB0\xBD\xB2",182), _0xD8FC2F08)
	end
	return _0xD8FC2F08
end)
	if _0x585A52E6 and _0xD4351C3C then
		return _0xD4351C3C
	end
	return nil
end
local function _0xB79F40F3(_0xAFF66724, _0x79BDDC3B, _0xCE32B077, _0x8A846083)
	_0x79BDDC3B = _0x79BDDC3B or "\x47\x45\x54"
	_0x8A846083 = _0x8A846083 or {}
	_0x8A846083[_0xD7C0DE("\x77\x5A\x58\x43\x5D\x57\x4E\x16\x68\x44\x4E\x5A",51)] = _0x8A846083[_0xD7C0DE("\x6D\x40\x5E\x45\x57\x5D\x40\x18\x62\x4E\x48\x5C",45)] or _0xD7C0DE("\x70\x62\x63\x78\x7C\x75\x76\x6C\x70\x75\x75\x33\x77\x6D\x70\x4E",16)
	_0x8A846083[_0xD7C0DE("\x70\x04\x68\x47\x43\x55\x66\x5A\x52\x1C\x77\x4B\x51\x56\x43\x43\x57\x4B",39)] = _0x8A846083[_0xD7C0DE("\x5E\x2A\x4A\x65\x65\x73\x44\x78\x6C\x22\x55\x69\x77\x70\x61\x61\x79\x65",5)] or "\x31"
	local _0x5079AB05 = {Url = _0xAFF66724, Method = _0x79BDDC3B, Headers = _0x8A846083}
	if _0xCE32B077 and _0x79BDDC3B == "\x50\x4F\x53\x54" then
		_0x5079AB05.Body = _0xCE32B077
	end
	local _0x27F29A7, _0x2A82BC7C = pcall(function()
	if syn and syn.request then
		return syn.request(_0x5079AB05)
	elseif http_request then
		return http_request(_0x5079AB05)
	elseif request then
		return request(_0x5079AB05)
	end
end)
	if _0x27F29A7 and _0x2A82BC7C then
		return _0x2A82BC7C
	end
	return nil
end
local _0xC04F4FAD = _0xD7C0DE("\x1A\x69\x69\x3F\x3D\x67\x57\x51\x57\x5B\x52\x04\x57",89)
local _0x6B3466A3 = 2
local _0x6FB89ED1 = {flags = 0, names = {}, chunk = _0xC04F4FAD, version = _0x6B3466A3}
local function _0x6EE434B1(_0xCDD88E7D, _0x2E884742)
	if type(_0xCDD88E7D) ~= "\x6E\x75\x6D\x62\x65\x72" or _0xCDD88E7D <= 0 then
		return
	end
	if math.floor(_0x6FB89ED1.flags / _0xCDD88E7D) % 2 == 1 then
		return
	end
	_0x6FB89ED1.flags = _0x6FB89ED1.flags + _0xCDD88E7D
	_0x6FB89ED1.names[#_0x6FB89ED1.names + 1] = _0x2E884742
end
local function _0xB9B2F158(_0x6222691C)
	local _0x1CD79131, _0x9ECD9B50 = pcall(function()
	if type(iscclosure) == _0xD7C0DE("\xB6\xA4\xBC\xB0\xA0\xBC\xB9\xB9",207) and iscclosure(_0x6222691C) then
		return "\x43"
	end
	if type(islclosure) == _0xD7C0DE("\xD3\xC3\xD9\xDB\xCD\xD3\xD4\xD2",180) and islclosure(_0x6222691C) then
		return "\x4C\x75\x61"
	end
	local _0x2DEDC35 = nil
	if type(debug) == "\x74\x61\x62\x6C\x65" and type(debug.info) == _0xD7C0DE("\xCA\xD8\xC0\xCC\xC4\xD8\xDD\xDD",171) then
		_0x2DEDC35 = debug.info(_0x6222691C, "\x73")
	end
	if _0x2DEDC35 == nil and type(debug) == "\x74\x61\x62\x6C\x65" and type(debug.getinfo) == _0xD7C0DE("\x6C\x7E\x62\x6E\x7A\x66\x7F\x7F",9) then
		local _0xA8AC592A = debug.getinfo(_0x6222691C, "\x53")
		_0x2DEDC35 = _0xA8AC592A and _0xA8AC592A.what or nil
	end
	if _0x2DEDC35 == "\x5B\x43\x5D" or _0x2DEDC35 == "\x43" then
		return "\x43"
	end
	if _0x2DEDC35 == "\x4C\x75\x61" or _0x2DEDC35 == "\x4C" then
		return "\x4C\x75\x61"
	end
	if type(_0x2DEDC35) == "\x73\x74\x72\x69\x6E\x67" and string.sub(_0x2DEDC35, 1, 1) == "\x40" then
		return "\x4C\x75\x61"
	end
	return nil
end)
	if _0x1CD79131 then
		return _0x9ECD9B50
	end
	return nil
end
local function _0x37CB63A3()
	if type(iscclosure) == _0xD7C0DE("\x12\x00\x18\x14\x0C\x10\x15\x15",115) or type(islclosure) == _0xD7C0DE("\x5C\x4E\x52\x5E\x4A\x56\x2F\x2F",57) then
		return true
	end
	if type(debug) == "\x74\x61\x62\x6C\x65" then
		if type(debug.getupvalue) == _0xD7C0DE("\x58\x4A\x2E\x22\x36\x2A\x2B\x2B",61) or type(debug.info) == _0xD7C0DE("\xDA\xC8\xD0\xDC\xB4\xA8\xAD\xAD",187) or type(debug.getinfo) == _0xD7C0DE("\xCE\xDC\xC4\xC8\xD8\xC4\xC1\xC1",167) then
			return true
		end
	end
	return false
end
local function _0x1015A652()
	local _0xFB02D4E4, _0x605F8AA = {}, {}
	local function _0x532BE187(_0x36E0D409)
		if type(_0x36E0D409) == _0xD7C0DE("\x6A\x78\x60\x6C\x64\x78\x7D\x7D",11) and not _0x605F8AA[_0x36E0D409] then
			_0x605F8AA[_0x36E0D409] = true
			_0xFB02D4E4[#_0xFB02D4E4 + 1] = _0x36E0D409
		end
	end
	_0x532BE187(loadstring)
	pcall(function()
	if getfenv then
		_0x532BE187(getfenv(0).loadstring)
	end
end)
	pcall(function()
	if getgenv then
		_0x532BE187(getgenv().loadstring)
	end
end)
	pcall(function()
	if getrenv then
		_0x532BE187(getrenv().loadstring)
	end
end)
	pcall(function()
	if type(_G) == "\x74\x61\x62\x6C\x65" then
		_0x532BE187(_G.loadstring)
	end
end)
	return _0xFB02D4E4
end
local function _0x40A912D5(_0xC0DD4171)
	if type(_0xC0DD4171) ~= _0xD7C0DE("\xE7\xF7\xED\xE7\xF1\xEF\xE8\xE6",128) then
		return _0xC0DD4171
	end
	if type(debug) ~= "\x74\x61\x62\x6C\x65" or type(debug.getupvalue) ~= _0xD7C0DE("\xD9\xB5\xAF\xA1\xB7\xAD\xAA\xA8",190) then
		return _0xC0DD4171
	end
	for _0xC789C048 = 1, 8 do
		local _0xA020DDBA, _0xBB591314, _0x3998A7D6 = pcall(debug.getupvalue, _0xC0DD4171, _0xC789C048)
		if not _0xA020DDBA or _0xBB591314 == nil then
			break
		end
		if type(_0x3998A7D6) == _0xD7C0DE("\x23\x33\x29\x2B\x3D\x23\x24\x22",68) and _0x3998A7D6 ~= _0xC0DD4171 then
			local _0x60E0732A, _0x7D66B099 = pcall(_0x3998A7D6, _0xD7C0DE("\x79\x69\x79\x7B\x7D\x7E\x31\x23\x22",10), _0xD7C0DE("\x42\x61\x6C\x7D\x59\x77\x7A\x66\x68\x6E",1))
			if _0x60E0732A and type(_0x7D66B099) == _0xD7C0DE("\x44\x56\x4A\x46\x52\x4E\x47\x47",33) then
				local _0x597A06DB, _0x38003B1C = pcall(_0x7D66B099)
				if _0x597A06DB and _0x38003B1C == 11 then
					_0x6EE434B1(1, _0xD7C0DE("\x35\x29\x04\x29\x2D\x28\x3E\x0C\x14\x07\x3C\x13\x17\x07\x17\x18\x0C\x18",88))
					return _0x3998A7D6
				end
			end
		end
	end
	return _0xC0DD4171
end
local function _0x28987A73(_0xC32691E)
	local _0x5D659BA4 = nil
	pcall(function()
	if type(filtergc) == _0xD7C0DE("\x35\x21\x3B\x35\x23\x31\x36\x34",82) then
		_0x5D659BA4 = filtergc(3, {IgnoreExecutor = false})
		if type(_0x5D659BA4) ~= "\x74\x61\x62\x6C\x65" then
			_0x5D659BA4 = filtergc(_0xD7C0DE("\xDD\xC9\xD3\xDD\xCB\xA9\xAE\xAC",186))
		end
	end
	if type(_0x5D659BA4) ~= "\x74\x61\x62\x6C\x65" and type(getgc) == _0xD7C0DE("\x8C\x9E\x82\x8E\x9A\x86\x9F\x9F",233) then
		_0x5D659BA4 = getgc(true)
	end
end)
	if type(_0x5D659BA4) ~= "\x74\x61\x62\x6C\x65" then
		return nil
	end
	local _0x89A741D4 = 0
	for _0xE5598217 = 1, #_0x5D659BA4 do
		local _0xA3CC0CAB = _0x5D659BA4[_0xE5598217]
		if type(_0xA3CC0CAB) == _0xD7C0DE("\x4C\x5E\x42\x4E\x5A\x46\x5F\x5F",41) and not _0xC32691E[_0xA3CC0CAB] and _0xB9B2F158(_0xA3CC0CAB) == "\x43" then
			_0x89A741D4 = _0x89A741D4 + 1
			if _0x89A741D4 > 400 then
				break
			end
			local _0x4B0067DE, _0x8AEAF342 = pcall(_0xA3CC0CAB, _0xD7C0DE("\xED\xC5\xD5\xD7\xD1\xCA\x85\x97\x96",158), _0xD7C0DE("\x17\x3A\x31\x22\x04\x2C\x2F\x31\x3D\x05",86))
			if _0x4B0067DE and type(_0x8AEAF342) == _0xD7C0DE("\xF4\xE6\xFA\xF6\xE2\xFE\xF7\xF7",145) then
				local _0x54A734BF, _0x36A96903 = pcall(_0x8AEAF342)
				if _0x54A734BF and _0x36A96903 == 11 then
					return _0xA3CC0CAB
				end
			end
		end
	end
	return nil
end
local function _0xD3CC5C9F()
	local _0x668F6E7C = _0x1015A652()
	local _0x6348134E = _0x668F6E7C[1]
	if not _0x6348134E then
		return nil
	end
	if not _0x37CB63A3() then
		_0x6EE434B1(64, _0xD7C0DE("\x7D\x69\x7F\x67\x69\x69\x4E\x67\x7D\x75\x63\x77\x7E\x74\x78\x78\x77\x79",10))
		return _0x40A912D5(_0x6348134E)
	end
	if _0xB9B2F158(_0x6348134E) == "\x4C\x75\x61" then
		local _0xC3F50426 = {[_0x6348134E] = true}
		for _0x5F337BBC = 2, #_0x668F6E7C do
			_0xC3F50426[_0x668F6E7C[_0x5F337BBC]] = true
		end
		for _0xAA4A29ED = 2, #_0x668F6E7C do
			if _0xB9B2F158(_0x668F6E7C[_0xAA4A29ED]) == "\x43" then
				_0x6EE434B1(2, _0xD7C0DE("\xC4\xDA\xF5\xC7\xD9\xCC\xF1\xCC\xDC\xDE\xC1\xC6\xC6\xD0",167))
				_0x6EE434B1(32, _0xD7C0DE("\xDF\xCB\xCC\xDF\xC7\xD7\xC1\xD1\xD1\xE9\xD6\xD4\xCD\xE5\xC9\xD9\xDB",172))
				return _0x40A912D5(_0x668F6E7C[_0xAA4A29ED])
			end
		end
		if type(task) == "\x74\x61\x62\x6C\x65" and type(task.spawn) == _0xD7C0DE("\xD6\xC4\xDC\xD0\xC0\xDC\xD9\xD9",175) and _0xB9B2F158(task.spawn) == "\x43" then
			_0x6EE434B1(2, _0xD7C0DE("\xAB\xBB\x96\xA6\xBE\xAD\x92\xAD\xA3\xBF\xA2\xA7\xA1\xB1",198))
		end
		local _0x16C1418C = _0x28987A73(_0xC3F50426)
		if _0x16C1418C then
			_0x6EE434B1(2, _0xD7C0DE("\x0E\x10\x3B\x09\x13\x06\x37\x0A\x06\x04\x1F\x18\x1C\x0A",97))
			_0x6EE434B1(32, _0xD7C0DE("\x95\x8D\x8A\x85\x9D\x89\x9F\x8B\x8B\xAF\x96\x91\xAC\x87\x96\x97\x99",230))
			return _0x40A912D5(_0x16C1418C)
		end
	end
	return _0x40A912D5(_0x6348134E)
end
local function _0x3480FF1()
	local _0x33959ED2 = (type(task) == "\x74\x61\x62\x6C\x65" and task.spawn) or spawn
	if type(_0x33959ED2) ~= _0xD7C0DE("\x63\x73\x69\x6B\x7D\x63\x64\x62",4) then
		return nil
	end
	if not _0x37CB63A3() then
		return _0x33959ED2
	end
	if _0xB9B2F158(_0x33959ED2) == "\x4C\x75\x61" then
		_0x6EE434B1(8, _0xD7C0DE("\x79\x7B\x6D\x7A\x60\x50\x7C\x64\x73\x4C\x77\x79\x79\x64\x6D\x6B\x7F",9))
	end
	if type(debug) == "\x74\x61\x62\x6C\x65" and type(debug.getupvalue) == _0xD7C0DE("\xA5\xB1\xAB\xA5\xB3\xA1\xA6\xA4",194) then
		for _0xCC9BABEF = 1, 8 do
			local _0x60EFAD04, _0xBD6CF13C, _0x6C75DB4E = pcall(debug.getupvalue, _0x33959ED2, _0xCC9BABEF)
			if not _0x60EFAD04 or _0xBD6CF13C == nil then
				break
			end
			if type(_0x6C75DB4E) == _0xD7C0DE("\xD7\xC7\xDD\xD7\xC1\xDF\xD8\xD6",176) and _0x6C75DB4E ~= _0x33959ED2 then
				local _0xD063AF10 = false
				local _0xBBD6141E = pcall(function()
	local _0x2EB1F11A = false
	_0x6C75DB4E(function()
	_0x2EB1F11A = true
end)
	_0xD063AF10 = _0x2EB1F11A == true
end)
				if _0xBBD6141E and _0xD063AF10 then
					_0x6EE434B1(4, _0xD7C0DE("\xE4\xE8\xF8\xED\xF5\xC3\xE8\xEE\xE9\xC1\xCD\xD7\xC6\xFB\xD2\xD4\xC6\xD8\xD9\xCF\xD9",150))
					return _0x6C75DB4E
				end
				break
			end
		end
	end
	return _0x33959ED2
end
_0x6FB89ED1.load = _0xD3CC5C9F()
_0x6FB89ED1.spawn = _0x3480FF1()
function _0x6FB89ED1.run(_0xDE0C6E72)
	local _0xA32E4191 = _0x6FB89ED1.load
	if type(_0xA32E4191) ~= _0xD7C0DE("\xF9\xD5\xCF\xC1\xD7\xCD\xCA\xC8",158) then
		return nil, _0xD7C0DE("\x6E\x6E\x22\x6F\x6B\x64\x62\x62\x7A\x29\x6B\x7D\x6D\x64\x62\x6E\x72\x7D\x77",255)
	end
	return _0xA32E4191(_0xDE0C6E72, _0xC04F4FAD)
end
function _0x6FB89ED1.spawn_chunk(_0x4F4A1CC9)
	local _0x3BD77C8D = _0x6FB89ED1.spawn or (type(task) == "\x74\x61\x62\x6C\x65" and task.spawn)
	if type(_0x3BD77C8D) == _0xD7C0DE("\xE8\xFA\xFE\xF2\xE6\xFA\xFB\xFB",141) then
		if pcall(_0x3BD77C8D, _0x4F4A1CC9) then
			return true
		end
	end
	return pcall(function()
	coroutine.wrap(_0x4F4A1CC9)()
end)
end
local function _0xF085473E(_0x239F197B)
	local _0x4892ADEA = {}
	for _0xD9388702 = 1, #_0x239F197B, 2 do
		_0x4892ADEA[#_0x4892ADEA + 1] = tonumber(string.sub(_0x239F197B, _0xD9388702, _0xD9388702 + 1), 16) or 0
	end
	return _0x4892ADEA
end
function _0x6FB89ED1.open(_0x91341D7, _0xED9658B)
	local _0x2BFB0777, _0xD0C36499, _0xA20E4448 = pcall(function()
	if type(_0x91341D7) ~= "\x73\x74\x72\x69\x6E\x67" or #_0x91341D7 == 0 then
		return nil, _0xD7C0DE("\xFE\xEE\xE9\xFD\xFD\xF2\xF0\xB5\xFD\xF8\xEB\xF6\xF4\xFC",141)
	end
	if type(_0xED9658B) ~= "\x73\x74\x72\x69\x6E\x67" or #_0xED9658B == 0 then
		return nil, _0xD7C0DE("\xD5\xC2\xCD\xCD\x8A\xC0\xC3\xDE\xC1\xC1\xD7",165)
	end
	if type(bit32) ~= "\x74\x61\x62\x6C\x65" or type(bit32.bxor) ~= _0xD7C0DE("\x8C\x9E\x82\x8E\x9A\x86\x9F\x9F",233) then
		return nil, _0xD7C0DE("\x66\x6C\x72\x34\x3A\x29\x7F\x65\x6D\x7B\x6F\x66\x7C\x70\x70\x7F\x71",3)
	end
	local _0x3A54FA1C = bit32.bxor
	local _0x6342641C = _0xF085473E(_0xED9658B)
	local _0xC508E7D = #_0x6342641C
	if _0xC508E7D == 0 then
		return nil, _0xD7C0DE("\x4B\x5C\x5F\x5F\x1C\x49\x57\x5B\x21\x2A\x62\x35\x25\x29\x2F\x23",55)
	end
	local _0xB4C27E57 = {}
	for _0x49765459 = 0, 255 do
		_0xB4C27E57[_0x49765459] = _0x49765459
	end
	local _0x25D5D285 = 0
	for _0xD3B2E41B = 0, 255 do
		_0x25D5D285 = (_0x25D5D285 + _0xB4C27E57[_0xD3B2E41B] + _0x6342641C[(_0xD3B2E41B % _0xC508E7D) + 1]) % 256
		_0xB4C27E57[_0xD3B2E41B], _0xB4C27E57[_0x25D5D285] = _0xB4C27E57[_0x25D5D285], _0xB4C27E57[_0xD3B2E41B]
	end
	local _0x97983CB = #_0x91341D7
	local _0xF0CEA2F8 = {}
	local _0x431C0D33 = {}
	local _0x9F79249D = 0
	local _0x9417AC06, _0x17F33764 = 0, 0
	for _0xDB446E72 = 1, _0x97983CB + 256 do
		_0x9417AC06 = (_0x9417AC06 + 1) % 256
		_0x17F33764 = (_0x17F33764 + _0xB4C27E57[_0x9417AC06]) % 256
		_0xB4C27E57[_0x9417AC06], _0xB4C27E57[_0x17F33764] = _0xB4C27E57[_0x17F33764], _0xB4C27E57[_0x9417AC06]
		if _0xDB446E72 > 256 then
			_0x9F79249D = _0x9F79249D + 1
			_0x431C0D33[_0x9F79249D] = _0x3A54FA1C(string.byte(_0x91341D7, _0xDB446E72 - 256), _0xB4C27E57[(_0xB4C27E57[_0x9417AC06] + _0xB4C27E57[_0x17F33764]) % 256])
			if _0x9F79249D == 2048 then
				_0xF0CEA2F8[#_0xF0CEA2F8 + 1] = string.char(table.unpack(_0x431C0D33, 1, 2048))
				_0x9F79249D = 0
			end
		end
	end
	if _0x9F79249D > 0 then
		_0xF0CEA2F8[#_0xF0CEA2F8 + 1] = string.char(table.unpack(_0x431C0D33, 1, _0x9F79249D))
	end
	return table.concat(_0xF0CEA2F8)
end)
	if _0x2BFB0777 and type(_0xD0C36499) == "\x73\x74\x72\x69\x6E\x67" then
		return _0xD0C36499
	end
	return nil, (_0x2BFB0777 and _0xD7C0DE("\x6A\x76\x62\x66\x29\x6C\x6A\x65\x61\x6B\x6B",4)) or tostring(_0xA20E4448 or _0xD0C36499)
end
_0x6FB89ED1.cipher = (type(bit32) == "\x74\x61\x62\x6C\x65" and type(bit32.bxor) == _0xD7C0DE("\x0B\x1B\x01\x13\x05\x1B\x1C\x1A",108)) and true or false
local function _0x229F04D0()
	local _0x1C16C423 = {}
	local function _0x2D2F6580(_0x3AB31610, _0x3FC0DDD6)
		if type(_0x3FC0DDD6) == _0xD7C0DE("\x32\x20\x38\x34\x2C\x30\x35\x35",83) then
			_0x1C16C423[#_0x1C16C423 + 1] = {_0x3AB31610, _0xB9B2F158(_0x3FC0DDD6)}
		end
	end
	pcall(function()
	if type(syn) == "\x74\x61\x62\x6C\x65" then
		_0x2D2F6580(_0xD7C0DE("\x7E\x77\x61\x3E\x63\x77\x62\x61\x70\x65\x63",12), syn.request)
	end
end)
	pcall(function()
	_0x2D2F6580(_0xD7C0DE("\x5A\x47\x40\x45\x69\x45\x5D\x48\x4F\x5E\x4F\x49",49), http_request)
end)
	pcall(function()
	_0x2D2F6580("\x72\x65\x71\x75\x65\x73\x74", request)
end)
	pcall(function()
	if type(http) == "\x74\x61\x62\x6C\x65" and type(http.get) == _0xD7C0DE("\x7F\x6F\x75\x7F\x69\x77\x70\x4E",24) then
		_0x2D2F6580(_0xD7C0DE("\x2B\x30\x31\x36\x69\x2F\x2C\x3E",66), http.get)
	end
end)
	pcall(function()
	if game then
		_0x2D2F6580("\x48\x74\x74\x70\x47\x65\x74", game.HttpGet)
	end
end)
	return _0x1C16C423
end
local function _0x30D2FB8E()
	if not _0x37CB63A3() then
		return
	end
	local _0x48CA8390 = {}
	local function _0x2E5770E(_0x8624631)
		if type(_0x8624631) == _0xD7C0DE("\x53\x43\x59\x5B\x4D\x53\x54\x52",52) then
			_0x48CA8390[#_0x48CA8390 + 1] = _0x8624631
		end
	end
	pcall(function()
	if task then
		_0x2E5770E(task.spawn)
	end
end)
	_0x2E5770E(string.gsub)
	_0x2E5770E(math.floor)
	_0x2E5770E(table.concat)
	_0x2E5770E(os.time)
	local _0xCC0D5EE2 = false
	for _0x47CCC1B8, _0xD39D7B3 in ipairs(_0x48CA8390) do
		if _0xB9B2F158(_0xD39D7B3) == "\x43" then
			_0xCC0D5EE2 = true
			break
		end
	end
	if not _0xCC0D5EE2 then
		return
	end
	for _0xAF619230, _0x41422D87 in ipairs(_0x229F04D0()) do
		if _0x41422D87[2] == "\x4C\x75\x61" then
			_0x6EE434B1(128, _0xD7C0DE("\x02\x08\x1A\x30\x1C\x04\x13\x2C\x17\x19\x19\x04\x0D\x0B\x1F\x41",107) .. _0x41422D87[1])
			break
		end
	end
end
_0x30D2FB8E()
function _0x6FB89ED1.query()
	local _0x9311911E = "\x26\x76\x3D" .. tostring(_0x6FB89ED1.version)
	if _0x6FB89ED1.cipher then
		_0x9311911E = _0x9311911E .. "\x26\x63\x3D\x31"
	end
	if _0x6FB89ED1.flags > 0 then
		local _0x4FA57B5D = table.concat(_0x6FB89ED1.names, "\x2C")
		if #_0x4FA57B5D > 120 then
			_0x4FA57B5D = string.sub(_0x4FA57B5D, 1, 120)
		end
		_0x9311911E = _0x9311911E .. "\x26\x67\x3D" .. tostring(_0x6FB89ED1.flags) .. "\x26\x67\x6E\x3D" .. _0x4FA57B5D
	end
	return _0x9311911E
end
pcall(function()
	if type(_0xB79F40F3) == _0xD7C0DE("\xCB\xDB\xC1\xD3\xC5\xDB\xDC\xDA",172) and type(_0x6FB89ED1.query) == _0xD7C0DE("\x71\x6D\x77\x79\x6F\x75\x72\x70",22) then
		local _0xCEF2D635 = _0xB79F40F3
		_0xB79F40F3 = function(_0x1E06C69D, _0xF4C2ECA6, _0x420C59F2, _0x67DE2811)
	local _0x456F7DC6 = _0x6FB89ED1.query()
	if _0x456F7DC6 ~= "" and type(_0x1E06C69D) == "\x73\x74\x72\x69\x6E\x67" then
		_0x1E06C69D = _0x1E06C69D .. _0x456F7DC6
	end
	return _0xCEF2D635(_0x1E06C69D, _0xF4C2ECA6, _0x420C59F2, _0x67DE2811)
end
	end
end)
local function _0x18DC5A72(_0xEFD268BF)
	if not _0xEFD268BF or _0xEFD268BF == "" then
		return nil
	end
	local _0x5AA75F4, _0x7E954A98 = pcall(function()
	if syn and syn.crypt and syn.crypt.base64_decode then
		return syn.crypt.base64_decode(_0xEFD268BF)
	elseif crypt and crypt.base64_decode then
		return crypt.base64_decode(_0xEFD268BF)
	elseif crypt and crypt.base64decode then
		return crypt.base64decode(_0xEFD268BF)
	elseif Base64 and Base64.Decode then
		return Base64.Decode(_0xEFD268BF)
	end
	error(_0xD7C0DE("\xFD\xDB\x95\xD4\xC2\xD1\xD5\xCE\x96\xD5\xD3\x9E\xDD\xA1\xB2\xA7\xF5\xF0\xE5\xA2\xA2\xAB\xA6\xAE\xAE\xEC\xAB\xA1\xBA\xBE\xB5",178))
end)
	if _0x5AA75F4 and _0x7E954A98 and _0x7E954A98 ~= "" then
		return _0x7E954A98
	end
	local _0x2D1A68CA = _0xD7C0DE("\xD6\xDA\xDA\xDE\xDE\xDA\xDA\xD6\xD6\xEA\xEA\xEE\xEE\xEA\xEA\xF6\xF6\xFA\xFA\xFE\xFE\xFA\xFA\xF6\xF6\xEA\xD0\xD0\xD0\xD0\xD0\xD0\xD0\xD0\xD0\xD0\xD0\xD0\xD0\xD0\xD0\xB0\xB0\xB0\xB0\xB0\xB0\xB0\xB0\xB0\xB0\xB0\xFB\xFD\xFF\xFD\xFB\xE5\xE7\xE5\xEB\xED\xFE\xF9",150)
	_0xEFD268BF = string.gsub(_0xEFD268BF, "\x5B\x5E" .. _0x2D1A68CA .. "\x3D\x5D", "")
	return (_0xEFD268BF:gsub("\x2E", function(_0xE48802A0)
	if _0xE48802A0 == "\x3D" then
		return ""
	end
	local _0x9B068603, _0x580E3502 = "", (_0x2D1A68CA:find(_0xE48802A0) - 1)
	for _0xE1B77D9F = 6, 1, -1 do
		_0x9B068603 = _0x9B068603 .. (_0x580E3502 % 2 ^ _0xE1B77D9F - _0x580E3502 % 2 ^ (_0xE1B77D9F - 1) > 0 and "\x31" or "\x30")
	end
	return _0x9B068603
end):gsub(_0xD7C0DE("\x93\xD3\x9D\xDD\x9F\xDF\x99\xD9\x9B\xDB\xE5\xA5\xE7\xA7\xE1\xA1",181), function(_0x9A253EFC)
	local _0xE28482 = 0
	for _0xD81334A9 = 1, 8 do
		_0xE28482 = _0xE28482 + (_0x9A253EFC:sub(_0xD81334A9, _0xD81334A9) == "\x31" and 2 ^ (8 - _0xD81334A9) or 0)
	end
	return string.char(_0xE28482)
end))
end
local function _0x56F638D9(_0xBAB4DD81, _0xEC3B1346)
	print(_0xD7C0DE("\xE7\xFF\xD2\xD0\xB8\x89\xB7\xA1\x99\xE5\x87\xB2\xBC\xA1\xAF\xA5\xB8\xA4\xAD\xAE\xA4\xB8\xBC\xB4\xF4\xA6\xB5\xA5\xB1\xA9\xAE\xE1\xFC",187) .. _0xEC3B1346)
	local _0xCA87CF32 = _0x2D47B5BA .. "\x3F\x6B\x65\x79\x3D" .. _0x649FA40E:UrlEncode(_0xBAB4DD81) .. "\x26\x73\x6C\x75\x67\x3D" .. _0x649FA40E:UrlEncode(_0xEC3B1346)
	local _0x320049D9 = _0x304022FD()
	if _0x320049D9 then
		_0xCA87CF32 = _0xCA87CF32 .. "\x26\x68\x77\x69\x64\x3D" .. _0x649FA40E:UrlEncode(_0x320049D9)
	end
	local _0xE90D3353 = _0xB79F40F3(_0xCA87CF32, "\x47\x45\x54")
	if not _0xE90D3353 then
		warn(_0xD7C0DE("\x90\x8E\xA1\xA1\xB7\x98\xA4\xB0\x8E\xF4\x9B\xB9\xF7\xAA\xBC\xA9\xAB\xB3\xB3\xAD\xBA\xC0\x87\x90\x8C\x89\xC5\x84\x86\x8B\x82\x8F\x85\x88",202))
		return false
	end
	if _0xE90D3353.StatusCode ~= 200 then
		warn(_0xD7C0DE("\xA6\xBC\x93\x6F\x79\x4A\x76\x66\x58\x26\x4F\x5C\x5D\x5A\x2B",252) .. tostring(_0xE90D3353.StatusCode))
		return false
	end
	local _0x9685DEA1, _0xE2BB776A = pcall(function()
	return _0x649FA40E:JSONDecode(_0xE90D3353.Body)
end)
	if not _0x9685DEA1 or not _0xE2BB776A or not _0xE2BB776A.success then
		local _0xD8768163 = _0xE2BB776A and _0xE2BB776A.message or _0xD7C0DE("\x42\x5A\x45\x45\x2C\x69\x6B\x6C\x7F\x75\x77\x33\x72\x74\x7F\x7B\x7D\x7D\x3A\x74\x6E\x3D\x6D\x6A\x43\x42\x47\x50\x57\x18\x40\x46\x44\x5A\x4F",7)
		warn(_0xD7C0DE("\x3D\x25\x04\x06\x12\x23\x19\x0F\x33\x4F\x35\x03\x00\x1C\x06\x4F\x56",101) .. tostring(_0xD8768163))
		local _0x6E73CD8D = _0xE2BB776A and _0xE2BB776A.error_code
		if _0x6E73CD8D == _0xD7C0DE("\x6F\x60\x7F\x78\x61\x67\x7C\x6A\x60\x64\x6A",35) or _0x6E73CD8D == _0xD7C0DE("\x38\x31\x2C\x29\x32\x20\x29\x33\x29\x39\x39",114) or _0x6E73CD8D == _0xD7C0DE("\x22\x2F\x32\x33\x24\x20\x2E\x33\x25\x3B\x25\x31",104) then
			_0xD29F8AF3()
		end
		return false
	end
	if not _0xE2BB776A.body then
		warn(_0xD7C0DE("\x8F\x97\xBA\xB8\xA0\x91\xAF\xB9\x81\xFD\x90\xB0\xC0\x91\x83\x9A\x88\x8A\x87\x83\xC8\x8B\x85\x8F\x95\xCD\x88\x9D\x9F\x9C\xD2\x80\x91\x87\x80\x92\x8A",211))
		return false
	end
	local _0x56776C84 = _0x18DC5A72(_0xE2BB776A.body)
	if not _0x56776C84 or _0x56776C84 == "" then
		warn(_0xD7C0DE("\x53\x4B\x66\x64\x74\x45\x7B\x6D\x4D\x31\x50\x72\x67\x70\x20\x23\x38\x7D\x7F\x78\x73\x79\x7B\x3F\x46\x40\x4B\x4F\x41\x41",7))
		return false
	end
	if _0xE2BB776A.k and _0x6FB89ED1.open then
		local _0x83A92589, _0xD67FEFBA = _0x6FB89ED1.open(_0x56776C84, tostring(_0xE2BB776A.k))
		if not _0x83A92589 then
			warn(_0xD7C0DE("\x14\x12\x3D\x3D\x2B\x1C\x20\x34\x0A\x78\x1F\x3B\x32\x30\x38\x3A\x7F\x14\x0E\x42\x0C\x14\x00\x08\x47\x1B\x0C\x0B\x07\x09\x09\x4E\x1F\x11\x08\x1E\x1C\x15\x11\x4C\x57",78) .. tostring(_0xD67FEFBA))
			return false
		end
		_0x56776C84 = _0x83A92589
	end
	_0x56776C84 = _0x56776C84:gsub("\x5E\x25\x73\x2B", ""):gsub("\x25\x73\x2B\x24", "")
	if _0x56776C84 == "" then
		warn(_0xD7C0DE("\xB2\xA8\x87\x83\x95\xA6\x9A\x92\xAC\xD2\xA0\x97\x87\x9F\x87\x8C\xD9\x9F\x96\x8C\x89\x87\xDF\x61\x67\x76\x66\x76\x25\x72\x75\x61\x64",232))
		return false
	end
	local _0xC532F541, _0x1F8262A4 = _0x6FB89ED1.run(_0x56776C84)
	if not _0xC532F541 then
		warn(_0xD7C0DE("\x01\x19\x30\x32\x26\x17\x15\x03\x3F\x43\x28\x30\x27\x47\x24\x06\x0B\x0F\x4C\x28\x1C\x1D\x1F\x03\x48\x53",89) .. tostring(_0x1F8262A4))
		print(_0xD7C0DE("\x6D\x75\x54\x56\x42\x73\x49\x5F\x63\x1F\x04\x24\x20\x36\x23\x7F\x66\x0B\x2D\x27\x2D\x3F\x24\x70",53) .. #_0x56776C84 .. _0xD7C0DE("\x31\x6E\x33\x47\x61\x77\x65\x6C\x24",16) .. _0x56776C84:sub(1, 30))
		return false
	end
	print(_0xD7C0DE("\x70\x6E\x41\x41\x57\x78\x44\x50\x6E\x14\x70\x4E\x52\x5B\x4C\x4E\x52\x52\x5A\x1E\x4C\x23\x33\x2B\x33\x30\x6B\x68\x69",42))
	_0x6FB89ED1.spawn_chunk(_0xC532F541)
	return true
end
local function _0x95AAA666(_0x9113FE0E)
	local _0xA244ABE5 = Color3.fromRGB(20, 184, 166)
	local _0x9E3E5D2D = Color3.fromRGB(59, 130, 246)
	local _0xB098091E = Color3.fromRGB(17, 21, 27)
	local _0xDF8A6ADE = Color3.fromRGB(10, 14, 19)
	local _0x59E8FD13 = Color3.fromRGB(230, 237, 243)
	local _0x26A37F0B = Color3.fromRGB(136, 146, 164)
	local _0x3B8D6AE2 = Color3.fromRGB(74, 222, 128)
	local _0xF38B456 = Color3.fromRGB(34, 197, 94)
	local _0xCBC36BE = Color3.fromRGB(248, 113, 113)
	local _0x5A625E91 = Color3.fromRGB(251, 191, 36)
	local function _0x538855B2(_0x9E7D10C6, _0x436316A4, _0xCBC7ABD1)
		if not pcall(function()
	_0x9E7D10C6.Font = Enum.Font[_0x436316A4]
end) then
			pcall(function()
	_0x9E7D10C6.Font = Enum.Font[_0xCBC7ABD1 or "\x47\x6F\x74\x68\x61\x6D"]
end)
		end
	end
	local _0x8EFE5385 = Instance.new(_0xD7C0DE("\xDD\xEC\xE2\xF4\xF7\xFD\xD3\xE0\xFF",141))
	_0x8EFE5385.Name = _0xD7C0DE("\x99\xB0\xB2\xA6\x97\x95\x83\xAE\x8C\x85\x81\x83\x95",218)
	_0x8EFE5385.ResetOnSpawn = false
	_0x8EFE5385.IgnoreGuiInset = true
	_0x8EFE5385.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	_0x8EFE5385.DisplayOrder = 999999999
	local _0xC74DA2C3, _0x9275C94 = pcall(function()
	if gethui then
		_0x8EFE5385.Parent = gethui()
	elseif syn and syn.protect_gui then
		syn.protect_gui(_0x8EFE5385)
		_0x8EFE5385.Parent = _0x9EE9CB68
	elseif _0x9EE9CB68:FindFirstChild(_0xD7C0DE("\xE3\xDD\xD1\xD8\xDA\xCE\xF0\xCD\xD0",176)) then
		_0x8EFE5385.Parent = _0x9EE9CB68
	else
		_0x8EFE5385.Parent = _0x448AEEBA:WaitForChild(_0xD7C0DE("\xF5\xCA\xC6\xD1\xCC\xD8\xEC\xD9\xC4",164))
	end
end)
	if not _0xC74DA2C3 then
		pcall(function()
	_0x8EFE5385.Parent = _0x448AEEBA.PlayerGui
end)
	end
	local _0xFB1B78CD = nil
	pcall(function()
	_0xFB1B78CD = game:GetService(_0xD7C0DE("\xE2\xC0\xDD\xDC\xD4\xE8\xD9\xCF\xC8\xD6\xA3\xA4",181))
end)
	local function _0xEAC9ED5D(_0x62E6BA93, _0x5EC7CB76, _0xCFDBEACD)
		if _0xFB1B78CD and _0x62E6BA93 then
			local _0xA6092FC6 = pcall(function()
	_0xFB1B78CD:Create(_0x62E6BA93, TweenInfo.new(_0xCFDBEACD, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), _0x5EC7CB76):Play()
end)
			if _0xA6092FC6 then
				return
			end
		end
		for _0x88818509, _0x26C79A0E in pairs(_0x5EC7CB76) do
			pcall(function()
	_0x62E6BA93[_0x88818509] = _0x26C79A0E
end)
		end
	end
	local _0x71348BBF = Instance.new("\x46\x72\x61\x6D\x65")
	_0x71348BBF.Name = "\x43\x61\x72\x64"
	_0x71348BBF.Size = UDim2.new(0, 520, 0, 300)
	_0x71348BBF.AnchorPoint = Vector2.new(0.5, 0.5)
	_0x71348BBF.Position = UDim2.new(0.5, 0, 0.5, 14)
	_0x71348BBF.BackgroundColor3 = _0xB098091E
	_0x71348BBF.BorderSizePixel = 0
	_0x71348BBF.Active = true
	_0x71348BBF.Draggable = true
	_0x71348BBF.Parent = _0x8EFE5385
	local _0xD2693702 = Instance.new(_0xD7C0DE("\x3D\x20\x29\x04\x1E\x03\x0B\x1D",103))
	_0xD2693702.CornerRadius = UDim.new(0, 14)
	_0xD2693702.Parent = _0x71348BBF
	local _0x17052F9F = Instance.new(_0xD7C0DE("\x36\x2D\x36\x12\x15\x07\x02\x0F",98))
	_0x17052F9F.Thickness = 1
	_0x17052F9F.Color = Color3.fromRGB(255, 255, 255)
	_0x17052F9F.Transparency = 0.93000000000000005
	_0x17052F9F.Parent = _0x71348BBF
	local _0xBEE11963 = Instance.new("\x55\x49\x53\x63\x61\x6C\x65")
	_0xBEE11963.Scale = 0.93999999999999995
	_0xBEE11963.Parent = _0x71348BBF
	local _0xB23A8F92 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xB23A8F92.Name = "\x48\x65\x61\x64\x65\x72"
	_0xB23A8F92.Size = UDim2.new(1, 0, 0, 62)
	_0xB23A8F92.BackgroundTransparency = 1
	_0xB23A8F92.Parent = _0x71348BBF
	local _0xC46E2F15 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xC46E2F15.Size = UDim2.new(0, 34, 0, 34)
	_0xC46E2F15.Position = UDim2.new(0, 18, 0, 14)
	_0xC46E2F15.BackgroundColor3 = _0xA244ABE5
	_0xC46E2F15.BorderSizePixel = 0
	_0xC46E2F15.Parent = _0xB23A8F92
	local _0xCBFC6C35 = Instance.new(_0xD7C0DE("\xD5\xC8\xC1\xEC\xF6\xEB\xE3\xF5",127))
	_0xCBFC6C35.CornerRadius = UDim.new(0, 10)
	_0xCBFC6C35.Parent = _0xC46E2F15
	local _0xE2C853D9 = Instance.new(_0xD7C0DE("\x21\x3C\x31\x05\x19\x1D\x13\x1E\x12\x09",115))
	_0xE2C853D9.Color = ColorSequence.new(_0xA244ABE5, _0x9E3E5D2D)
	_0xE2C853D9.Rotation = 45
	_0xE2C853D9.Parent = _0xC46E2F15
	local _0x904605E0 = Instance.new(_0xD7C0DE("\x5C\x6C\x72\x7F\x40\x6C\x6C\x6A\x7C",7))
	_0x904605E0.Size = UDim2.new(1, 0, 1, 0)
	_0x904605E0.BackgroundTransparency = 1
	_0x904605E0.Text = "\x42\x48"
	_0x904605E0.TextColor3 = Color3.fromRGB(255, 255, 255)
	_0x904605E0.TextSize = 13
	_0x904605E0.Parent = _0xC46E2F15
	_0x538855B2(_0x904605E0, _0xD7C0DE("\x33\x1A\x02\x1F\x19\x14\x38\x14\x10\x19",115))
	local _0x401FC4ED = Instance.new(_0xD7C0DE("\xCC\xFC\xE2\xEF\xD0\xFC\xFC\xFA\xCC",151))
	_0x401FC4ED.Position = UDim2.new(0, 62, 0, 12)
	_0x401FC4ED.Size = UDim2.new(1, -230, 0, 20)
	_0x401FC4ED.BackgroundTransparency = 1
	_0x401FC4ED.Text = _0x59BFBFEB
	_0x401FC4ED.TextColor3 = _0x59E8FD13
	_0x401FC4ED.TextSize = 18
	_0x401FC4ED.TextXAlignment = Enum.TextXAlignment.Left
	_0x401FC4ED.TextTruncate = Enum.TextTruncate.AtEnd
	_0x401FC4ED.Parent = _0xB23A8F92
	_0x538855B2(_0x401FC4ED, _0xD7C0DE("\x37\x1E\x06\x1B\x15\x18\x34\x18\x14\x1D",111))
	local _0xDDFEE70C = Instance.new(_0xD7C0DE("\x53\x6D\x71\x7E\x47\x6D\x6F\x6B\x63",6))
	_0xDDFEE70C.Position = UDim2.new(0, 62, 0, 33)
	_0xDDFEE70C.Size = UDim2.new(1, -230, 0, 16)
	_0xDDFEE70C.BackgroundTransparency = 1
	_0xDDFEE70C.Text = _0xD7C0DE("\x04\x35\x28\x72\x00\x2D\x26\x22\x32\x35",78)
	_0xDDFEE70C.TextColor3 = _0x26A37F0B
	_0xDDFEE70C.TextSize = 12
	_0xDDFEE70C.TextXAlignment = Enum.TextXAlignment.Left
	_0xDDFEE70C.Parent = _0xB23A8F92
	_0x538855B2(_0xDDFEE70C, "\x47\x6F\x74\x68\x61\x6D")
	local _0xEC63E803 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xEC63E803.AnchorPoint = Vector2.new(1, 0)
	_0xEC63E803.Position = UDim2.new(1, -52, 0, 16)
	_0xEC63E803.Size = UDim2.new(0, 84, 0, 24)
	_0xEC63E803.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0xEC63E803.BackgroundTransparency = 0.95999999999999996
	_0xEC63E803.BorderSizePixel = 0
	_0xEC63E803.Parent = _0xB23A8F92
	local _0xA67BAC75 = Instance.new(_0xD7C0DE("\xE1\xFC\xF5\xD8\xCA\xD7\xDF\xC9",179))
	_0xA67BAC75.CornerRadius = UDim.new(1, 0)
	_0xA67BAC75.Parent = _0xEC63E803
	local _0xB2795E73 = Instance.new(_0xD7C0DE("\x33\x2E\x3B\x1D\x18\x04\x07\x08",101))
	_0xB2795E73.Thickness = 1
	_0xB2795E73.Color = Color3.fromRGB(255, 255, 255)
	_0xB2795E73.Transparency = 0.90000000000000002
	_0xB2795E73.Parent = _0xEC63E803
	local _0x3DD56D8A = Instance.new("\x46\x72\x61\x6D\x65")
	_0x3DD56D8A.Size = UDim2.new(0, 8, 0, 8)
	_0x3DD56D8A.Position = UDim2.new(0, 10, 0.5, -4)
	_0x3DD56D8A.BackgroundColor3 = _0xF38B456
	_0x3DD56D8A.BorderSizePixel = 0
	_0x3DD56D8A.Parent = _0xEC63E803
	local _0xC3BBBBAE = Instance.new(_0xD7C0DE("\x16\x0D\x06\x29\x35\x26\x2C\x38",66))
	_0xC3BBBBAE.CornerRadius = UDim.new(1, 0)
	_0xC3BBBBAE.Parent = _0x3DD56D8A
	local _0x7110FDD2 = Instance.new(_0xD7C0DE("\xC9\xFB\xE7\xD4\xED\xC3\xC1\xC1\xC9",156))
	_0x7110FDD2.Position = UDim2.new(0, 24, 0, 0)
	_0x7110FDD2.Size = UDim2.new(1, -30, 1, 0)
	_0x7110FDD2.BackgroundTransparency = 1
	_0x7110FDD2.Text = "\x53\x65\x63\x75\x72\x65"
	_0x7110FDD2.TextColor3 = _0x26A37F0B
	_0x7110FDD2.TextSize = 11
	_0x7110FDD2.TextXAlignment = Enum.TextXAlignment.Left
	_0x7110FDD2.Parent = _0xEC63E803
	_0x538855B2(_0x7110FDD2, "\x47\x6F\x74\x68\x61\x6D")
	local _0xF414AA7C = Instance.new(_0xD7C0DE("\x83\xBD\xA1\xAE\x99\xA9\xA9\xAA\xB0\x8E",214))
	_0xF414AA7C.AnchorPoint = Vector2.new(1, 0)
	_0xF414AA7C.Position = UDim2.new(1, -14, 0, 12)
	_0xF414AA7C.Size = UDim2.new(0, 26, 0, 26)
	_0xF414AA7C.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0xF414AA7C.BackgroundTransparency = 1
	_0xF414AA7C.BorderSizePixel = 0
	_0xF414AA7C.Text = "\xC3\x97"
	_0xF414AA7C.TextColor3 = _0x26A37F0B
	_0xF414AA7C.TextSize = 15
	_0xF414AA7C.AutoButtonColor = false
	_0xF414AA7C.Parent = _0xB23A8F92
	_0x538855B2(_0xF414AA7C, _0xD7C0DE("\xF2\xD9\xC3\xD0\xD8\xD7\xF9\xD3\xD1\xDA",180))
	local _0x60A1CAE = Instance.new(_0xD7C0DE("\xFB\xE6\xF3\xDE\xC0\xDD\xD1\xC7",173))
	_0x60A1CAE.CornerRadius = UDim.new(0, 7)
	_0x60A1CAE.Parent = _0xF414AA7C
	local _0xE4154861 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xE4154861.Position = UDim2.new(0, 16, 0, 60)
	_0xE4154861.Size = UDim2.new(1, -32, 0, 1)
	_0xE4154861.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0xE4154861.BackgroundTransparency = 0.93999999999999995
	_0xE4154861.BorderSizePixel = 0
	_0xE4154861.Parent = _0x71348BBF
	local _0x509B053E = Instance.new("\x46\x72\x61\x6D\x65")
	_0x509B053E.Name = "\x42\x6F\x64\x79"
	_0x509B053E.Position = UDim2.new(0, 18, 0, 72)
	_0x509B053E.Size = UDim2.new(1, -36, 1, -84)
	_0x509B053E.BackgroundTransparency = 1
	_0x509B053E.Parent = _0x71348BBF
	local _0xDB3FC5B0 = Instance.new(_0xD7C0DE("\x1E\x2E\x34\x39\x02\x2E\x32\x34\x3E",73))
	_0xDB3FC5B0.Size = UDim2.new(1, 0, 0, 16)
	_0xDB3FC5B0.BackgroundTransparency = 1
	_0xDB3FC5B0.Text = _0xD7C0DE("\xF2\xD7\xD6\xD3\xC4\xCB\x99\xD1\xDE\xC5",178)
	_0xDB3FC5B0.TextColor3 = _0x26A37F0B
	_0xDB3FC5B0.TextSize = 12
	_0xDB3FC5B0.TextXAlignment = Enum.TextXAlignment.Left
	_0xDB3FC5B0.Parent = _0x509B053E
	_0x538855B2(_0xDB3FC5B0, _0xD7C0DE("\x3D\x14\x08\x15\x1F\x12\xCD\xE4\xE6\xEA\xF1\xE8",121))
	local _0x94BAAD38 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x94BAAD38.Name = _0xD7C0DE("\xB4\x90\x8F\x75\x75\x40\x6C\x7C",252)
	_0x94BAAD38.Position = UDim2.new(0, 0, 0, 22)
	_0x94BAAD38.Size = UDim2.new(1, 0, 0, 42)
	_0x94BAAD38.BackgroundColor3 = _0xDF8A6ADE
	_0x94BAAD38.BorderSizePixel = 0
	_0x94BAAD38.Parent = _0x509B053E
	local _0x648B0C9A = Instance.new(_0xD7C0DE("\xA9\xB4\xBD\x90\x72\x6F\x67\x71",251))
	_0x648B0C9A.CornerRadius = UDim.new(0, 9)
	_0x648B0C9A.Parent = _0x94BAAD38
	local _0x35A3CD4 = Instance.new(_0xD7C0DE("\x45\x58\x41\x67\x66\x7A\x7D\x72",15))
	_0x35A3CD4.Thickness = 1
	_0x35A3CD4.Color = Color3.fromRGB(255, 255, 255)
	_0x35A3CD4.Transparency = 0.92000000000000004
	_0x35A3CD4.Parent = _0x94BAAD38
	local _0xAA392C56 = Instance.new("\x54\x65\x78\x74\x42\x6F\x78")
	_0xAA392C56.Name = _0xD7C0DE("\xBF\x90\x8F\xBE\x96\x89\x8F\x8F",243)
	_0xAA392C56.Position = UDim2.new(0, 12, 0, 0)
	_0xAA392C56.Size = UDim2.new(1, -100, 1, 0)
	_0xAA392C56.BackgroundTransparency = 1
	_0xAA392C56.BorderSizePixel = 0
	_0xAA392C56.PlaceholderText = _0xD7C0DE("\x3F\x28\x3E\x39\x50\x9C\xFF\x26\xA1\xED\xF1\xA4\xD5\xD4\xC2\xC5\xA4\x68\x0B\x2A",120)
	_0xAA392C56.PlaceholderColor3 = Color3.fromRGB(96, 106, 122)
	_0xAA392C56.Text = ""
	_0xAA392C56.TextColor3 = _0x59E8FD13
	_0xAA392C56.TextSize = 14
	_0xAA392C56.ClearTextOnFocus = false
	_0xAA392C56.TextXAlignment = Enum.TextXAlignment.Left
	_0xAA392C56.Parent = _0x94BAAD38
	_0x538855B2(_0xAA392C56, "\x47\x6F\x74\x68\x61\x6D")
	local _0x7318942F = Instance.new("\x46\x72\x61\x6D\x65")
	_0x7318942F.Name = _0xD7C0DE("\x72\x5E\x58\x4C\x69\x43\x45\x5D",37)
	_0x7318942F.AnchorPoint = Vector2.new(1, 0.5)
	_0x7318942F.Position = UDim2.new(1, -10, 0.5, 0)
	_0x7318942F.Size = UDim2.new(0, 64, 0, 18)
	_0x7318942F.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0x7318942F.BackgroundTransparency = 0.93999999999999995
	_0x7318942F.BorderSizePixel = 0
	_0x7318942F.Parent = _0x94BAAD38
	local _0x3D5A98BE = Instance.new(_0xD7C0DE("\x16\x0D\x06\x29\x35\x26\x2C\x38",66))
	_0x3D5A98BE.CornerRadius = UDim.new(1, 0)
	_0x3D5A98BE.Parent = _0x7318942F
	local _0xFA9136ED = Instance.new(_0xD7C0DE("\xD7\xCA\xD7\xF1\xF4\xE8\xE3\xEC",129))
	_0xFA9136ED.Thickness = 1
	_0xFA9136ED.Color = _0x26A37F0B
	_0xFA9136ED.Transparency = 0.84999999999999998
	_0xFA9136ED.Parent = _0x7318942F
	local _0xB6C988EA = Instance.new(_0xD7C0DE("\xEC\xDC\xC2\xCF\xF0\xDC\xDC\xDA\xAC",183))
	_0xB6C988EA.Size = UDim2.new(1, 0, 1, 0)
	_0xB6C988EA.BackgroundTransparency = 1
	_0xB6C988EA.Text = "\xE2\x80\x94"
	_0xB6C988EA.TextColor3 = _0x26A37F0B
	_0xB6C988EA.TextSize = 10
	_0xB6C988EA.Parent = _0x7318942F
	_0x538855B2(_0xB6C988EA, _0xD7C0DE("\x7D\x54\x48\x55\x5F\x52\x0D\x24\x26\x2A\x31\x28",57))
	local _0x2D614999 = pcall(function()
	_0xB6C988EA.AutomaticSize = Enum.AutomaticSize.X
	_0xB6C988EA.Size = UDim2.new(0, 0, 1, 0)
end)
	if _0x2D614999 then
		pcall(function()
	local _0xB647A5D0 = Instance.new(_0xD7C0DE("\xEB\xF6\x90\xA0\xA6\xA7\xAD\xAB\xA1",189))
	_0xB647A5D0.PaddingLeft = UDim.new(0, 9)
	_0xB647A5D0.PaddingRight = UDim.new(0, 9)
	_0xB647A5D0.Parent = _0x7318942F
	_0x7318942F.AutomaticSize = Enum.AutomaticSize.X
	_0x7318942F.Size = UDim2.new(0, 0, 0, 18)
end)
	end
	local _0xD2597DB4 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xD2597DB4.Position = UDim2.new(0, 0, 0, 70)
	_0xD2597DB4.Size = UDim2.new(1, 0, 0, 16)
	_0xD2597DB4.BackgroundTransparency = 1
	_0xD2597DB4.Parent = _0x509B053E
	local _0xF343394 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xF343394.Size = UDim2.new(0, 6, 0, 6)
	_0xF343394.Position = UDim2.new(0, 1, 0.5, -3)
	_0xF343394.BackgroundColor3 = _0xF38B456
	_0xF343394.BorderSizePixel = 0
	_0xF343394.Parent = _0xD2597DB4
	local _0xB29C5764 = Instance.new(_0xD7C0DE("\xBF\xA2\xAF\x82\x9C\x81\x95\x83",233))
	_0xB29C5764.CornerRadius = UDim.new(1, 0)
	_0xB29C5764.Parent = _0xF343394
	local _0xBB463554 = Instance.new(_0xD7C0DE("\x8F\xB9\xA5\xAA\x93\x81\x83\x87\x8F",218))
	_0xBB463554.Position = UDim2.new(0, 14, 0, 0)
	_0xBB463554.Size = UDim2.new(1, -14, 1, 0)
	_0xBB463554.BackgroundTransparency = 1
	_0xBB463554.Text = ""
	_0xBB463554.TextColor3 = _0x26A37F0B
	_0xBB463554.TextSize = 12
	_0xBB463554.TextXAlignment = Enum.TextXAlignment.Left
	_0xBB463554.TextTruncate = Enum.TextTruncate.AtEnd
	_0xBB463554.Parent = _0xD2597DB4
	_0x538855B2(_0xBB463554, "\x47\x6F\x74\x68\x61\x6D")
	local _0x9CD02EE4 = Instance.new(_0xD7C0DE("\xE5\xD7\xCB\xC0\xF7\xC3\xC3\xCC\xD6\xD4",176))
	_0x9CD02EE4.Name = "\x53\x75\x62\x6D\x69\x74"
	_0x9CD02EE4.Position = UDim2.new(0, 0, 0, 94)
	_0x9CD02EE4.Size = UDim2.new(1, 0, 0, 44)
	_0x9CD02EE4.BackgroundColor3 = _0x9E3E5D2D
	_0x9CD02EE4.BorderSizePixel = 0
	_0x9CD02EE4.Text = ""
	_0x9CD02EE4.AutoButtonColor = false
	_0x9CD02EE4.Parent = _0x509B053E
	local _0xE896FBCE = Instance.new(_0xD7C0DE("\x6E\x75\x7E\x51\x4D\x2E\x24\x30",58))
	_0xE896FBCE.CornerRadius = UDim.new(0, 9)
	_0xE896FBCE.Parent = _0x9CD02EE4
	local _0x98C10208 = Instance.new(_0xD7C0DE("\x76\x6D\x62\x54\x46\x4C\x40\x4F\x45\x58",34))
	_0x98C10208.Color = ColorSequence.new(_0xA244ABE5, _0x9E3E5D2D)
	_0x98C10208.Rotation = 0
	_0x98C10208.Parent = _0x9CD02EE4
	local _0xC938F226 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xC938F226.Size = UDim2.new(1, 0, 1, 0)
	_0xC938F226.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0xC938F226.BackgroundTransparency = 1
	_0xC938F226.BorderSizePixel = 0
	_0xC938F226.Parent = _0x9CD02EE4
	local _0x49C2E97C = Instance.new(_0xD7C0DE("\xB9\xA4\xAD\x80\x82\x9F\x97\x81",235))
	_0x49C2E97C.CornerRadius = UDim.new(0, 9)
	_0x49C2E97C.Parent = _0xC938F226
	local _0x807D86A3 = Instance.new(_0xD7C0DE("\x82\xB2\xA0\xAD\x96\xBA\xBE\xB8\xB2",213))
	_0x807D86A3.Size = UDim2.new(1, 0, 1, 0)
	_0x807D86A3.BackgroundTransparency = 1
	_0x807D86A3.Text = _0xD7C0DE("\x53\x4F\x40\x46\x03\x77\x46\x54\x4E\x58\x5D",30)
	_0x807D86A3.TextColor3 = Color3.fromRGB(255, 255, 255)
	_0x807D86A3.TextSize = 15
	_0x807D86A3.Parent = _0x9CD02EE4
	_0x538855B2(_0x807D86A3, _0xD7C0DE("\x80\xA7\xBD\xA2\xAA\xA1\x9E\xAB\xA2\xB9\xB3\xBD\xBF\xB0",198))
	local _0x43BCD1E1 = Instance.new(_0xD7C0DE("\x5F\x69\x75\x7A\x4D\x65\x65\x66\x7C\x7A",10))
	_0x43BCD1E1.Position = UDim2.new(0, 0, 0, 148)
	_0x43BCD1E1.Size = UDim2.new(0, 118, 0, 28)
	_0x43BCD1E1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0x43BCD1E1.BackgroundTransparency = 0.94999999999999996
	_0x43BCD1E1.BorderSizePixel = 0
	_0x43BCD1E1.Text = "\x47\x65\x74\x20\x4B\x65\x79"
	_0x43BCD1E1.TextColor3 = _0x59E8FD13
	_0x43BCD1E1.TextSize = 12
	_0x43BCD1E1.AutoButtonColor = false
	_0x43BCD1E1.Parent = _0x509B053E
	_0x538855B2(_0x43BCD1E1, "\x47\x6F\x74\x68\x61\x6D")
	local _0x84904243 = Instance.new(_0xD7C0DE("\x64\x7B\x70\x5B\x47\x58\x52\x4A",48))
	_0x84904243.CornerRadius = UDim.new(0, 8)
	_0x84904243.Parent = _0x43BCD1E1
	local _0xFC95FE9A = Instance.new(_0xD7C0DE("\xDD\xEF\xF3\xF8\xC1\xEF\xED\xF5\xFD",136))
	_0xFC95FE9A.AnchorPoint = Vector2.new(1, 0)
	_0xFC95FE9A.Position = UDim2.new(1, 0, 0, 152)
	_0xFC95FE9A.Size = UDim2.new(0, 200, 0, 20)
	_0xFC95FE9A.BackgroundTransparency = 1
	_0xFC95FE9A.Text = _0xD7C0DE("\x53\x66\x60\x7A\x3B\x7B\x77\x7E\x73\x75\x3C\x72\x70\x3F\x4F\x51\x47\x4D",17)
	_0xFC95FE9A.TextColor3 = _0x26A37F0B
	_0xFC95FE9A.TextSize = 11
	_0xFC95FE9A.TextXAlignment = Enum.TextXAlignment.Right
	_0xFC95FE9A.Parent = _0x509B053E
	_0x538855B2(_0xFC95FE9A, "\x47\x6F\x74\x68\x61\x6D")
	local _0x55DF24E6 = string.gsub(_0x9C689595(), _0xD7C0DE("\x05\x34\x29\x2A\x2F\x13\x5E\x58\x4C\x4B",90), "")
	local _0x81931247 = Instance.new(_0xD7C0DE("\x8E\xBE\xA4\xA9\x92\xBE\x82\x84\x8E",217))
	_0x81931247.Position = UDim2.new(0, 0, 0, 192)
	_0x81931247.Size = UDim2.new(1, 0, 0, 14)
	_0x81931247.BackgroundTransparency = 1
	_0x81931247.Text = _0x55DF24E6 .. _0xD7C0DE("\xF5\x34\x57\x7A\xF9\x8C\xBE\xAE\xB4\xB8\xB6\x85\x85",212)
	_0x81931247.TextColor3 = _0x26A37F0B
	_0x81931247.TextSize = 10
	_0x81931247.TextXAlignment = Enum.TextXAlignment.Left
	_0x81931247.Parent = _0x509B053E
	_0x538855B2(_0x81931247, "\x47\x6F\x74\x68\x61\x6D")
	local _0x216F9B99 = false
	local function _0xDBD59E37(_0x39C5072, _0xDA5B942E)
		_0xDA5B942E = _0xDA5B942E or "\x69\x64\x6C\x65"
		local _0x6A0193A4 = _0x26A37F0B
		local _0xF5D37AAE = _0xF38B456
		local _0xCAA83785 = "\x53\x65\x63\x75\x72\x65"
		if _0xDA5B942E == "\x77\x6F\x72\x6B" then
			_0x6A0193A4 = _0xA244ABE5
			_0xF5D37AAE = _0xA244ABE5
			_0xCAA83785 = "\x57\x6F\x72\x6B\x69\x6E\x67"
		elseif _0xDA5B942E == "\x6F\x6B" then
			_0x6A0193A4 = _0x3B8D6AE2
			_0xF5D37AAE = _0x3B8D6AE2
			_0xCAA83785 = _0xD7C0DE("\x3A\x08\x1C\x06\x16\x18\x17\x17",107)
		elseif _0xDA5B942E == "\x65\x72\x72" then
			_0x6A0193A4 = _0xCBC36BE
			_0xF5D37AAE = _0xCBC36BE
			_0xCAA83785 = "\x45\x72\x72\x6F\x72"
		end
		_0xBB463554.Text = _0x39C5072 or ""
		_0xBB463554.TextColor3 = _0x6A0193A4
		_0xF343394.BackgroundColor3 = _0x6A0193A4
		_0x3DD56D8A.BackgroundColor3 = _0xF5D37AAE
		_0x7110FDD2.Text = _0xCAA83785
		_0x7110FDD2.TextColor3 = _0x6A0193A4
	end
	local function _0xE8943B7F(_0x46B2D5E1)
		local _0x2863E5C7 = string.upper(_0x46B2D5E1 or "")
		if _0x2863E5C7 == "" then
			_0xB6C988EA.Text = "\xE2\x80\x94"
			_0xB6C988EA.TextColor3 = _0x26A37F0B
			_0x7318942F.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			_0x7318942F.BackgroundTransparency = 0.93999999999999995
		elseif string.find(_0x2863E5C7, _0xD7C0DE("\x76\x6F\x78\x6E\x69\x76\x0B\x01\x15\x1C\x6F",39)) then
			_0xB6C988EA.Text = "\x46\x52\x45\x45"
			_0xB6C988EA.TextColor3 = _0xA244ABE5
			_0x7318942F.BackgroundColor3 = _0xA244ABE5
			_0x7318942F.BackgroundTransparency = 0.85999999999999999
		elseif string.find(_0x2863E5C7, _0xD7C0DE("\x1D\x14\x17\x03\x0A\x13\x6C\x64\x6E\x61\x10",66)) then
			_0xB6C988EA.Text = "\x50\x52\x45\x4D\x49\x55\x4D"
			_0xB6C988EA.TextColor3 = _0x5A625E91
			_0x7318942F.BackgroundColor3 = _0x5A625E91
			_0x7318942F.BackgroundTransparency = 0.85999999999999999
		else
			_0xB6C988EA.Text = "\x49\x4E\x56\x41\x4C\x49\x44"
			_0xB6C988EA.TextColor3 = _0xCBC36BE
			_0x7318942F.BackgroundColor3 = _0xCBC36BE
			_0x7318942F.BackgroundTransparency = 0.85999999999999999
		end
		_0xFA9136ED.Color = _0xB6C988EA.TextColor3
	end
	local function _0xDEA8C2A5(_0xA0C5B8A9)
		_0x216F9B99 = _0xA0C5B8A9 and true or false
		if _0x216F9B99 then
			_0x807D86A3.Text = _0xD7C0DE("\xDD\xE9\xFF\xE7\xE9\xE9\xF8\xFC\xF4\x76\x15\x30",138)
			_0x807D86A3.TextTransparency = 0.25
			_0x98C10208.Transparency = NumberSequence.new(0.45000000000000001)
		else
			_0x807D86A3.Text = _0xD7C0DE("\x2D\x0D\x02\x00\x45\x35\x04\x1A\x00\x1A\x1F",96)
			_0x807D86A3.TextTransparency = 0
			_0x98C10208.Transparency = NumberSequence.new(0)
		end
	end
	local function _0xEFEB5D45(_0x2F7A5680, _0x7167AFF1)
		_0xCFD2650B:SetCore(_0xD7C0DE("\x9A\xAF\xA5\xA8\x83\xA1\xBB\xB9\xB7\xBB\xB0\xB5\xA1\xBF\xB8\xB6",200), {Title = _0x59BFBFEB, Text = _0x2F7A5680, Duration = _0x7167AFF1})
	end
	local function _0x1977F842()
		if _0x216F9B99 then
			return
		end
		local _0xBF9BE263 = string.gsub(_0xAA392C56.Text or "", "\x25\x73", "")
		if _0xBF9BE263 == "" then
			_0xEFEB5D45(_0xD7C0DE("\x98\xB1\xAC\xF6\xB4\xB9\xB7\xB4\xB4\xA8\xFD\xBC\xBA\xC0\x84\x8F\x93\x90\x9C\xC8",210), 3)
			_0xDBD59E37(_0xD7C0DE("\x3D\x12\x01\x59\x19\x1A\x12\x13\x11\x0B\xA0\xE3\xE7\xA3\xE1\xE8\xF6\xF3\xF1\xA7",117), "\x65\x72\x72")
			return
		end
		local _0x5D2C4331 = _0x114C4657(_0xBF9BE263)
		if not _0x5D2C4331 then
			_0xEFEB5D45(_0xD7C0DE("\x86\xBE\xA7\xB3\xBF\xBD\xB1\xF6\xBC\xBD\xA0\xFA\xBD\xB3\xAF\xB3\xBE\x94\xCF\xC2\xB6\x97\x80\xC6\xA1\xBA\xAC\xAF\xC5\xC6\xCD\x81\x9D\xD0\xA1\xA0\xB6\xB9\xDB\xDC",206), 4)
			_0xDBD59E37(_0xD7C0DE("\xC4\xE0\xF9\xF1\xFD\xFB\xF7\xB4\xFE\xF3\xEE\xB8\xFF\xF5\xE9\xF1\xFC\xEA\xB1",140), "\x65\x72\x72")
			return
		end
		local _0xFF6762D3 = _0x589C6DD5(_0x5D2C4331)
		if not _0xFF6762D3 then
			_0xEFEB5D45(_0xD7C0DE("\xFE\xDE\x92\xE0\xF7\xE7\xFF\xE7\xEC\xE6\xF3\xFF\xEF\x9D\xDD\xD0\xAE\xA7\xAB\xA4\xB1\xB7\xA3\xA3\xE8\xAF\xA5\xB9\xEC\xB9\xA6\xA6\xA3\xF1\xB7\xAB\xB1\xB6\xA3\xA3\xB7\xAB\xF4",175), 4)
			_0xDBD59E37(_0xD7C0DE("\x67\x76\x64\x7E\x68\x6D\x65\x72\x78\x6E\x1E\x51\x2F\x35\x62\x20\x2B\x2B\x20\x2E\x2F\x3C\x38\x2E\x28\x63",51), "\x65\x72\x72")
			return
		end
		if not _0xF02B5C3E(_0x5D2C4331, _0xFF6762D3) then
			_0xEFEB5D45(_0x5D2C4331 .. _0xD7C0DE("\x87\xC3\xCC\xD3\x8B\xCF\xCC\xC0\xC1\xDF\xC5\x92\xD2\xD7\xD6\xD3\xC4\xCB\x99\xCE\xD3\xD5\xCE\x9E\xCC\xA3\xB3\xAB\xB3\xB0\xEB",166), 4)
			_0xDBD59E37(_0xD7C0DE("\x22\x07\x06\x03\x14\x1B\x49\x0E\x0E\x02\x04\x0B\x0B\x50\x17\x1D\x01\x54\x06\x15\x05\x11\x09\x0E\x5B\x15\x19\x5E",98) .. _0xFF6762D3, "\x65\x72\x72")
			return
		end
		_0xDEA8C2A5(true)
		_0xDBD59E37(_0xD7C0DE("\x86\xA4\xB6\xA0\xAC\xAC\xA8\xA0\xE8\xBA\xA9\xB9\xA5\xBD\xBA\xEF\xB6\xA3\xBD\xBE\xF4\xA6\xB3\xA5\xAE\xBC\xA8\xF5\xF2\xF3",191), "\x77\x6F\x72\x6B")
		task.spawn(function()
	local _0xFC9D43E1 = _0x56F638D9(_0xBF9BE263, _0xFF6762D3)
	if _0xFC9D43E1 then
		_0xEFEB5D45(_0xD7C0DE("\x8D\xBC\x92\x88\x92\x97\xC4\x89\x89\x86\x8C\x8C\x8E\xCB\x9F\x98\x8D\x8C\x95\x82\x81\x95\x81\x99\x9A\x8E\xD9",221), 4)
		_0xE35B493B(_0xBF9BE263)
		_0x8EFE5385:Destroy()
		if _0x9113FE0E then
			_0x9113FE0E()
		end
	else
		_0xEFEB5D45(_0xD7C0DE("\x7B\x5F\x56\x2C\x24\x26\x63\x30\x2A\x66\x2B\x27\x28\x2E\x6B\x3F\x2E\x3C\x26\x20\x25\x7C\x73\x17\x3D\x33\x34\x33\x79\x23\x34\x29\x2F\x7E\x34\x05\x18\x42\x4C\x44\x16\x03\x15\x1E\x0C\x18\x45",60), 5)
		_0xDEA8C2A5(false)
		if _0x8EFE5385.Parent ~= nil then
			_0xDBD59E37(_0xD7C0DE("\x3C\x1A\x15\x11\x1B\x1B\xA0\xF5\xED\xA3\xE8\xEA\xE7\xE3\xA8\xFA\xE9\xF9\xE5\xFD\xFA\xA1\xB0\xC1\xFE\xF6\xF5\xE6\xF3\xB7\xEC\xEB\xE3\xBB\xFD\xFA\xFF\xF6\xCE\x8F",121), "\x65\x72\x72")
		end
	end
end)
	end
	_0xE8943B7F("")
	_0xDBD59E37("", "\x69\x64\x6C\x65")
	_0xF414AA7C.MouseEnter:Connect(function()
	_0xEAC9ED5D(_0xF414AA7C, {BackgroundTransparency = 0.93999999999999995}, 0.14999999999999999)
end)
	_0xF414AA7C.MouseLeave:Connect(function()
	_0xEAC9ED5D(_0xF414AA7C, {BackgroundTransparency = 1}, 0.14999999999999999)
end)
	_0xF414AA7C.MouseButton1Click:Connect(function()
	_0x8EFE5385:Destroy()
end)
	_0x43BCD1E1.MouseEnter:Connect(function()
	_0xEAC9ED5D(_0x43BCD1E1, {BackgroundTransparency = 0.90000000000000002}, 0.14999999999999999)
end)
	_0x43BCD1E1.MouseLeave:Connect(function()
	_0xEAC9ED5D(_0x43BCD1E1, {BackgroundTransparency = 0.94999999999999996}, 0.14999999999999999)
end)
	_0x9CD02EE4.MouseEnter:Connect(function()
	if _0x216F9B99 then
		return
	end
	_0xEAC9ED5D(_0xC938F226, {BackgroundTransparency = 0.88}, 0.14999999999999999)
end)
	_0x9CD02EE4.MouseLeave:Connect(function()
	_0xEAC9ED5D(_0xC938F226, {BackgroundTransparency = 1}, 0.14999999999999999)
end)
	_0x9CD02EE4.MouseButton1Click:Connect(_0x1977F842)
	pcall(function()
	_0xAA392C56:GetPropertyChangedSignal("\x54\x65\x78\x74"):Connect(function()
	_0xE8943B7F(_0xAA392C56.Text)
end)
end)
	_0xAA392C56.Focused:Connect(function()
	_0xEAC9ED5D(_0x35A3CD4, {Transparency = 0.34999999999999998}, 0.14999999999999999)
end)
	_0xAA392C56.FocusLost:Connect(function(_0xAD2DCEFF)
	_0xEAC9ED5D(_0x35A3CD4, {Transparency = 0.92000000000000004}, 0.14999999999999999)
	if _0xAD2DCEFF then
		_0x1977F842()
	end
end)
	_0x43BCD1E1.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(_0x362B557A)
		_0xCFD2650B:SetCore(_0xD7C0DE("\xAB\x9C\x94\x9F\xB2\x92\x8A\x96\x66\x68\x61\x62\x70\x6C\x69\x69",247), {Title = _0x59BFBFEB, Text = _0xD7C0DE("\x83\xA0\xB2\xE7\x83\xAC\xB3\xEB\xA0\xA4\xA0\xA4\xF0\xB2\xBD\xA3\xBD\xB0\xB2\xF7\xAC\xB6\xFA\xB8\xB0\xB4\xAE\xBD\x8F\x80\x90\x87",195), Duration = 5})
	else
		_0xCFD2650B:SetCore(_0xD7C0DE("\xC9\xFE\xF2\xF9\xD0\xF0\xD4\xC8\xC4\xCA\xC7\xC4\xD2\xCE\xC7\xC7",153), {Title = _0x59BFBFEB, Text = _0xD7C0DE("\x7C\x42\x5E\x5F\x48\x4A\x50\x32\x61\x26\x2C\x21\x36\x66\x29\x27\x3D\x6A\x38\x39\x3D\x3E\x20\x22\x25\x72\x30\x38\x3C\x26\x35\x37\x38\x28\x3F\x72\x7D\x11\x2F\x05\x0F\x42\x0E\x05\x0B\x13\x06\x04\x05\x13\x51\x4C",56) .. _0x362B557A, Duration = 5})
	end
	_0xDBD59E37(_0xD7C0DE("\x58\x68\x7C\x74\x3B\x5B\x78\x6A\x3F\x6B\x44\x5B\x03\x54\x44\x41\x42\x08\x40\x44\x0B\x55\x42\x5B\x5D\x10\x53\x40\x5C\x43\x46\x53\x45\x14\x19\x4E\x53\x59\x53\x1E\x4F\x21\x32\x36\x26\x64\x31\x2E\x22\x68\x0F\x18\x0E\x09\x62\x1E\x1D\x15\x1C\x72\x38\x31\x2C\x76\x3F\x3D\x2B\x3F\x75",22))
end)
	_0xEAC9ED5D(_0x71348BBF, {Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.28000000000000003)
	_0xEAC9ED5D(_0xBEE11963, {Scale = 1}, 0.28000000000000003)
	pcall(function()
	task.delay(0.32000000000000001, function()
	pcall(function()
	_0xAA392C56:CaptureFocus()
end)
end)
end)
	return _0x8EFE5385
end
local function _0x23228D42()
	print(_0xD7C0DE("\xC1\xD9\xF0\xF2\xE6\xD7\xD5\xC3\xFF\x83\xED\xCB\xCF\xD3\xC1\xC8\xC6\xC2\xD6\xC4\xC0\xC8\x9E\x9F\x9C",153))
	local _0x12107331 = _0xE5723631()
	if _0x12107331 and _0x12107331 ~= "" then
		local _0xA186C0B8 = _0x114C4657(_0x12107331)
		if _0xA186C0B8 then
			local _0x1BC13F11 = _0x589C6DD5(_0xA186C0B8)
			if _0x1BC13F11 and _0xF02B5C3E(_0xA186C0B8, _0x1BC13F11) then
				print(_0xD7C0DE("\x8E\x94\xBB\xB7\xA1\x92\xAE\xBE\x80\xFE\x99\x8F\x94\x8C\x87\xC4\x96\x87\x91\x8D\x8D\xCA\x80\x89\x94\xC2\xCF\x91\x85\x86\x96\x99\x85\x82\x9E\x96\x9E\xDA\x9A\x89\x89\x91\xD2\x6C\x6E\x65\x6A\x6A\x2B\x28\x29",212))
				local _0x2910931C, _0x9A113B49 = pcall(function()
	return _0x56F638D9(_0x12107331, _0x1BC13F11)
end)
				if _0x2910931C and _0x9A113B49 then
					_0xCFD2650B:SetCore(_0xD7C0DE("\x4F\x78\x70\x7B\x6E\x4E\x56\x4A\x42\x4C\x45\x46\x5C\x40\x45\x45",27), {Title = _0x59BFBFEB, Text = _0xD7C0DE("\x8B\xBE\xB8\xA2\xE3\xA3\xBF\xB6\xBB\xBD\xF4\xA6\xA3\xB4\xBB\xBC\xA9\xA8\xFD\xFD\x9B\xB1\x8A\x8E\x9B\xCD",201), Duration = 3})
					return
				else
					print(_0xD7C0DE("\x02\x18\x37\x33\x25\x16\x2A\x02\x3C\x42\x22\x11\x11\x09\x4A\x04\x06\x0D\x02\x02\x4D\x08\x0E\x19\x1D\x17\x17\x4E\x55",88) .. tostring(_0x9A113B49 or _0xD7C0DE("\x70\x54\x4D\x5D\x51\x57\x5B\x60\x2A\x27\x3A",56)))
					_0xD29F8AF3()
					_0xCFD2650B:SetCore(_0xD7C0DE("\xC0\xF1\xFB\xF2\xD9\xF7\xED\xF3\xFD\xF5\xFE\xFF\xEB\xC9\xCE\xCC",146), {Title = _0x59BFBFEB, Text = _0xD7C0DE("\x76\x47\x51\x4D\x4D\x0A\x40\x49\x54\x0E\x4A\x48\x41\x5B\x41\x51\x51\x16\x58\x4A\x19\x53\x55\x4A\x5C\x52\x56\x24\x6F\x62\x13\x28\x20\x27\x34\x2D\x69\x2F\x25\x38\x28\x3C\x6F\x31\x71\x3C\x36\x23\x75\x3D\x32\x21\x77",36), Duration = 5})
				end
			else
				_0xD29F8AF3()
			end
		else
			_0xD29F8AF3()
		end
	end
	print(_0xD7C0DE("\xF8\xE6\xC9\xC9\xDF\xE0\xDC\xC8\xF6\x8C\xE2\xDE\xCA\xDE\xD8\xDC\xD4\x94\xDE\xD3\xCE\x98\xCA\xC3\xC8\xC8\xD8\xD3\x9F\x95\x88\xEC\xED\xEA",162))
	_0x95AAA666(function()
end)
end
_0x23228D42()
