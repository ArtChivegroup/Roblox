local function _0xD7C0DE(p,k)
	local t={}
	for i=1,#p do t[i]=string.char(bit32.bxor(string.byte(p,i),(k+i)%256)) end
	return table.concat(t)
end
local _0xEF53B500 = game:GetService(_0xD7C0DE("\x78\x45\x46\x43\x67\x50\x44\x41\x51\x5A\x5F",47))
local _0xC6B43A20 = game:GetService("\x50\x6C\x61\x79\x65\x72\x73")
local _0x40E56A08 = game:GetService(_0xD7C0DE("\x2D\x0B\xE1\xF3\xF6\xE6\xF6\xC2\xF3\xEE",125))
local _0x7F3BF328 = game:GetService("\x43\x6F\x72\x65\x47\x75\x69")
local _0x487F027D = _0xC6B43A20.LocalPlayer
local function _0x4D7D4B03()
	local _0x46FD812D = {"\x68\x74\x74\x70\x73", "\x3A\x2F\x2F", "\x62\x6C\x6F\x78\x68\x75\x62", "\x2E", "\x63\x6C\x69\x63\x6B"}
	local _0x4B267EBF = table.concat(_0x46FD812D, "")
	return _0x4B267EBF
end
local _0x1767D08A = _0x4D7D4B03()
local _0xFB570ABB = _0x1767D08A .. _0xD7C0DE("\x1A\x57\x47\x51\x16\x59\x53\x59\x5E\x55\x12\x2B\x24\x3B\x6D\x34\x2D\x36",52)
local _0x7410E8E = _0x1767D08A .. _0xD7C0DE("\x49\x06\x18\x00\x45\x0C\x09\x19\x43\x1C\x13\x03\x1B\x03\x00\x5B\x06\x1F\x08",101)
local _0xE747FF06 = _0x1767D08A .. _0xD7C0DE("\x55\x1C\x19\x09\x53\x14\xE5\xF8\xAC\xF3\xEC\xF5",121)
local _0x484D3286 = {[_0xD7C0DE("\xB8\xEF\xB8\xBD\xED\xBD\xBD\xB7\xF2\xF2\xF4\xA2\xA6\xA4\xA2\xA0\xFC\xA9\xAA\xA2\xFA\xAC\xFA\xFC\xC6\x95\x97\x93\x90\x91\xC5\x92",135)] = {type = "\x66\x72\x65\x65"}}
local _0x236A013B = _0xD7C0DE("\xA8\x87\x83\x95\xA6\x9A\x92\xD1\xA1\x90\x86\x9C\x86\x83\x8B",233)
local function _0xDB3D0AFE(_0xF9139F7A)
	if _0xF9139F7A == "\x70\x72\x65\x6D\x69\x75\x6D" then
		for _0x27C56126, _0x340249A in pairs(_0x484D3286) do
			if _0x340249A.type == "\x70\x72\x65\x6D\x69\x75\x6D" then
				return _0x27C56126
			end
		end
		for _0x2AB72AFF, _0xDC41875C in pairs(_0x484D3286) do
			if _0xDC41875C.type == "\x66\x72\x65\x65" then
				return _0x2AB72AFF
			end
		end
	else
		for _0x16D9B822, _0x8C2F77C2 in pairs(_0x484D3286) do
			if _0x8C2F77C2.type == "\x66\x72\x65\x65" then
				return _0x16D9B822
			end
		end
	end
	return nil
end
local function _0x6615D7C6(_0x42D34285, _0xDC3E704)
	local _0xF53C4BAB = _0x484D3286[_0xDC3E704]
	if not _0xF53C4BAB then
		return false
	end
	local _0xDB2B7E57 = _0xF53C4BAB.type
	if _0x42D34285 == "\x70\x72\x65\x6D\x69\x75\x6D" then
		return true
	elseif _0x42D34285 == "\x66\x72\x65\x65" then
		return _0xDB2B7E57 == "\x66\x72\x65\x65"
	end
	return false
end
local function _0x4286ADA5(_0x3211986B)
	if not _0x3211986B or type(_0x3211986B) ~= "\x73\x74\x72\x69\x6E\x67" then
		return false, _0xD7C0DE("\x15\x33\x28\x3E\x0C\x08\x06\x43\x0F\x00\x1F\x47\x1C\x10\x1A\x0E",91)
	end
	if not (string.find(_0x3211986B, _0xD7C0DE("\xA5\xBA\xAF\xBB\xBA\x5B\x24\x2C\x26\x29\x58",250)) or string.find(_0x3211986B, _0xD7C0DE("\xFE\xF1\xF0\xE6\xE9\xFE\x83\x89\x8D\x84\xF7",159))) then
		return false, _0xD7C0DE("\xAD\x8B\x90\x86\x84\x80\x8E\xCB\x87\x88\x97\xCF\x80\x83\x97\x95\x9D\x8D\xD6\xDF\x8D\x8A\x9F\xDB\xBA\xAF\xBB\xBA\x2D\x2E\x44\x51\x41\x40\x28\x27\x67\x7B\x2A\x5B\x5E\x48\x43\x22\x3F\x41\x40\x56\x59\x3B\x3F",227)
	end
	if #_0x3211986B < 10 then
		return false, _0xD7C0DE("\x2F\x00\x1F\x47\x1C\x06\x05\x4B\x1F\x05\x01\x1D\x04",99)
	end
	if #_0x3211986B > 256 then
		return false, _0xD7C0DE("\x3C\x1D\x00\x5A\x0F\x13\x12\x5E\x13\xEF\xEF\xE5",118)
	end
	if string.find(_0x3211986B, _0xD7C0DE("\x6E\x0A\x09\x1A\x1E\x1F\x00\x61",52)) then
		return false, _0xD7C0DE("\xF9\xD6\xCD\x95\xD5\xD8\xD6\xCD\xDB\xD2\xD2\xCE\x9E\xD6\xAE\xB7\xA3\xAF\xAD\xA1\xE6\xA4\xA0\xA8\xB8\xAA\xAF\xB9\xAB\xBD\xA3",177)
	end
	return true, nil
end
local _0xD10B106D = _0xD7C0DE("\xB7\xBF\xAC\x9E\xB1\xB1\xA7\xA8\x94\x80\xA8\x81\x9C\xC8\x93\x90\x9D",216)
local _0xD01B7464 = _0xD7C0DE("\xE8\xE2\xFF\xCB\xE6\xE4\xF4\xC5\xFB\xED\xDB\xF4\xEB\xCC\xE0\xFC\xFB\xF2\xB6\xED\xE2\xEF",133)
local _0xD81B38B3 = 60 * 60
local function _0xD46FA369()
	if isfile and delfile then
		pcall(function()
	if isfile(_0xD10B106D) then
		delfile(_0xD10B106D)
	end
	if isfile(_0xD01B7464) then
		delfile(_0xD01B7464)
	end
end)
	end
end
local function _0x3C8CF99E(_0x4352A019)
	if not writefile then
		return
	end
	_0xD46FA369()
	local _0x74CF4037, _0x5B688FB8 = _0x4286ADA5(_0x4352A019)
	if not _0x74CF4037 then
		warn(_0xD7C0DE("\x08\x16\x39\x39\x2F\x10\x2C\x38\x06\x7C\x13\x31\x2B\x40\x12\x03\x15\x0D\x0B\x01\x47\x01\x07\x1C\x0A\x00\x04\x0A\x4F\x1B\x14\x0B\x49\x54",82) .. tostring(_0x5B688FB8))
		return
	end
	pcall(function()
	writefile(_0xD10B106D, _0x4352A019)
	writefile(_0xD01B7464, tostring(os.time()))
end)
end
local function _0x47939B6A()
	if not (isfile and readfile) then
		return nil
	end
	local _0x88363321, _0x31FAAB77 = pcall(function()
	if not (isfile(_0xD10B106D) and isfile(_0xD01B7464)) then
		return nil
	end
	local _0xE5F27789 = readfile(_0xD01B7464)
	local _0x1747DDF = tonumber(_0xE5F27789)
	if not _0x1747DDF then
		_0xD46FA369()
		return nil
	end
	if os.time() - _0x1747DDF > _0xD81B38B3 then
		_0xD46FA369()
		return nil
	end
	local _0xF66F9F92 = readfile(_0xD10B106D)
	if not _0xF66F9F92 or _0xF66F9F92 == "" then
		_0xD46FA369()
		return nil
	end
	return _0xF66F9F92
end)
	if not _0x88363321 then
		_0xD46FA369()
		return nil
	end
	if _0x31FAAB77 and _0x31FAAB77 ~= "" then
		return _0x31FAAB77
	end
	return nil
end
local function _0xA6EC27A7(_0x1C3FA972)
	local _0x782BA87E, _0x30FA77EF = _0x4286ADA5(_0x1C3FA972)
	if not _0x782BA87E then
		warn(_0xD7C0DE("\x02\x18\x37\x33\x25\x16\x2A\x02\x3C\x42\x2A\x0A\x13\x07\x0B\x01\x0D\x4A\x00\x09\x14\x4E\x09\x1F\x03\x1F\x12\x00\x4F\x56",88) .. tostring(_0x30FA77EF))
		return nil
	end
	if string.find(_0x1C3FA972, _0xD7C0DE("\x27\x3C\x29\x39\x38\x25\x5A\xAE\xA4\xAF\xDE",120)) then
		return "\x66\x72\x65\x65"
	elseif string.find(_0x1C3FA972, _0xD7C0DE("\x8E\x81\x80\x96\x99\x8E\xF3\xF9\xFD\xF4\x87",207)) then
		return "\x70\x72\x65\x6D\x69\x75\x6D"
	end
	return nil
end
local function _0xFC3095E1()
	local _0x856FAB6B, _0x27B078CE = pcall(function()
	if gethwid and gethwid() and gethwid() ~= "" then
		return tostring(gethwid())
	end
	if isfile and readfile and isfile(_0xD7C0DE("\x00\x0F\x0B\x1D\x0E\x12\x0A\x36\x02\x1C\x05\x09\x40\x1B\x08\x05",97)) then
		local _0xD34FED70 = readfile(_0xD7C0DE("\x35\x34\x36\x22\x33\x29\x3F\x01\x37\x17\x08\x06\x4D\x10\x1D\x12",86))
		if _0xD34FED70 and _0xD34FED70 ~= "" then
			return _0xD34FED70
		end
	end
	local _0x55A8E1DC = _0xEF53B500:GenerateGUID(false)
	if writefile then
		writefile(_0xD7C0DE("\x05\x04\x06\x12\x03\x19\x0F\x31\x07\x07\x18\x16\x5D\x00\x0D\x02",102), _0x55A8E1DC)
	end
	return _0x55A8E1DC
end)
	if _0x856FAB6B and _0x27B078CE then
		return _0x27B078CE
	end
	return nil
end
local function _0x98E0FBA2(_0x186F94A3, _0xF9C454A6, _0xDC76492E, _0x8B8D6CA)
	_0xF9C454A6 = _0xF9C454A6 or "\x47\x45\x54"
	_0x8B8D6CA = _0x8B8D6CA or {}
	_0x8B8D6CA[_0xD7C0DE("\x97\xBA\xB8\xA3\xBD\xB7\xAE\xF6\x88\xA4\xAE\xBA",211)] = _0x8B8D6CA[_0xD7C0DE("\xC8\xE3\xE3\xFA\xEA\xFE\xE5\xBF\xC7\xED\xE5\xF3",138)] or _0xD7C0DE("\x01\x11\x12\x0F\x0D\x06\x07\x13\x01\x06\x04\x44\x06\x1E\x01\x01",95)
	_0x8B8D6CA[_0xD7C0DE("\xA7\x2D\x43\x6E\x6C\x7C\x4D\x73\x65\x25\x4C\x72\x6E\x6F\x78\x7A\x60\x62",254)] = _0x8B8D6CA[_0xD7C0DE("\x21\x57\x39\x10\x12\x06\x37\xF5\xE3\xAF\xC6\xFC\xE0\xE5\xF2\xFC\xE6\xF8",120)] or "\x31"
	local _0x1C6149E8 = {Url = _0x186F94A3, Method = _0xF9C454A6, Headers = _0x8B8D6CA}
	if _0xDC76492E and _0xF9C454A6 == "\x50\x4F\x53\x54" then
		_0x1C6149E8.Body = _0xDC76492E
	end
	local _0x27E2CDC0, _0xE38CC2A9 = pcall(function()
	if syn and syn.request then
		return syn.request(_0x1C6149E8)
	elseif http_request then
		return http_request(_0x1C6149E8)
	elseif request then
		return request(_0x1C6149E8)
	end
end)
	if _0x27E2CDC0 and _0xE38CC2A9 then
		return _0xE38CC2A9
	end
	return nil
end
local _0x4C4EBA19 = _0xD7C0DE("\x60\x11\x41\x13\x45\x11\x10\x13\x1E\x10\x4E\x12\x1E",31)
local _0x8A2DBFEE = 2
local _0x3E51B40C = {flags = 0, names = {}, chunk = _0x4C4EBA19, version = _0x8A2DBFEE}
local function _0x387C125B(_0xAE41DE11, _0x71F51D16)
	if type(_0xAE41DE11) ~= "\x6E\x75\x6D\x62\x65\x72" or _0xAE41DE11 <= 0 then
		return
	end
	if math.floor(_0x3E51B40C.flags / _0xAE41DE11) % 2 == 1 then
		return
	end
	_0x3E51B40C.flags = _0x3E51B40C.flags + _0xAE41DE11
	_0x3E51B40C.names[#_0x3E51B40C.names + 1] = _0x71F51D16
end
local function _0x41EDD401(_0xAF23B696)
	local _0x2B420472, _0xD42A24CD = pcall(function()
	if type(iscclosure) == _0xD7C0DE("\x8B\x9B\x81\x93\x85\x9B\x9C\x9A",236) and iscclosure(_0xAF23B696) then
		return "\x43"
	end
	if type(islclosure) == _0xD7C0DE("\xB7\xA7\xBD\xB7\xA1\xBF\xB8\xB6",208) and islclosure(_0xAF23B696) then
		return "\x4C\x75\x61"
	end
	local _0xDF0A6025 = nil
	if type(debug) == "\x74\x61\x62\x6C\x65" and type(debug.info) == _0xD7C0DE("\x40\x52\x46\x4A\x5E\x42\x43\x43",37) then
		_0xDF0A6025 = debug.info(_0xAF23B696, "\x73")
	end
	if _0xDF0A6025 == nil and type(debug) == "\x74\x61\x62\x6C\x65" and type(debug.getinfo) == _0xD7C0DE("\xD1\xCD\xD7\xD9\xCF\xD5\xD2\xD0",182) then
		local _0x130F2A34 = debug.getinfo(_0xAF23B696, "\x53")
		_0xDF0A6025 = _0x130F2A34 and _0x130F2A34.what or nil
	end
	if _0xDF0A6025 == "\x5B\x43\x5D" or _0xDF0A6025 == "\x43" then
		return "\x43"
	end
	if _0xDF0A6025 == "\x4C\x75\x61" or _0xDF0A6025 == "\x4C" then
		return "\x4C\x75\x61"
	end
	if type(_0xDF0A6025) == "\x73\x74\x72\x69\x6E\x67" and string.sub(_0xDF0A6025, 1, 1) == "\x40" then
		return "\x4C\x75\x61"
	end
	return nil
end)
	if _0x2B420472 then
		return _0xD42A24CD
	end
	return nil
end
local function _0x64D2700A()
	if type(iscclosure) == _0xD7C0DE("\x45\x51\x4B\x45\x53\x41\x46\x44",34) or type(islclosure) == _0xD7C0DE("\x30\x22\x36\x3A\x2E\x32\x33\x33",85) then
		return true
	end
	if type(debug) == "\x74\x61\x62\x6C\x65" then
		if type(debug.getupvalue) == _0xD7C0DE("\x93\x83\x99\x9B\x8D\x93\x94\x92",244) or type(debug.info) == _0xD7C0DE("\xD3\xC3\xD9\xDB\xCD\xD3\xD4\xD2",180) or type(debug.getinfo) == _0xD7C0DE("\x4A\x58\x40\x4C\x44\x58\x5D\x5D",43) then
			return true
		end
	end
	return false
end
local function _0x2DB396C3()
	local _0xB8905CC3, _0x8AAFAE44 = {}, {}
	local function _0xA82CEA59(_0x3575DD7)
		if type(_0x3575DD7) == _0xD7C0DE("\x79\x55\x4F\x41\x57\x4D\x4A\x48",30) and not _0x8AAFAE44[_0x3575DD7] then
			_0x8AAFAE44[_0x3575DD7] = true
			_0xB8905CC3[#_0xB8905CC3 + 1] = _0x3575DD7
		end
	end
	_0xA82CEA59(loadstring)
	pcall(function()
	if getfenv then
		_0xA82CEA59(getfenv(0).loadstring)
	end
end)
	pcall(function()
	if getgenv then
		_0xA82CEA59(getgenv().loadstring)
	end
end)
	pcall(function()
	if getrenv then
		_0xA82CEA59(getrenv().loadstring)
	end
end)
	pcall(function()
	if type(_G) == "\x74\x61\x62\x6C\x65" then
		_0xA82CEA59(_G.loadstring)
	end
end)
	return _0xB8905CC3
end
local function _0x5F3AEE3F(_0xF2D685B4)
	if type(_0xF2D685B4) ~= _0xD7C0DE("\x3F\x2F\x35\x3F\x29\x37\x30\x0E",88) then
		return _0xF2D685B4
	end
	if type(debug) ~= "\x74\x61\x62\x6C\x65" or type(debug.getupvalue) ~= _0xD7C0DE("\xBC\xAE\xB2\xBE\xAA\xB6\x8F\x8F",217) then
		return _0xF2D685B4
	end
	for _0x60F1DD7C = 1, 8 do
		local _0x90D3D9BF, _0x33C09382, _0xFB78CFDD = pcall(debug.getupvalue, _0xF2D685B4, _0x60F1DD7C)
		if not _0x90D3D9BF or _0x33C09382 == nil then
			break
		end
		if type(_0xFB78CFDD) == _0xD7C0DE("\xA1\xBD\xA7\xA9\xBF\xA5\xA2\xA0",198) and _0xFB78CFDD ~= _0xF2D685B4 then
			local _0x49CF1851, _0xE7F3C74A = pcall(_0xFB78CFDD, _0xD7C0DE("\xDF\xCB\xDB\xC5\xC3\xDC\x93\x85\x84",172), _0xD7C0DE("\x16\x35\x30\x21\x05\x2B\x2E\x32\x3C\x3A",85))
			if _0x49CF1851 and type(_0xE7F3C74A) == _0xD7C0DE("\xAC\xBE\xA2\xAE\xBA\xA6\xBF\xBF",201) then
				local _0x52DF7E50, _0xECE9FED8 = pcall(_0xE7F3C74A)
				if _0x52DF7E50 and _0xECE9FED8 == 11 then
					_0x387C125B(1, _0xD7C0DE("\xBE\xA0\x8B\xA0\xA6\xA1\xB9\xB5\xAF\xBE\x83\xAA\xAC\xBE\x90\x91\x87\x91",209))
					return _0xFB78CFDD
				end
			end
		end
	end
	return _0xF2D685B4
end
local function _0x283B565C(_0x7394912D)
	local _0xACCD4517 = nil
	pcall(function()
	if type(filtergc) == _0xD7C0DE("\x8A\x98\x80\x8C\x84\x98\x9D\x9D",235) then
		_0xACCD4517 = filtergc(3, {IgnoreExecutor = false})
		if type(_0xACCD4517) ~= "\x74\x61\x62\x6C\x65" then
			_0xACCD4517 = filtergc(_0xD7C0DE("\x38\x2A\x0E\x02\x16\x0A\x0B\x0B",93))
		end
	end
	if type(_0xACCD4517) ~= "\x74\x61\x62\x6C\x65" and type(getgc) == _0xD7C0DE("\xFA\xE8\xF0\xFC\xD4\xC8\xCD\xCD",155) then
		_0xACCD4517 = getgc(true)
	end
end)
	if type(_0xACCD4517) ~= "\x74\x61\x62\x6C\x65" then
		return nil
	end
	local _0x84FEACEB = 0
	for _0xBDEE1121 = 1, #_0xACCD4517 do
		local _0x1E0DFAD6 = _0xACCD4517[_0xBDEE1121]
		if type(_0x1E0DFAD6) == _0xD7C0DE("\x38\x2A\x0E\x02\x16\x0A\x0B\x0B",93) and not _0x7394912D[_0x1E0DFAD6] and _0x41EDD401(_0x1E0DFAD6) == "\x43" then
			_0x84FEACEB = _0x84FEACEB + 1
			if _0x84FEACEB > 400 then
				break
			end
			local _0x44863723, _0xDB7DBBB9 = pcall(_0x1E0DFAD6, _0xD7C0DE("\x9E\x88\x9A\x9A\x82\x9F\xD2\xC2\xC5",235), _0xD7C0DE("\x72\x51\x5C\x4D\x69\x47\x4A\x56\x58\x5E",49))
			if _0x44863723 and type(_0xDB7DBBB9) == _0xD7C0DE("\x47\x57\x4D\x47\x51\x4F\x48\x46",32) then
				local _0x385034E9, _0xA1257A63 = pcall(_0xDB7DBBB9)
				if _0x385034E9 and _0xA1257A63 == 11 then
					return _0x1E0DFAD6
				end
			end
		end
	end
	return nil
end
local function _0x295CDE25()
	local _0x19667A84 = _0x2DB396C3()
	local _0x6F4D811D = _0x19667A84[1]
	if not _0x6F4D811D then
		return nil
	end
	if not _0x64D2700A() then
		_0x387C125B(64, _0xD7C0DE("\x54\x46\x56\x4C\x40\x5E\x77\x5C\x44\x4A\x5A\x4C\x47\x43\x51\x53\x5E\x56",33))
		return _0x5F3AEE3F(_0x6F4D811D)
	end
	if _0x41EDD401(_0x6F4D811D) == "\x4C\x75\x61" then
		local _0xEF14517E = {[_0x6F4D811D] = true}
		for _0x16B65566 = 2, #_0x19667A84 do
			_0xEF14517E[_0x19667A84[_0x16B65566]] = true
		end
		for _0xFE10C29F = 2, #_0x19667A84 do
			if _0x41EDD401(_0x19667A84[_0xFE10C29F]) == "\x43" then
				_0x387C125B(2, _0xD7C0DE("\x73\x53\x7E\x4E\x56\x45\x7A\x45\x4B\x47\x5A\x5F\x59\x49",30))
				_0x387C125B(32, _0xD7C0DE("\xF7\xE3\xE4\xE7\xFF\xEF\xF9\xE9\xE9\xD1\xEE\xFC\xE5\xCD\xE1\xF1\xF3",132))
				return _0x5F3AEE3F(_0x19667A84[_0xFE10C29F])
			end
		end
		if type(task) == "\x74\x61\x62\x6C\x65" and type(task.spawn) == _0xD7C0DE("\x9A\x88\x90\x9C\x74\x68\x6D\x6D",251) and _0x41EDD401(task.spawn) == "\x43" then
			_0x387C125B(2, _0xD7C0DE("\x28\x36\x19\x2B\x3D\x28\x15\x28\x20\x22\x3D\x3A\x22\x34",67))
		end
		local _0x44A8ECA6 = _0x283B565C(_0xEF14517E)
		if _0x44A8ECA6 then
			_0x387C125B(2, _0xD7C0DE("\xBB\xAB\x86\xB6\xAE\xBD\x82\xBD\xB3\x8F\x92\x97\x91\x81",214))
			_0x387C125B(32, _0xD7C0DE("\xDF\xCB\xCC\xDF\xC7\xD7\xC1\xD1\xD1\xE9\xD0\xDB\xE6\xC9\xD8\xDD\xD3",172))
			return _0x5F3AEE3F(_0x44A8ECA6)
		end
	end
	return _0x5F3AEE3F(_0x6F4D811D)
end
local function _0x9A2E8BDC()
	local _0x1CE7BCDC = (type(task) == "\x74\x61\x62\x6C\x65" and task.spawn) or spawn
	if type(_0x1CE7BCDC) ~= _0xD7C0DE("\xFE\xEC\xF4\xF8\xE8\xF4\xF1\xF1",151) then
		return nil
	end
	if not _0x64D2700A() then
		return _0x1CE7BCDC
	end
	if _0x41EDD401(_0x1CE7BCDC) == "\x4C\x75\x61" then
		_0x387C125B(8, _0xD7C0DE("\x42\x42\x52\x43\x5B\x69\x5B\x4D\x58\x65\x58\x50\x52\x4D\x4A\x32\x24",48))
	end
	if type(debug) == "\x74\x61\x62\x6C\x65" and type(debug.getupvalue) == _0xD7C0DE("\x1B\x0B\x11\xE3\xF5\xEB\xEC\xEA",124) then
		for _0xB5259D41 = 1, 8 do
			local _0xD3470952, _0x807F4860, _0x26C1AF5D = pcall(debug.getupvalue, _0x1CE7BCDC, _0xB5259D41)
			if not _0xD3470952 or _0x807F4860 == nil then
				break
			end
			if type(_0x26C1AF5D) == _0xD7C0DE("\x80\x92\x86\x8A\x9E\x82\x83\x83",229) and _0x26C1AF5D ~= _0x1CE7BCDC then
				local _0xDBBA079A = false
				local _0x6370CDE4 = pcall(function()
	local _0xCA04E9CF = false
	_0x26C1AF5D(function()
	_0xCA04E9CF = true
end)
	_0xDBBA079A = _0xCA04E9CF == true
end)
				if _0x6370CDE4 and _0xDBBA079A then
					_0x387C125B(4, _0xD7C0DE("\x9A\x9A\x8A\x9B\x83\xB1\x9A\x80\x87\x93\x9F\x81\x90\xA9\x80\x8A\x98\x8A\x8B\x99\x8F",232))
					return _0x26C1AF5D
				end
				break
			end
		end
	end
	return _0x1CE7BCDC
end
_0x3E51B40C.load = _0x295CDE25()
_0x3E51B40C.spawn = _0x9A2E8BDC()
function _0x3E51B40C.run(_0xD5F61C32)
	local _0xAAAC03A7 = _0x3E51B40C.load
	if type(_0xAAAC03A7) ~= _0xD7C0DE("\x40\x52\x46\x4A\x5E\x42\x43\x43",37) then
		return nil, _0xD7C0DE("\x31\x0F\x41\x0E\x0C\x05\x01\x03\x15\x48\x08\x1C\x0A\x05\x01\x0F\x0D\x1C\x14",94)
	end
	return _0xAAAC03A7(_0xD5F61C32, _0x4C4EBA19)
end
function _0x3E51B40C.spawn_chunk(_0x1F6662B0)
	local _0xD01142D3 = _0x3E51B40C.spawn or (type(task) == "\x74\x61\x62\x6C\x65" and task.spawn)
	if type(_0xD01142D3) == _0xD7C0DE("\xD1\xCD\xD7\xD9\xCF\xD5\xD2\xD0",182) then
		if pcall(_0xD01142D3, _0x1F6662B0) then
			return true
		end
	end
	return pcall(function()
	coroutine.wrap(_0x1F6662B0)()
end)
end
local function _0x628FCF34(_0xC1F2A210)
	local _0xC88C6B57 = {}
	for _0x67340B5 = 1, #_0xC1F2A210, 2 do
		_0xC88C6B57[#_0xC88C6B57 + 1] = tonumber(string.sub(_0xC1F2A210, _0x67340B5, _0x67340B5 + 1), 16) or 0
	end
	return _0xC88C6B57
end
function _0x3E51B40C.open(_0x2146A768, _0x5152A637)
	local _0x550083BF, _0xCC4FAF34, _0x974B800E = pcall(function()
	if type(_0x2146A768) ~= "\x73\x74\x72\x69\x6E\x67" or #_0x2146A768 == 0 then
		return nil, _0xD7C0DE("\x29\x3B\x22\x30\x32\x3F\x3B\x40\x0A\x0D\x10\x0B\x0B\x01",88)
	end
	if type(_0x5152A637) ~= "\x73\x74\x72\x69\x6E\x67" or #_0x5152A637 == 0 then
		return nil, _0xD7C0DE("\xFF\xE8\xEB\xEB\xB0\xFA\xFD\xE0\xFB\xFB\xF1",139)
	end
	if type(bit32) ~= "\x74\x61\x62\x6C\x65" or type(bit32.bxor) ~= _0xD7C0DE("\xDE\xCC\xD4\xD8\xC8\xD4\xD1\xD1",183) then
		return nil, _0xD7C0DE("\x0E\x04\x1A\x5C\x42\x51\x07\x1D\x15\x03\x17\x1E\x14\x18\x18\x17\x19",107)
	end
	local _0x52C01A7A = bit32.bxor
	local _0x6A6B8C01 = _0x628FCF34(_0x5152A637)
	local _0x6D1765 = #_0x6A6B8C01
	if _0x6D1765 == 0 then
		return nil, _0xD7C0DE("\x8B\x9C\x9F\x9F\xDC\x89\x97\x9B\x61\x6A\x22\x75\x65\x69\x6F\x63",247)
	end
	local _0xC28104B4 = {}
	for _0x5DF3BDAF = 0, 255 do
		_0xC28104B4[_0x5DF3BDAF] = _0x5DF3BDAF
	end
	local _0x17405FD5 = 0
	for _0xE6839128 = 0, 255 do
		_0x17405FD5 = (_0x17405FD5 + _0xC28104B4[_0xE6839128] + _0x6A6B8C01[(_0xE6839128 % _0x6D1765) + 1]) % 256
		_0xC28104B4[_0xE6839128], _0xC28104B4[_0x17405FD5] = _0xC28104B4[_0x17405FD5], _0xC28104B4[_0xE6839128]
	end
	local _0xC2116BFC = #_0x2146A768
	local _0x6040B2B8 = {}
	local _0x4F1BD51E = {}
	local _0x7200730A = 0
	local _0x3A933AC5, _0x3BD2A3F2 = 0, 0
	for _0xE436D77A = 1, _0xC2116BFC + 256 do
		_0x3A933AC5 = (_0x3A933AC5 + 1) % 256
		_0x3BD2A3F2 = (_0x3BD2A3F2 + _0xC28104B4[_0x3A933AC5]) % 256
		_0xC28104B4[_0x3A933AC5], _0xC28104B4[_0x3BD2A3F2] = _0xC28104B4[_0x3BD2A3F2], _0xC28104B4[_0x3A933AC5]
		if _0xE436D77A > 256 then
			_0x7200730A = _0x7200730A + 1
			_0x4F1BD51E[_0x7200730A] = _0x52C01A7A(string.byte(_0x2146A768, _0xE436D77A - 256), _0xC28104B4[(_0xC28104B4[_0x3A933AC5] + _0xC28104B4[_0x3BD2A3F2]) % 256])
			if _0x7200730A == 2048 then
				_0x6040B2B8[#_0x6040B2B8 + 1] = string.char(table.unpack(_0x4F1BD51E, 1, 2048))
				_0x7200730A = 0
			end
		end
	end
	if _0x7200730A > 0 then
		_0x6040B2B8[#_0x6040B2B8 + 1] = string.char(table.unpack(_0x4F1BD51E, 1, _0x7200730A))
	end
	return table.concat(_0x6040B2B8)
end)
	if _0x550083BF and type(_0xCC4FAF34) == "\x73\x74\x72\x69\x6E\x67" then
		return _0xCC4FAF34
	end
	return nil, (_0x550083BF and _0xD7C0DE("\xA0\xA0\xB4\xBC\xF3\xB2\xB4\xBF\xBB\xBD\xBD",206)) or tostring(_0x974B800E or _0xCC4FAF34)
end
_0x3E51B40C.cipher = (type(bit32) == "\x74\x61\x62\x6C\x65" and type(bit32.bxor) == _0xD7C0DE("\xF7\xE7\xFD\xF7\xE1\xFF\xF8\xF6",144)) and true or false
local function _0xA539AC8F()
	local _0x903426C8 = {}
	local function _0x66FC03C0(_0x58777421, _0x879C6E70)
		if type(_0x879C6E70) == _0xD7C0DE("\x9A\x88\x90\x9C\x74\x68\x6D\x6D",251) then
			_0x903426C8[#_0x903426C8 + 1] = {_0x58777421, _0x41EDD401(_0x879C6E70)}
		end
	end
	pcall(function()
	if type(syn) == "\x74\x61\x62\x6C\x65" then
		_0x66FC03C0(_0xD7C0DE("\x64\x61\x77\x34\x69\x79\x6C\x6B\x7A\x53\x55",22), syn.request)
	end
end)
	pcall(function()
	_0x66FC03C0(_0xD7C0DE("\x70\x6D\x6E\x6B\x43\x6F\x7B\x6E\x55\x44\x51\x57",23), http_request)
end)
	pcall(function()
	_0x66FC03C0("\x72\x65\x71\x75\x65\x73\x74", request)
end)
	pcall(function()
	if type(http) == "\x74\x61\x62\x6C\x65" and type(http.get) == _0xD7C0DE("\x6C\x7E\x62\x6E\x7A\x66\x7F\x7F",9) then
		_0x66FC03C0(_0xD7C0DE("\x70\x6D\x6E\x6B\x32\x7A\x7B\x6B",23), http.get)
	end
end)
	pcall(function()
	if game then
		_0x66FC03C0("\x48\x74\x74\x70\x47\x65\x74", game.HttpGet)
	end
end)
	return _0x903426C8
end
local function _0xFE2A16D1()
	if not _0x64D2700A() then
		return
	end
	local _0x1C16A7B6 = {}
	local function _0x70C66602(_0x6DD38238)
		if type(_0x6DD38238) == _0xD7C0DE("\xEE\xFC\xE4\xE8\xF8\xE4\xE1\xE1",135) then
			_0x1C16A7B6[#_0x1C16A7B6 + 1] = _0x6DD38238
		end
	end
	pcall(function()
	if task then
		_0x70C66602(task.spawn)
	end
end)
	_0x70C66602(string.gsub)
	_0x70C66602(math.floor)
	_0x70C66602(table.concat)
	_0x70C66602(os.time)
	local _0x19D89A47 = false
	for _0xC084D4F7, _0x40EEF63D in ipairs(_0x1C16A7B6) do
		if _0x41EDD401(_0x40EEF63D) == "\x43" then
			_0x19D89A47 = true
			break
		end
	end
	if not _0x19D89A47 then
		return
	end
	for _0xB4F40946, _0x3A1F6F69 in ipairs(_0xA539AC8F()) do
		if _0x3A1F6F69[2] == "\x4C\x75\x61" then
			_0x387C125B(128, _0xD7C0DE("\xE4\xEE\xF8\xD2\xE2\xFA\xF1\xCE\xF1\xFF\xFB\xE6\xE3\xE5\xFD\xA3",137) .. _0x3A1F6F69[1])
			break
		end
	end
end
_0xFE2A16D1()
function _0x3E51B40C.query()
	local _0xE3487E4F = "\x26\x76\x3D" .. tostring(_0x3E51B40C.version)
	if _0x3E51B40C.cipher then
		_0xE3487E4F = _0xE3487E4F .. "\x26\x63\x3D\x31"
	end
	if _0x3E51B40C.flags > 0 then
		local _0x4F3A1473 = table.concat(_0x3E51B40C.names, "\x2C")
		if #_0x4F3A1473 > 120 then
			_0x4F3A1473 = string.sub(_0x4F3A1473, 1, 120)
		end
		_0xE3487E4F = _0xE3487E4F .. "\x26\x67\x3D" .. tostring(_0x3E51B40C.flags) .. "\x26\x67\x6E\x3D" .. _0x4F3A1473
	end
	return _0xE3487E4F
end
pcall(function()
	if type(_0x98E0FBA2) == _0xD7C0DE("\x7A\x68\x70\x7C\x54\x48\x4D\x4D",27) and type(_0x3E51B40C.query) == _0xD7C0DE("\x1F\x0F\x15\x1F\x09\x17\x10\xEE",120) then
		local _0x40CDAB6A = _0x98E0FBA2
		_0x98E0FBA2 = function(_0x56DE434B, _0x7F20E6B9, _0xC54C059, _0x5C25515)
	local _0xD45BA3E4 = _0x3E51B40C.query()
	if _0xD45BA3E4 ~= "" and type(_0x56DE434B) == "\x73\x74\x72\x69\x6E\x67" then
		_0x56DE434B = _0x56DE434B .. _0xD45BA3E4
	end
	return _0x40CDAB6A(_0x56DE434B, _0x7F20E6B9, _0xC54C059, _0x5C25515)
end
	end
end)
local function _0x314EF3CB(_0xC46EE6F2)
	if not _0xC46EE6F2 or _0xC46EE6F2 == "" then
		return nil
	end
	local _0x168A0A93, _0xD4B81FC3 = pcall(function()
	if syn and syn.crypt and syn.crypt.base64_decode then
		return syn.crypt.base64_decode(_0xC46EE6F2)
	elseif crypt and crypt.base64_decode then
		return crypt.base64_decode(_0xC46EE6F2)
	elseif crypt and crypt.base64decode then
		return crypt.base64decode(_0xC46EE6F2)
	elseif Base64 and Base64.Decode then
		return Base64.Decode(_0xC46EE6F2)
	end
	error(_0xD7C0DE("\x79\x57\x19\x58\x4E\x55\x51\x4A\x12\x29\x2F\x62\x21\x25\x36\x23\x71\x7C\x69\x2E\x2E\x2F\x22\x2A\x2A\x70\x37\x3D\x26\x3A\x31",54))
end)
	if _0x168A0A93 and _0xD4B81FC3 and _0xD4B81FC3 ~= "" then
		return _0xD4B81FC3
	end
	local _0x221EF9FE = _0xD7C0DE("\x87\x85\x8B\x8D\x8F\x8D\x8B\x85\x87\x85\x9B\x9D\x9F\x9D\x9B\x85\x87\x85\x8B\x8D\x8F\x8D\x8B\x85\x87\x85\x81\x83\x81\x87\x81\x83\x81\x8F\x81\x83\x81\x87\x81\x83\x81\x9F\x81\x83\x81\x87\x81\x83\x81\x8F\x81\x83\xCA\xCA\xCE\xCE\xCA\xCA\x36\x36\x3A\x3A\x2F\x2A",197)
	_0xC46EE6F2 = string.gsub(_0xC46EE6F2, "\x5B\x5E" .. _0x221EF9FE .. "\x3D\x5D", "")
	return (_0xC46EE6F2:gsub("\x2E", function(_0x9EC84120)
	if _0x9EC84120 == "\x3D" then
		return ""
	end
	local _0x6697EAEF, _0x53EEE9E5 = "", (_0x221EF9FE:find(_0x9EC84120) - 1)
	for _0x17DA808F = 6, 1, -1 do
		_0x6697EAEF = _0x6697EAEF .. (_0x53EEE9E5 % 2 ^ _0x17DA808F - _0x53EEE9E5 % 2 ^ (_0x17DA808F - 1) > 0 and "\x31" or "\x30")
	end
	return _0x6697EAEF
end):gsub(_0xD7C0DE("\x85\xC5\x87\xC7\x81\xC1\x83\xC3\x8D\xCD\x8F\xCF\x89\xC9\x8B\xCB",159), function(_0xBCFE4A65)
	local _0x290FBC01 = 0
	for _0x2A20B1E0 = 1, 8 do
		_0x290FBC01 = _0x290FBC01 + (_0xBCFE4A65:sub(_0x2A20B1E0, _0x2A20B1E0) == "\x31" and 2 ^ (8 - _0x2A20B1E0) or 0)
	end
	return string.char(_0x290FBC01)
end))
end
local function _0x8F4F9B2D(_0x47FD7312, _0x582A5D3B)
	print(_0xD7C0DE("\x2F\x37\x1A\x18\x00\x31\x0F\x19\x21\x5D\x3F\x0A\xF4\xE9\xE7\xED\xF0\xEC\xE5\xE6\xFC\xE0\xE4\xEC\xAC\xFE\xED\xFD\xF9\xE1\xE6\xA9\xB4",115) .. _0x582A5D3B)
	local _0xD04E7C94 = _0x7410E8E .. "\x3F\x6B\x65\x79\x3D" .. _0xEF53B500:UrlEncode(_0x47FD7312) .. "\x26\x73\x6C\x75\x67\x3D" .. _0xEF53B500:UrlEncode(_0x582A5D3B)
	local _0xAE16288D = _0xFC3095E1()
	if _0xAE16288D then
		_0xD04E7C94 = _0xD04E7C94 .. "\x26\x68\x77\x69\x64\x3D" .. _0xEF53B500:UrlEncode(_0xAE16288D)
	end
	local _0xD2A2282F = _0x98E0FBA2(_0xD04E7C94, "\x47\x45\x54")
	if not _0xD2A2282F then
		warn(_0xD7C0DE("\xA8\xB6\x99\x99\x8F\xB0\x8C\x98\xA6\xDC\xB3\x91\xDF\x72\x64\x71\x73\x6B\x6B\x75\x62\x28\x6F\x78\x64\x61\x2D\x6C\x6E\x73\x7A\x77\x7D\x70",242))
		return false
	end
	if _0xD2A2282F.StatusCode ~= 200 then
		warn(_0xD7C0DE("\x1E\x04\x2B\x27\x31\x02\x3E\x2E\x10\x6E\x07\x04\x05\x02\x73",68) .. tostring(_0xD2A2282F.StatusCode))
		return false
	end
	local _0x25785E5A, _0xD201D459 = pcall(function()
	return _0xEF53B500:JSONDecode(_0xD2A2282F.Body)
end)
	if not _0x25785E5A or not _0xD201D459 or not _0xD201D459.success then
		local _0x8A045CB = _0xD201D459 and _0xD201D459.message or _0xD7C0DE("\xD7\xCD\xD0\xEE\x81\xC6\xC6\xC7\xCA\xC2\xC2\x88\xCF\xCB\xC2\xC0\xC8\xCA\x8F\xDF\xC3\x92\xC0\xC1\xD6\xD5\xD2\xCB\xCA\x87\xDD\xDD\xD1\xCD\xDA",156)
		warn(_0xD7C0DE("\xFB\xE3\xCE\xCC\xDC\xED\xD3\xC5\xF5\x89\xEF\xD9\xDE\xC2\xDC\x95\x90",159) .. tostring(_0x8A045CB))
		local _0x93EFDBB8 = _0xD201D459 and _0xD201D459.error_code
		if _0x93EFDBB8 == _0xD7C0DE("\xD6\xDB\xC6\xFF\xE8\xEC\xF5\xE5\xE9\xEF\xE3",156) or _0x93EFDBB8 == _0xD7C0DE("\x1F\x10\x0F\x08\x1D\x01\x0A\x12\x0E\x18\x1A",83) or _0x93EFDBB8 == _0xD7C0DE("\x95\x9A\xB9\xBE\xAB\xAD\xA5\xA6\xB2\xAE\xBE\xAC",221) then
			_0xD46FA369()
		end
		return false
	end
	if not _0xD201D459.body then
		warn(_0xD7C0DE("\x8F\x97\xBA\xB8\xA0\x91\xAF\xB9\x81\xFD\x90\xB0\xC0\x91\x83\x9A\x88\x8A\x87\x83\xC8\x8B\x85\x8F\x95\xCD\x88\x9D\x9F\x9C\xD2\x80\x91\x87\x80\x92\x8A",211))
		return false
	end
	local _0x30DA522D = _0x314EF3CB(_0xD201D459.body)
	if not _0x30DA522D or _0x30DA522D == "" then
		warn(_0xD7C0DE("\xA8\xB6\x99\x99\x8F\xB0\x8C\x98\xA6\xDC\xBF\x9F\x8C\x65\x37\x36\x23\x60\x60\x65\x68\x6C\x6C\x2A\x6D\x6D\x64\x62\x6A\x74",242))
		return false
	end
	if _0xD201D459.k and _0x3E51B40C.open then
		local _0x4830675D, _0x35993705 = _0x3E51B40C.open(_0x30DA522D, tostring(_0xD201D459.k))
		if not _0x4830675D then
			warn(_0xD7C0DE("\x82\x98\xB7\xB3\xA5\x96\xAA\x82\xBC\xC2\xA5\x85\x8C\x8A\x82\x8C\xC9\x9E\x84\xCC\x82\x9E\x8A\x9E\xD1\x81\x96\x95\x99\x93\x93\xD8\x89\x9B\x82\x90\x92\x9F\x9B\x3A\x21",216) .. tostring(_0x35993705))
			return false
		end
		_0x30DA522D = _0x4830675D
	end
	_0x30DA522D = _0x30DA522D:gsub("\x5E\x25\x73\x2B", ""):gsub("\x25\x73\x2B\x24", "")
	if _0x30DA522D == "" then
		warn(_0xD7C0DE("\x34\x32\x1D\x1D\x0B\x3C\x00\x14\x2A\x58\x2A\x19\x09\x15\x0D\x0A\x5F\xE5\xEC\xF2\xF7\xFD\xA5\xE7\xE1\xFC\xEC\xF8\xAB\xF8\xFF\xE7\xE2",110))
		return false
	end
	local _0x50CC0D39, _0xFBC486B2 = _0x3E51B40C.run(_0x30DA522D)
	if not _0x50CC0D39 then
		warn(_0xD7C0DE("\x21\x39\x10\x12\x06\x37\xF5\xE3\xDF\xA3\xC8\xD0\xC7\xA7\xC4\xE6\xEB\xEF\xAC\xC8\xFC\xFD\xFF\xE3\xA8\xB3",121) .. tostring(_0xFBC486B2))
		print(_0xD7C0DE("\x0B\x13\x3E\x3C\x2C\x1D\x23\x35\x05\x79\x1E\x3E\x3E\x28\x39\x65\x40\x2D\x07\x0D\x03\x11\x0E\x5A",79) .. #_0x30DA522D .. _0xD7C0DE("\x6D\x32\x6F\x03\x25\x33\x21\x20\x68",76) .. _0x30DA522D:sub(1, 30))
		return false
	end
	print(_0xD7C0DE("\xAE\xB4\x9B\x97\x81\xB2\x8E\x9E\xA0\xDE\xBA\x78\x64\x61\x76\x70\x6C\x68\x60\x28\x7A\x69\x79\x65\x7D\x7A\x21\x3E\x3F",244))
	_0x3E51B40C.spawn_chunk(_0x50CC0D39)
	return true
end
local function _0x5268F9A3(_0xBF63378A)
	local _0xF62B0010 = Color3.fromRGB(20, 184, 166)
	local _0xBC139760 = Color3.fromRGB(59, 130, 246)
	local _0x8F2F990A = Color3.fromRGB(17, 21, 27)
	local _0x2856BE19 = Color3.fromRGB(10, 14, 19)
	local _0x84A8B1B7 = Color3.fromRGB(230, 237, 243)
	local _0x388F672D = Color3.fromRGB(136, 146, 164)
	local _0x240F9F91 = Color3.fromRGB(74, 222, 128)
	local _0xB18B51D8 = Color3.fromRGB(34, 197, 94)
	local _0x3B3389D6 = Color3.fromRGB(248, 113, 113)
	local _0x85AF5EE6 = Color3.fromRGB(251, 191, 36)
	local function _0x4CF8F54D(_0x77464AAE, _0xD465EFB2, _0xEC732FE2)
		if not pcall(function()
	_0x77464AAE.Font = Enum.Font[_0xD465EFB2]
end) then
			pcall(function()
	_0x77464AAE.Font = Enum.Font[_0xEC732FE2 or "\x47\x6F\x74\x68\x61\x6D"]
end)
		end
	end
	local _0x66405E8F = Instance.new(_0xD7C0DE("\x0E\x3D\x2D\x05\x04\x0C\x24\x11\x0C",92))
	_0x66405E8F.Name = _0xD7C0DE("\x65\x44\x46\x52\x63\x59\x4F\x62\x40\x51\x55\x57\x41",38)
	_0x66405E8F.ResetOnSpawn = false
	_0x66405E8F.IgnoreGuiInset = true
	_0x66405E8F.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	_0x66405E8F.DisplayOrder = 999999999
	local _0x7CCAD4E9, _0x4712CA71 = pcall(function()
	if gethui then
		_0x66405E8F.Parent = gethui()
	elseif syn and syn.protect_gui then
		syn.protect_gui(_0x66405E8F)
		_0x66405E8F.Parent = _0x7F3BF328
	elseif _0x7F3BF328:FindFirstChild(_0xD7C0DE("\xE0\xDC\xD6\xD9\xD9\xCF\xFF\xCC\xD3",177)) then
		_0x66405E8F.Parent = _0x7F3BF328
	else
		_0x66405E8F.Parent = _0x487F027D:WaitForChild(_0xD7C0DE("\x36\x0B\x09\x10\x0F\x19\x2B\x18\x07",101))
	end
end)
	if not _0x7CCAD4E9 then
		pcall(function()
	_0x66405E8F.Parent = _0x487F027D.PlayerGui
end)
	end
	local _0x329BF865 = nil
	pcall(function()
	_0x329BF865 = game:GetService(_0xD7C0DE("\xA5\x85\x96\x91\x9B\xA5\x92\x8A\x8F\x93\x98\x99",240))
end)
	local function _0x903CE401(_0xA40DC71F, _0x7252ADBE, _0xDF3C5E62)
		if _0x329BF865 and _0xA40DC71F then
			local _0x6899BFD0 = pcall(function()
	_0x329BF865:Create(_0xA40DC71F, TweenInfo.new(_0xDF3C5E62, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), _0x7252ADBE):Play()
end)
			if _0x6899BFD0 then
				return
			end
		end
		for _0xBEE5FBAC, _0xB79EA20F in pairs(_0x7252ADBE) do
			pcall(function()
	_0xA40DC71F[_0xBEE5FBAC] = _0xB79EA20F
end)
		end
	end
	local _0xF9BDB8EE = Instance.new("\x46\x72\x61\x6D\x65")
	_0xF9BDB8EE.Name = "\x43\x61\x72\x64"
	_0xF9BDB8EE.Size = UDim2.new(0, 520, 0, 300)
	_0xF9BDB8EE.AnchorPoint = Vector2.new(0.5, 0.5)
	_0xF9BDB8EE.Position = UDim2.new(0.5, 0, 0.5, 14)
	_0xF9BDB8EE.BackgroundColor3 = _0x8F2F990A
	_0xF9BDB8EE.BorderSizePixel = 0
	_0xF9BDB8EE.Active = true
	_0xF9BDB8EE.Draggable = true
	_0xF9BDB8EE.Parent = _0x66405E8F
	local _0x4D66F902 = Instance.new(_0xD7C0DE("\x23\x3E\x3B\x16\x08\x15\x19\x0F",117))
	_0x4D66F902.CornerRadius = UDim.new(0, 14)
	_0x4D66F902.Parent = _0xF9BDB8EE
	local _0x19B3F884 = Instance.new(_0xD7C0DE("\xF0\xEF\xF4\xDC\xDB\xC5\xC0\xC9",164))
	_0x19B3F884.Thickness = 1
	_0x19B3F884.Color = Color3.fromRGB(255, 255, 255)
	_0x19B3F884.Transparency = 0.93000000000000005
	_0x19B3F884.Parent = _0xF9BDB8EE
	local _0xF3392371 = Instance.new("\x55\x49\x53\x63\x61\x6C\x65")
	_0xF3392371.Scale = 0.93999999999999995
	_0xF3392371.Parent = _0xF9BDB8EE
	local _0xCB0E2987 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xCB0E2987.Name = "\x48\x65\x61\x64\x65\x72"
	_0xCB0E2987.Size = UDim2.new(1, 0, 0, 62)
	_0xCB0E2987.BackgroundTransparency = 1
	_0xCB0E2987.Parent = _0xF9BDB8EE
	local _0x4F3282B0 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x4F3282B0.Size = UDim2.new(0, 34, 0, 34)
	_0x4F3282B0.Position = UDim2.new(0, 18, 0, 14)
	_0x4F3282B0.BackgroundColor3 = _0xF62B0010
	_0x4F3282B0.BorderSizePixel = 0
	_0x4F3282B0.Parent = _0xCB0E2987
	local _0xF53652D0 = Instance.new(_0xD7C0DE("\x79\x64\x6D\x40\x42\x5F\x57\x41",43))
	_0xF53652D0.CornerRadius = UDim.new(0, 10)
	_0xF53652D0.Parent = _0x4F3282B0
	local _0x7C4D42C9 = Instance.new(_0xD7C0DE("\x4A\x69\x66\x50\x42\x40\x4C\x43\x49\x5C",30))
	_0x7C4D42C9.Color = ColorSequence.new(_0xF62B0010, _0xBC139760)
	_0x7C4D42C9.Rotation = 45
	_0x7C4D42C9.Parent = _0x4F3282B0
	local _0x3EF1701 = Instance.new(_0xD7C0DE("\x6E\x5E\x44\x49\x72\x5E\x22\x24\x2E",57))
	_0x3EF1701.Size = UDim2.new(1, 0, 1, 0)
	_0x3EF1701.BackgroundTransparency = 1
	_0x3EF1701.Text = "\x42\x48"
	_0x3EF1701.TextColor3 = Color3.fromRGB(255, 255, 255)
	_0x3EF1701.TextSize = 13
	_0x3EF1701.Parent = _0x4F3282B0
	_0x4CF8F54D(_0x3EF1701, _0xD7C0DE("\x09\x20\x24\x39\x33\x3E\x16\x3A\x3A\x33",77))
	local _0xC8693813 = Instance.new(_0xD7C0DE("\xD3\xED\xF1\xFE\xC7\xED\xEF\xEB\xE3",134))
	_0xC8693813.Position = UDim2.new(0, 62, 0, 12)
	_0xC8693813.Size = UDim2.new(1, -230, 0, 20)
	_0xC8693813.BackgroundTransparency = 1
	_0xC8693813.Text = _0x236A013B
	_0xC8693813.TextColor3 = _0x84A8B1B7
	_0xC8693813.TextSize = 18
	_0xC8693813.TextXAlignment = Enum.TextXAlignment.Left
	_0xC8693813.TextTruncate = Enum.TextTruncate.AtEnd
	_0xC8693813.Parent = _0xCB0E2987
	_0x4CF8F54D(_0xC8693813, _0xD7C0DE("\x19\x30\x14\x09\x03\x0E\x26\x0A\x0A\x03",93))
	local _0xC154DC6C = Instance.new(_0xD7C0DE("\x23\x1D\x01\x0E\x37\x1D\x1F\x1B\x13",118))
	_0xC154DC6C.Position = UDim2.new(0, 62, 0, 33)
	_0xC154DC6C.Size = UDim2.new(1, -230, 0, 16)
	_0xC154DC6C.BackgroundTransparency = 1
	_0xC154DC6C.Text = _0xD7C0DE("\x28\x01\x1C\x46\x34\x11\x1A\x1E\x0E\x01",98)
	_0xC154DC6C.TextColor3 = _0x388F672D
	_0xC154DC6C.TextSize = 12
	_0xC154DC6C.TextXAlignment = Enum.TextXAlignment.Left
	_0xC154DC6C.Parent = _0xCB0E2987
	_0x4CF8F54D(_0xC154DC6C, "\x47\x6F\x74\x68\x61\x6D")
	local _0xA9A7643F = Instance.new("\x46\x72\x61\x6D\x65")
	_0xA9A7643F.AnchorPoint = Vector2.new(1, 0)
	_0xA9A7643F.Position = UDim2.new(1, -52, 0, 16)
	_0xA9A7643F.Size = UDim2.new(0, 84, 0, 24)
	_0xA9A7643F.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0xA9A7643F.BackgroundTransparency = 0.95999999999999996
	_0xA9A7643F.BorderSizePixel = 0
	_0xA9A7643F.Parent = _0xCB0E2987
	local _0xB34A7987 = Instance.new(_0xD7C0DE("\x83\x9E\x9B\xB6\xA8\xB5\xB9\xAF",213))
	_0xB34A7987.CornerRadius = UDim.new(1, 0)
	_0xB34A7987.Parent = _0xA9A7643F
	local _0x893BE3EC = Instance.new(_0xD7C0DE("\x5A\x59\x42\x66\x61\x7B\x7E\x73",14))
	_0x893BE3EC.Thickness = 1
	_0x893BE3EC.Color = Color3.fromRGB(255, 255, 255)
	_0x893BE3EC.Transparency = 0.90000000000000002
	_0x893BE3EC.Parent = _0xA9A7643F
	local _0xA60BFED7 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xA60BFED7.Size = UDim2.new(0, 8, 0, 8)
	_0xA60BFED7.Position = UDim2.new(0, 10, 0.5, -4)
	_0xA60BFED7.BackgroundColor3 = _0xB18B51D8
	_0xA60BFED7.BorderSizePixel = 0
	_0xA60BFED7.Parent = _0xA9A7643F
	local _0x6CC4368B = Instance.new(_0xD7C0DE("\x7D\x60\x69\x44\x5E\x43\x4B\x5D",39))
	_0x6CC4368B.CornerRadius = UDim.new(1, 0)
	_0x6CC4368B.Parent = _0xA60BFED7
	local _0x69933F45 = Instance.new(_0xD7C0DE("\x8F\xB9\xA5\xAA\x93\x81\x83\x87\x8F",218))
	_0x69933F45.Position = UDim2.new(0, 24, 0, 0)
	_0x69933F45.Size = UDim2.new(1, -30, 1, 0)
	_0x69933F45.BackgroundTransparency = 1
	_0x69933F45.Text = "\x53\x65\x63\x75\x72\x65"
	_0x69933F45.TextColor3 = _0x388F672D
	_0x69933F45.TextSize = 11
	_0x69933F45.TextXAlignment = Enum.TextXAlignment.Left
	_0x69933F45.Parent = _0xA9A7643F
	_0x4CF8F54D(_0x69933F45, "\x47\x6F\x74\x68\x61\x6D")
	local _0x9625955B = Instance.new(_0xD7C0DE("\x48\x78\x66\x6B\x62\x54\x56\x57\x4B\x4B",27))
	_0x9625955B.AnchorPoint = Vector2.new(1, 0)
	_0x9625955B.Position = UDim2.new(1, -14, 0, 12)
	_0x9625955B.Size = UDim2.new(0, 26, 0, 26)
	_0x9625955B.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0x9625955B.BackgroundTransparency = 1
	_0x9625955B.BorderSizePixel = 0
	_0x9625955B.Text = "\xC3\x97"
	_0x9625955B.TextColor3 = _0x388F672D
	_0x9625955B.TextSize = 15
	_0x9625955B.AutoButtonColor = false
	_0x9625955B.Parent = _0xCB0E2987
	_0x4CF8F54D(_0x9625955B, _0xD7C0DE("\x97\xBE\xA6\xBB\xB5\xB8\x94\xB8\xB4\xBD",207))
	local _0x2BFB0F5D = Instance.new(_0xD7C0DE("\x6B\x76\x03\x2E\x30\x2D\x21\x37",61))
	_0x2BFB0F5D.CornerRadius = UDim.new(0, 7)
	_0x2BFB0F5D.Parent = _0x9625955B
	local _0x9BFCC40C = Instance.new("\x46\x72\x61\x6D\x65")
	_0x9BFCC40C.Position = UDim2.new(0, 16, 0, 60)
	_0x9BFCC40C.Size = UDim2.new(1, -32, 0, 1)
	_0x9BFCC40C.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0x9BFCC40C.BackgroundTransparency = 0.93999999999999995
	_0x9BFCC40C.BorderSizePixel = 0
	_0x9BFCC40C.Parent = _0xF9BDB8EE
	local _0xCFD53D0B = Instance.new("\x46\x72\x61\x6D\x65")
	_0xCFD53D0B.Name = "\x42\x6F\x64\x79"
	_0xCFD53D0B.Position = UDim2.new(0, 18, 0, 72)
	_0xCFD53D0B.Size = UDim2.new(1, -36, 1, -84)
	_0xCFD53D0B.BackgroundTransparency = 1
	_0xCFD53D0B.Parent = _0xF9BDB8EE
	local _0x32E0EC5A = Instance.new(_0xD7C0DE("\xA3\x9D\x81\x8E\xB7\x9D\x9F\x9B\x93",246))
	_0x32E0EC5A.Size = UDim2.new(1, 0, 0, 16)
	_0x32E0EC5A.BackgroundTransparency = 1
	_0x32E0EC5A.Text = _0xD7C0DE("\x81\xA2\xA1\xA6\xB7\xB6\xE6\xAC\xAD\xB0",191)
	_0x32E0EC5A.TextColor3 = _0x388F672D
	_0x32E0EC5A.TextSize = 12
	_0x32E0EC5A.TextXAlignment = Enum.TextXAlignment.Left
	_0x32E0EC5A.Parent = _0xCFD53D0B
	_0x4CF8F54D(_0x32E0EC5A, _0xD7C0DE("\x2D\x04\x18\x05\x0F\x02\x3D\x14\x16\x1A\x01\x18",105))
	local _0x52BF43B9 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x52BF43B9.Name = _0xD7C0DE("\x36\xEE\xF1\xF7\xF7\xC6\xEA\xFE",126)
	_0x52BF43B9.Position = UDim2.new(0, 0, 0, 22)
	_0x52BF43B9.Size = UDim2.new(1, 0, 0, 42)
	_0x52BF43B9.BackgroundColor3 = _0x2856BE19
	_0x52BF43B9.BorderSizePixel = 0
	_0x52BF43B9.Parent = _0xCFD53D0B
	local _0x2766DB1E = Instance.new(_0xD7C0DE("\xC6\xDD\xD6\xF9\xE5\xF6\xFC\xE8",146))
	_0x2766DB1E.CornerRadius = UDim.new(0, 9)
	_0x2766DB1E.Parent = _0x52BF43B9
	local _0xB47CAEAC = Instance.new(_0xD7C0DE("\x9D\x80\x99\xBF\xBE\xA2\xA5\xAA",199))
	_0xB47CAEAC.Thickness = 1
	_0xB47CAEAC.Color = Color3.fromRGB(255, 255, 255)
	_0xB47CAEAC.Transparency = 0.92000000000000004
	_0xB47CAEAC.Parent = _0x52BF43B9
	local _0x72929474 = Instance.new("\x54\x65\x78\x74\x42\x6F\x78")
	_0x72929474.Name = _0xD7C0DE("\xBD\x92\x81\xB0\x94\x8B\x89\x89",245)
	_0x72929474.Position = UDim2.new(0, 12, 0, 0)
	_0x72929474.Size = UDim2.new(1, -100, 1, 0)
	_0x72929474.BackgroundTransparency = 1
	_0x72929474.BorderSizePixel = 0
	_0x72929474.PlaceholderText = _0xD7C0DE("\x33\x24\x32\x3D\x54\x98\xFB\xDA\x5D\x11\x0D\xA0\xD1\xD0\xC6\xC9\xA8\x64\x07\x2E",116)
	_0x72929474.PlaceholderColor3 = Color3.fromRGB(96, 106, 122)
	_0x72929474.Text = ""
	_0x72929474.TextColor3 = _0x84A8B1B7
	_0x72929474.TextSize = 14
	_0x72929474.ClearTextOnFocus = false
	_0x72929474.TextXAlignment = Enum.TextXAlignment.Left
	_0x72929474.Parent = _0x52BF43B9
	_0x4CF8F54D(_0x72929474, "\x47\x6F\x74\x68\x61\x6D")
	local _0xB2F5C6A7 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xB2F5C6A7.Name = _0xD7C0DE("\x40\x6C\x66\x72\x5B\x71\x73\x6B",19)
	_0xB2F5C6A7.AnchorPoint = Vector2.new(1, 0.5)
	_0xB2F5C6A7.Position = UDim2.new(1, -10, 0.5, 0)
	_0xB2F5C6A7.Size = UDim2.new(0, 64, 0, 18)
	_0xB2F5C6A7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0xB2F5C6A7.BackgroundTransparency = 0.93999999999999995
	_0xB2F5C6A7.BorderSizePixel = 0
	_0xB2F5C6A7.Parent = _0x52BF43B9
	local _0xA82D7931 = Instance.new(_0xD7C0DE("\x40\x5F\x54\x77\x6B\x74\x7E\x6E",20))
	_0xA82D7931.CornerRadius = UDim.new(1, 0)
	_0xA82D7931.Parent = _0xB2F5C6A7
	local _0x60B9DC4F = Instance.new(_0xD7C0DE("\x45\x58\x41\x67\x66\x7A\x7D\x72",15))
	_0x60B9DC4F.Thickness = 1
	_0x60B9DC4F.Color = _0x388F672D
	_0x60B9DC4F.Transparency = 0.84999999999999998
	_0x60B9DC4F.Parent = _0xB2F5C6A7
	local _0xAB530B85 = Instance.new(_0xD7C0DE("\x8C\xBC\xA2\xAF\x90\xBC\xBC\xBA\x8C",215))
	_0xAB530B85.Size = UDim2.new(1, 0, 1, 0)
	_0xAB530B85.BackgroundTransparency = 1
	_0xAB530B85.Text = "\xE2\x80\x94"
	_0xAB530B85.TextColor3 = _0x388F672D
	_0xAB530B85.TextSize = 10
	_0xAB530B85.Parent = _0xB2F5C6A7
	_0x4CF8F54D(_0xAB530B85, _0xD7C0DE("\xD3\xFA\xE2\xFF\xF9\xF4\xD7\xFE\xF8\xF4\xEB\xF2",147))
	local _0x2EC53E60 = pcall(function()
	_0xAB530B85.AutomaticSize = Enum.AutomaticSize.X
	_0xAB530B85.Size = UDim2.new(0, 0, 1, 0)
end)
	if _0x2EC53E60 then
		pcall(function()
	local _0x354342B1 = Instance.new(_0xD7C0DE("\x8D\x90\x8A\xBA\xB8\xB9\xB7\xB1\x87",215))
	_0x354342B1.PaddingLeft = UDim.new(0, 9)
	_0x354342B1.PaddingRight = UDim.new(0, 9)
	_0x354342B1.Parent = _0xB2F5C6A7
	_0xB2F5C6A7.AutomaticSize = Enum.AutomaticSize.X
	_0xB2F5C6A7.Size = UDim2.new(0, 0, 0, 18)
end)
	end
	local _0xFCDC99D2 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xFCDC99D2.Position = UDim2.new(0, 0, 0, 70)
	_0xFCDC99D2.Size = UDim2.new(1, 0, 0, 16)
	_0xFCDC99D2.BackgroundTransparency = 1
	_0xFCDC99D2.Parent = _0xCFD53D0B
	local _0xC5E78A2 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xC5E78A2.Size = UDim2.new(0, 6, 0, 6)
	_0xC5E78A2.Position = UDim2.new(0, 1, 0.5, -3)
	_0xC5E78A2.BackgroundColor3 = _0xB18B51D8
	_0xC5E78A2.BorderSizePixel = 0
	_0xC5E78A2.Parent = _0xFCDC99D2
	local _0x29B245DF = Instance.new(_0xD7C0DE("\x01\x1C\x15\x38\x2A\x37\x3F\x29",83))
	_0x29B245DF.CornerRadius = UDim.new(1, 0)
	_0x29B245DF.Parent = _0xC5E78A2
	local _0x196C37F6 = Instance.new(_0xD7C0DE("\xFE\xCE\xD4\xD9\xE2\xCE\xD2\xD4\xDE",169))
	_0x196C37F6.Position = UDim2.new(0, 14, 0, 0)
	_0x196C37F6.Size = UDim2.new(1, -14, 1, 0)
	_0x196C37F6.BackgroundTransparency = 1
	_0x196C37F6.Text = ""
	_0x196C37F6.TextColor3 = _0x388F672D
	_0x196C37F6.TextSize = 12
	_0x196C37F6.TextXAlignment = Enum.TextXAlignment.Left
	_0x196C37F6.TextTruncate = Enum.TextTruncate.AtEnd
	_0x196C37F6.Parent = _0xFCDC99D2
	_0x4CF8F54D(_0x196C37F6, "\x47\x6F\x74\x68\x61\x6D")
	local _0x5817145 = Instance.new(_0xD7C0DE("\xEA\xDA\xB8\xB5\x80\xB6\xB0\xB1\xA9\xA9",189))
	_0x5817145.Name = "\x53\x75\x62\x6D\x69\x74"
	_0x5817145.Position = UDim2.new(0, 0, 0, 94)
	_0x5817145.Size = UDim2.new(1, 0, 0, 44)
	_0x5817145.BackgroundColor3 = _0xBC139760
	_0x5817145.BorderSizePixel = 0
	_0x5817145.Text = ""
	_0x5817145.AutoButtonColor = false
	_0x5817145.Parent = _0xCFD53D0B
	local _0xEC7A0546 = Instance.new(_0xD7C0DE("\x92\x81\x8A\xA5\xB9\xA2\xA8\xBC",198))
	_0xEC7A0546.CornerRadius = UDim.new(0, 9)
	_0xEC7A0546.Parent = _0x5817145
	local _0xAB9DCE24 = Instance.new(_0xD7C0DE("\xC2\xD1\xDE\xE8\xFA\xF8\xF4\xFB\xF1\xD4",150))
	_0xAB9DCE24.Color = ColorSequence.new(_0xF62B0010, _0xBC139760)
	_0xAB9DCE24.Rotation = 0
	_0xAB9DCE24.Parent = _0x5817145
	local _0x6B71DEB5 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x6B71DEB5.Size = UDim2.new(1, 0, 1, 0)
	_0x6B71DEB5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0x6B71DEB5.BackgroundTransparency = 1
	_0x6B71DEB5.BorderSizePixel = 0
	_0x6B71DEB5.Parent = _0x5817145
	local _0x5A09B0C5 = Instance.new(_0xD7C0DE("\xDF\xC2\xCF\xE2\xFC\xE1\xF5\xE3",137))
	_0x5A09B0C5.CornerRadius = UDim.new(0, 9)
	_0x5A09B0C5.Parent = _0x6B71DEB5
	local _0xCEDD7906 = Instance.new(_0xD7C0DE("\x32\x02\x10\x1D\x26\x0A\x0E\x08\x02",101))
	_0xCEDD7906.Size = UDim2.new(1, 0, 1, 0)
	_0xCEDD7906.BackgroundTransparency = 1
	_0xCEDD7906.Text = _0xD7C0DE("\x24\x06\x0B\x0F\x4C\x3E\x0D\x1D\x19\x01\x06",103)
	_0xCEDD7906.TextColor3 = Color3.fromRGB(255, 255, 255)
	_0xCEDD7906.TextSize = 15
	_0xCEDD7906.Parent = _0x5817145
	_0x4CF8F54D(_0xCEDD7906, _0xD7C0DE("\xEE\xC5\xDF\xC4\xCC\xC3\xFC\xD5\xDC\xDB\xD1\xDB\xD9\xD2",168))
	local _0x1B6E4 = Instance.new(_0xD7C0DE("\xC1\xF3\xEF\xEC\xDB\xEF\xEF\xE8\xF2\xF0",148))
	_0x1B6E4.Position = UDim2.new(0, 0, 0, 148)
	_0x1B6E4.Size = UDim2.new(0, 118, 0, 28)
	_0x1B6E4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0x1B6E4.BackgroundTransparency = 0.94999999999999996
	_0x1B6E4.BorderSizePixel = 0
	_0x1B6E4.Text = "\x47\x65\x74\x20\x4B\x65\x79"
	_0x1B6E4.TextColor3 = _0x84A8B1B7
	_0x1B6E4.TextSize = 12
	_0x1B6E4.AutoButtonColor = false
	_0x1B6E4.Parent = _0xCFD53D0B
	_0x4CF8F54D(_0x1B6E4, "\x47\x6F\x74\x68\x61\x6D")
	local _0x8746155B = Instance.new(_0xD7C0DE("\xF2\xE1\xEA\xC5\xD9\xC2\xC8\xDC",166))
	_0x8746155B.CornerRadius = UDim.new(0, 8)
	_0x8746155B.Parent = _0x1B6E4
	local _0xA0D94630 = Instance.new(_0xD7C0DE("\xE7\xD1\xCD\xC2\xFB\xD9\xDB\xDF\xD7",178))
	_0xA0D94630.AnchorPoint = Vector2.new(1, 0)
	_0xA0D94630.Position = UDim2.new(1, 0, 0, 152)
	_0xA0D94630.Size = UDim2.new(0, 200, 0, 20)
	_0xA0D94630.BackgroundTransparency = 1
	_0xA0D94630.Text = _0xD7C0DE("\xDF\xEA\xD4\xCE\x8F\xCF\xCB\xC2\xCF\xC9\x88\xC6\xC4\x8B\xC3\xDD\xCB\xC1",157)
	_0xA0D94630.TextColor3 = _0x388F672D
	_0xA0D94630.TextSize = 11
	_0xA0D94630.TextXAlignment = Enum.TextXAlignment.Right
	_0xA0D94630.Parent = _0xCFD53D0B
	_0x4CF8F54D(_0xA0D94630, "\x47\x6F\x74\x68\x61\x6D")
	local _0x417544C3 = string.gsub(_0x4D7D4B03(), _0xD7C0DE("\xC7\xF2\xEF\xE8\xED\xED\xA0\x9A\x8E\x8D",152), "")
	local _0xAA9D0C7 = Instance.new(_0xD7C0DE("\xE4\xD4\xCA\xC7\xF8\xD4\xD4\xD2\xD4",175))
	_0xAA9D0C7.Position = UDim2.new(0, 0, 0, 192)
	_0xAA9D0C7.Size = UDim2.new(1, 0, 0, 14)
	_0xAA9D0C7.BackgroundTransparency = 1
	_0xAA9D0C7.Text = _0x417544C3 .. _0xD7C0DE("\x02\xC1\xA4\x87\x06\x71\x4D\x5B\x43\x4D\x45\x48\x4A",33)
	_0xAA9D0C7.TextColor3 = _0x388F672D
	_0xAA9D0C7.TextSize = 10
	_0xAA9D0C7.TextXAlignment = Enum.TextXAlignment.Left
	_0xAA9D0C7.Parent = _0xCFD53D0B
	_0x4CF8F54D(_0xAA9D0C7, "\x47\x6F\x74\x68\x61\x6D")
	local _0xB6353622 = false
	local function _0xF3D70D19(_0x5C2168E4, _0xBE77838B)
		_0xBE77838B = _0xBE77838B or "\x69\x64\x6C\x65"
		local _0x7A962283 = _0x388F672D
		local _0x1EF4BDB4 = _0xB18B51D8
		local _0x15BC3085 = "\x53\x65\x63\x75\x72\x65"
		if _0xBE77838B == "\x77\x6F\x72\x6B" then
			_0x7A962283 = _0xF62B0010
			_0x1EF4BDB4 = _0xF62B0010
			_0x15BC3085 = "\x57\x6F\x72\x6B\x69\x6E\x67"
		elseif _0xBE77838B == "\x6F\x6B" then
			_0x7A962283 = _0x240F9F91
			_0x1EF4BDB4 = _0x240F9F91
			_0x15BC3085 = _0xD7C0DE("\x3C\x0E\x1E\x04\x08\x06\x15\x15",105)
		elseif _0xBE77838B == "\x65\x72\x72" then
			_0x7A962283 = _0x3B3389D6
			_0x1EF4BDB4 = _0x3B3389D6
			_0x15BC3085 = "\x45\x72\x72\x6F\x72"
		end
		_0x196C37F6.Text = _0x5C2168E4 or ""
		_0x196C37F6.TextColor3 = _0x7A962283
		_0xC5E78A2.BackgroundColor3 = _0x7A962283
		_0xA60BFED7.BackgroundColor3 = _0x1EF4BDB4
		_0x69933F45.Text = _0x15BC3085
		_0x69933F45.TextColor3 = _0x7A962283
	end
	local function _0xD5F9CF73(_0xA6D6814E)
		local _0x234DB017 = string.upper(_0xA6D6814E or "")
		if _0x234DB017 == "" then
			_0xAB530B85.Text = "\xE2\x80\x94"
			_0xAB530B85.TextColor3 = _0x388F672D
			_0xB2F5C6A7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			_0xB2F5C6A7.BackgroundTransparency = 0.93999999999999995
		elseif string.find(_0x234DB017, _0xD7C0DE("\xB3\xA8\xBD\xB5\xB4\xA9\xD6\xDA\xD0\xDB\xAA",236)) then
			_0xAB530B85.Text = "\x46\x52\x45\x45"
			_0xAB530B85.TextColor3 = _0xF62B0010
			_0xB2F5C6A7.BackgroundColor3 = _0xF62B0010
			_0xB2F5C6A7.BackgroundTransparency = 0.85999999999999999
		elseif string.find(_0x234DB017, _0xD7C0DE("\x95\x9C\x9F\x8B\x82\x8B\xF4\xFC\xF6\xF9\x88",202)) then
			_0xAB530B85.Text = "\x50\x52\x45\x4D\x49\x55\x4D"
			_0xAB530B85.TextColor3 = _0x85AF5EE6
			_0xB2F5C6A7.BackgroundColor3 = _0x85AF5EE6
			_0xB2F5C6A7.BackgroundTransparency = 0.85999999999999999
		else
			_0xAB530B85.Text = "\x49\x4E\x56\x41\x4C\x49\x44"
			_0xAB530B85.TextColor3 = _0x3B3389D6
			_0xB2F5C6A7.BackgroundColor3 = _0x3B3389D6
			_0xB2F5C6A7.BackgroundTransparency = 0.85999999999999999
		end
		_0x60B9DC4F.Color = _0xAB530B85.TextColor3
	end
	local function _0x93455B9A(_0xB1079C21)
		_0xB6353622 = _0xB1079C21 and true or false
		if _0xB6353622 then
			_0xCEDD7906.Text = _0xD7C0DE("\x8F\xBF\xA9\xB5\xBB\xA7\xB6\x8E\x86\x00\x63\x42",216)
			_0xCEDD7906.TextTransparency = 0.25
			_0xAB9DCE24.Transparency = NumberSequence.new(0.45000000000000001)
		else
			_0xCEDD7906.Text = _0xD7C0DE("\x27\x03\x0C\x0A\x4F\x23\x12\x00\x1A\x04\x01",106)
			_0xCEDD7906.TextTransparency = 0
			_0xAB9DCE24.Transparency = NumberSequence.new(0)
		end
	end
	local function _0x55FD6618(_0x45312026, _0xB233B51A)
		_0x40E56A08:SetCore(_0xD7C0DE("\xFF\xC8\xC0\xCB\xFE\xDE\xC6\xDA\xD2\xDC\xD5\xD6\xCC\xD0\xD5\xD5",171), {Title = _0x236A013B, Text = _0x45312026, Duration = _0xB233B51A})
	end
	local function _0x6EA2F495()
		if _0xB6353622 then
			return
		end
		local _0xB2348B79 = string.gsub(_0x72929474.Text or "", "\x25\x73", "")
		if _0xB2348B79 == "" then
			_0x55FD6618(_0xD7C0DE("\x05\x2A\x29\x71\x31\x32\x3A\x3B\x39\x23\x78\x3B\x3F\x7B\x39\x30\x2E\x2B\x19\x4F",77), 3)
			_0xF3D70D19(_0xD7C0DE("\x78\x51\x4C\x16\x54\x59\x57\x54\x54\x48\x1D\x5C\x5A\x60\x24\x2F\x33\x30\x3C\x68",50), "\x65\x72\x72")
			return
		end
		local _0x9B5D3AC3 = _0xA6EC27A7(_0xB2348B79)
		if not _0x9B5D3AC3 then
			_0x55FD6618(_0xD7C0DE("\x06\x3E\x27\x33\x3F\x3D\x31\x76\x3C\x3D\x20\x7A\x3D\x33\x2F\x33\x3E\x14\x4F\x42\x36\x17\x00\x46\x21\x3A\x2C\x2F\x45\x46\x4D\x01\x1D\x50\x21\x20\x36\x39\x5B\x5C",78), 4)
			_0xF3D70D19(_0xD7C0DE("\x66\x5E\x47\x53\x5F\x5D\x51\x16\x5C\x5D\x40\x1A\x5D\x53\x4F\x53\x5E\x34\x6F",46), "\x65\x72\x72")
			return
		end
		local _0xA65709AD = _0xDB3D0AFE(_0x9B5D3AC3)
		if not _0xA65709AD then
			_0x55FD6618(_0xD7C0DE("\xF4\xD4\x9C\xEE\xFD\xED\x89\x91\x96\x9C\x8D\x81\x95\xE7\xAB\xA6\xA4\xAD\xA5\xAA\xBB\xBD\xB5\xB5\xF2\xB5\xBB\xA7\xF6\xA3\xB0\xB0\xA9\xFB\xB9\xA5\xBB\xBC\x95\x95\x8D\x91\xCA",185), 4)
			_0xF3D70D19(_0xD7C0DE("\x9E\x8D\x9D\x99\x81\x86\x8C\x9D\x91\x85\xF7\xB6\xB6\xAE\xFB\xBF\xB2\xB0\xB9\x89\x86\x97\x91\x81\x81\xC8",204), "\x65\x72\x72")
			return
		end
		if not _0x6615D7C6(_0x9B5D3AC3, _0xA65709AD) then
			_0x55FD6618(_0x9B5D3AC3 .. _0xD7C0DE("\xC0\x8A\x87\x9A\xC4\x86\x87\x89\x86\x86\x9E\xCB\x8D\x8E\x8D\x8A\x83\x82\xD2\x87\x9C\x9C\x85\xD7\x8B\x9A\x88\x92\x8C\x89\xD0",223), 4)
			_0xF3D70D19(_0xD7C0DE("\xCC\xED\xEC\xF5\xE2\xE1\xB3\xF0\xF0\xF8\xFE\xFD\xFD\xBA\xFD\xF3\xEF\xBE\xEC\xC3\xD3\xCB\xD3\xD0\x85\xCF\xC3\x88",140) .. _0xA65709AD, "\x65\x72\x72")
			return
		end
		_0x93455B9A(true)
		_0xF3D70D19(_0xD7C0DE("\x22\x00\x12\x04\x00\x00\x04\x0C\x4C\x1E\x0D\x1D\x19\x01\x06\x53\x12\x07\x19\x1A\x58\x0A\x1F\x09\x0A\x18\x0C\x51\xAE\xAF",99), "\x77\x6F\x72\x6B")
		task.spawn(function()
	local _0x7874F32C = _0x8F4F9B2D(_0xB2348B79, _0xA65709AD)
	if _0x7874F32C then
		_0x55FD6618(_0xD7C0DE("\xC5\xF4\xEA\xF0\xEA\xEF\xBC\xF1\xF1\xFE\xC4\xC4\xC6\x83\xD7\xD0\xC5\xC4\xCD\xDA\xD9\xCD\xD9\xC1\xC2\xD6\x91",149), 4)
		_0x3C8CF99E(_0xB2348B79)
		_0x66405E8F:Destroy()
		if _0xBF63378A then
			_0xBF63378A()
		end
	else
		_0x55FD6618(_0xD7C0DE("\x77\x53\x5A\x58\x50\x52\x17\x4C\x56\x1A\x57\x53\x5C\x5A\x1F\x33\x22\x30\x2A\x34\x31\x68\x67\x0B\x21\x2F\x28\x27\x6D\x37\x20\x25\x23\x72\x38\x31\x2C\x76\x78\x78\x2A\x3F\x29\x2A\x38\x2C\x71",48), 5)
		_0x93455B9A(false)
		if _0x66405E8F.Parent ~= nil then
			_0xF3D70D19(_0xD7C0DE("\x0C\x2A\x25\x21\x2B\x2B\x70\x25\x3D\x73\x38\x3A\x37\x33\x78\x2A\x39\x29\x35\x2D\x2A\x71\x40\x31\x0E\x06\x05\x16\x03\x47\x1C\x1B\x13\x4B\x0D\x0A\x0F\x06\x1E\x5F",73), "\x65\x72\x72")
		end
	end
end)
	end
	_0xD5F9CF73("")
	_0xF3D70D19("", "\x69\x64\x6C\x65")
	_0x9625955B.MouseEnter:Connect(function()
	_0x903CE401(_0x9625955B, {BackgroundTransparency = 0.93999999999999995}, 0.14999999999999999)
end)
	_0x9625955B.MouseLeave:Connect(function()
	_0x903CE401(_0x9625955B, {BackgroundTransparency = 1}, 0.14999999999999999)
end)
	_0x9625955B.MouseButton1Click:Connect(function()
	_0x66405E8F:Destroy()
end)
	_0x1B6E4.MouseEnter:Connect(function()
	_0x903CE401(_0x1B6E4, {BackgroundTransparency = 0.90000000000000002}, 0.14999999999999999)
end)
	_0x1B6E4.MouseLeave:Connect(function()
	_0x903CE401(_0x1B6E4, {BackgroundTransparency = 0.94999999999999996}, 0.14999999999999999)
end)
	_0x5817145.MouseEnter:Connect(function()
	if _0xB6353622 then
		return
	end
	_0x903CE401(_0x6B71DEB5, {BackgroundTransparency = 0.88}, 0.14999999999999999)
end)
	_0x5817145.MouseLeave:Connect(function()
	_0x903CE401(_0x6B71DEB5, {BackgroundTransparency = 1}, 0.14999999999999999)
end)
	_0x5817145.MouseButton1Click:Connect(_0x6EA2F495)
	pcall(function()
	_0x72929474:GetPropertyChangedSignal("\x54\x65\x78\x74"):Connect(function()
	_0xD5F9CF73(_0x72929474.Text)
end)
end)
	_0x72929474.Focused:Connect(function()
	_0x903CE401(_0xB47CAEAC, {Transparency = 0.34999999999999998}, 0.14999999999999999)
end)
	_0x72929474.FocusLost:Connect(function(_0x21253048)
	_0x903CE401(_0xB47CAEAC, {Transparency = 0.92000000000000004}, 0.14999999999999999)
	if _0x21253048 then
		_0x6EA2F495()
	end
end)
	_0x1B6E4.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(_0xE747FF06)
		_0x40E56A08:SetCore(_0xD7C0DE("\x3F\x08\x00\x0B\x3E\x1E\x06\x1A\x12\x1C\x15\x16\x0C\x10\x15\x15",107), {Title = _0x236A013B, Text = _0xD7C0DE("\xE3\xC0\xD2\x87\xE3\xCC\xD3\x8B\xC0\xC4\xC0\xC4\x90\xD2\xDD\xC3\xDD\xD0\xD2\x97\xCC\xD6\x9A\xD8\xD0\xD4\xCE\xDD\xAF\xA0\xB0\xA7",163), Duration = 5})
	else
		_0x40E56A08:SetCore(_0xD7C0DE("\xB7\x80\x88\x83\xA6\x86\x9E\x82\x8A\x84\x8D\x8E\x84\x98\x9D\x9D",227), {Title = _0x236A013B, Text = _0xD7C0DE("\xA0\x9E\x82\x8B\x9C\x9E\x84\x9E\xCD\x8A\x80\x95\x82\xD2\x9D\x9B\x81\xD6\x84\x8D\x89\x8A\x94\x8E\x89\xDE\x9C\x6C\x68\x72\x61\x6B\x64\x74\x63\x26\x29\x45\x7B\x69\x63\x2E\x62\x71\x7F\x67\x72\x78\x79\x6F\x2D\x38",228) .. _0xE747FF06, Duration = 5})
	end
	_0xF3D70D19(_0xD7C0DE("\x1C\x24\x30\x38\x77\x1F\x3C\x2E\x7B\x17\x38\x27\x7F\x10\x00\x05\x06\x44\x0C\x08\x47\x11\x06\x1F\x19\x4C\x0F\x1C\x00\x07\x02\x17\x01\x58\x55\x02\x1F\x1D\x17\x5A\x0B\x1D\x0E\x0A\x1A\xA0\xF5\xEA\xE6\xA4\xC3\xD4\xC2\xCD\xA6\xDA\xD9\xC9\xC0\xAE\xE4\xF5\xE8\xB2\xFB\xF1\xE7\xF3\xB9",82))
end)
	_0x903CE401(_0xF9BDB8EE, {Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.28000000000000003)
	_0x903CE401(_0xF3392371, {Scale = 1}, 0.28000000000000003)
	pcall(function()
	task.delay(0.32000000000000001, function()
	pcall(function()
	_0x72929474:CaptureFocus()
end)
end)
end)
	return _0x66405E8F
end
local function _0x87C9FAA()
	print(_0xD7C0DE("\xD2\xC8\xE7\xE3\xF5\xC6\xFA\xF2\xCC\xB2\xDA\xFA\xFC\xE2\xFE\xF9\xF5\xF3\xE1\xF5\xF3\xF9\xB1\x8E\x8F",136))
	local _0xC2C0A9C7 = _0x47939B6A()
	if _0xC2C0A9C7 and _0xC2C0A9C7 ~= "" then
		local _0x72E1A4F2 = _0xA6EC27A7(_0xC2C0A9C7)
		if _0x72E1A4F2 then
			local _0xD6DFC5A5 = _0xDB3D0AFE(_0x72E1A4F2)
			if _0xD6DFC5A5 and _0x6615D7C6(_0x72E1A4F2, _0xD6DFC5A5) then
				print(_0xD7C0DE("\x5C\x4A\x65\x65\x73\x44\x78\x6C\x52\x30\x57\x7D\x66\x7A\x71\x36\x64\x79\x6F\x7F\x7F\x3C\x76\x7B\x66\x0C\x01\x43\x57\x50\x40\x4B\x57\x5C\x40\x44\x4C\x0C\x4C\x5B\x5B\x5F\x1C\x5E\x5C\x53\x5C\x58\x19\x16\x17",6))
				local _0xC0C29811, _0x560A1577 = pcall(function()
	return _0x8F4F9B2D(_0xC2C0A9C7, _0xD6DFC5A5)
end)
				if _0xC0C29811 and _0x560A1577 then
					_0x40E56A08:SetCore(_0xD7C0DE("\xCD\xFA\xCE\xC5\xEC\xCC\xD0\xCC\xC0\xCE\xCB\xC8\xDE\xC2\xC3\xC3",157), {Title = _0x236A013B, Text = _0xD7C0DE("\x84\xB3\xB3\xA7\xE4\xA6\xA4\xAB\xA4\xA0\xEF\xA3\xA4\xB1\xB0\xB1\xA6\xA5\xF6\xF8\x9C\xB4\xB1\xB3\xA4\xF0",196), Duration = 3})
					return
				else
					print(_0xD7C0DE("\xD5\xCD\xFC\xFE\xEA\xDB\xE1\xF7\xCB\xB7\xD9\xEC\xEE\xF4\xB1\xF1\xF1\xF8\xC9\xCF\x82\xC5\xC5\xCC\xCA\xC2\xCC\x93\x8A",141) .. tostring(_0x560A1577 or _0xD7C0DE("\x65\x43\x58\x4E\x5C\x58\x56\x13\x5F\x50\x4F",43)))
					_0xD46FA369()
					_0x40E56A08:SetCore(_0xD7C0DE("\x43\x74\x7C\x77\x5A\x7A\x62\x7E\x7E\x70\x79\x7A\x68\x74\x71\x71",15), {Title = _0x236A013B, Text = _0xD7C0DE("\x0F\x3C\x28\x3A\x04\x41\x09\x06\x1D\x45\x03\x1F\x18\x00\x18\x0E\x08\x4D\x01\x1D\x50\x18\x1C\x05\x15\x19\x1F\x13\x56\x59\x2A\x17\x19\x1C\x0D\x1A\xA0\xE4\xEC\xF7\xE1\xF7\xA6\xE6\xA8\xE7\xEF\xFC\xAC\xE6\xEB\xF6\xBE",91), Duration = 5})
				end
			else
				_0xD46FA369()
			end
		else
			_0xD46FA369()
		end
	end
	print(_0xD7C0DE("\x86\x9C\xB3\x8F\x99\xAA\x96\x86\xB8\xC6\xA8\x98\x8C\x84\x82\x82\x8A\xCE\x84\x95\x88\xD2\x80\x8D\x86\x82\x92\x95\xD9\xAF\xB2\xD2\xD3\xD0",220))
	_0x5268F9A3(function()
end)
end
_0x87C9FAA()
