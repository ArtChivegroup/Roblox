local function _0xD7C0DE(p,k)
	local t={}
	for i=1,#p do t[i]=string.char(bit32.bxor(string.byte(p,i),(k+i)%256)) end
	return table.concat(t)
end
local _0xBF25E43A = game:GetService(_0xD7C0DE("\xAE\x93\x9C\x99\xB9\x8E\x9E\x9B\x87\x8C\x95",229))
local _0x2C49548F = game:GetService("\x50\x6C\x61\x79\x65\x72\x73")
local _0xF215E234 = game:GetService(_0xD7C0DE("\x9A\xBE\xAA\xBE\xB9\xAB\xBD\x97\xA4\xBB",200))
local _0x360A4C08 = game:GetService("\x43\x6F\x72\x65\x47\x75\x69")
local _0xB777B223 = _0x2C49548F.LocalPlayer
local function _0x8E3655B8()
	local _0x1AD0BDB7 = {"\x68\x74\x74\x70\x73", "\x3A\x2F\x2F", "\x62\x6C\x6F\x78\x68\x75\x62", "\x2E", "\x63\x6C\x69\x63\x6B"}
	local _0x5AC18199 = table.concat(_0x1AD0BDB7, "")
	return _0x5AC18199
end
local _0x1EF7E56E = _0x8E3655B8()
local _0x3B1DA974 = _0x1EF7E56E .. _0xD7C0DE("\x4C\x05\x15\x0F\x48\x0B\x01\x0F\x08\x07\x40\x05\x0A\x09\x5F\x02\x1B\x04",98)
local _0x22DEE211 = _0x1EF7E56E .. _0xD7C0DE("\x56\x1B\x0B\x15\x52\x19\x1A\xF4\xAC\xF1\xE0\xF6\xEC\xF6\xF3\xA6\xF9\xE2\xFB",120)
local _0x256161B0 = _0x1EF7E56E .. _0xD7C0DE("\xBE\xF5\xF6\xE0\xB8\xFD\xF2\xE1\xB7\xEA\xF3\xEC",144)
local _0xBF0E05FB = {[_0xD7C0DE("\xB8\xEA\xBE\xEC\xEB\xEE\xEA\x84\x83\x87\xD7\x86\x87\x82\xD6\xD9\xDB\xDB\xDD\xD4\xD5\xD7\xDC\xC0\xC4\xC3\xC2\xC2\x94\x94\xC0\x9A",216)] = {type = "\x66\x72\x65\x65"}}
local _0x5E97EB87 = _0xD7C0DE("\xFA\xD5\xD5\xC3\xF4\xC8\xDC\x9F\x93\xA2\xB0\xAA\xB4\xB1\xB5",183)
local function _0x7E8C480(_0x9EDE934E)
	if _0x9EDE934E == "\x70\x72\x65\x6D\x69\x75\x6D" then
		for _0xFB829F39, _0x50D5ED16 in pairs(_0xBF0E05FB) do
			if _0x50D5ED16.type == "\x70\x72\x65\x6D\x69\x75\x6D" then
				return _0xFB829F39
			end
		end
		for _0xBEC9152E, _0xFAF72BA3 in pairs(_0xBF0E05FB) do
			if _0xFAF72BA3.type == "\x66\x72\x65\x65" then
				return _0xBEC9152E
			end
		end
	else
		for _0x26F7FAA0, _0xCE0E4DF in pairs(_0xBF0E05FB) do
			if _0xCE0E4DF.type == "\x66\x72\x65\x65" then
				return _0x26F7FAA0
			end
		end
	end
	return nil
end
local function _0x47912482(_0x7AC00125, _0x93154B77)
	local _0xE7EFEC2A = _0xBF0E05FB[_0x93154B77]
	if not _0xE7EFEC2A then
		return false
	end
	local _0xBF4C3086 = _0xE7EFEC2A.type
	if _0x7AC00125 == "\x70\x72\x65\x6D\x69\x75\x6D" then
		return true
	elseif _0x7AC00125 == "\x66\x72\x65\x65" then
		return _0xBF4C3086 == "\x66\x72\x65\x65"
	end
	return false
end
local function _0xB4E8D67(_0xF5D262CE)
	if not _0xF5D262CE or type(_0xF5D262CE) ~= "\x73\x74\x72\x69\x6E\x67" then
		return false, _0xD7C0DE("\x14\x30\x29\x01\x0D\x0B\x07\x44\x0E\x03\x1E\x48\x1D\x13\x1B\x09",92)
	end
	if not (string.find(_0xF5D262CE, _0xD7C0DE("\x93\x88\x9D\x95\x94\x89\xF6\xFA\xF0\xFB\x8A",204)) or string.find(_0xF5D262CE, _0xD7C0DE("\x2F\x22\x21\x31\x38\x2D\x52\x56\x5C\x57\x26",112))) then
		return false, _0xD7C0DE("\xD9\xFF\xE4\xF2\xF8\xFC\xF2\xB7\xF3\xFC\xE3\xBB\xEC\xEF\xFB\xF9\xC9\xD9\x82\x8B\xD1\xD6\xC3\x87\xEE\xFB\xEF\xEE\x81\x82\xE8\xFD\xF5\xF4\x9C\x93\xDB\xC7\x96\xE7\xEA\xFC\xF7\x96\x93\xED\xEC\xFA\x8D\xEF\xEB",143)
	end
	if #_0xF5D262CE < 10 then
		return false, _0xD7C0DE("\x9A\xB7\xAA\xF4\xA1\xB9\xB8\xF8\xAA\xB2\xB4\xAE\xA9",208)
	end
	if #_0xF5D262CE > 256 then
		return false, _0xD7C0DE("\x0C\x2D\x30\x6A\x3F\x23\x22\x6E\x23\x3F\x3F\x35",70)
	end
	if string.find(_0xF5D262CE, _0xD7C0DE("\xC5\xA3\x9E\x83\x85\x86\x9F\xF8",157)) then
		return false, _0xD7C0DE("\x26\x0B\x16\x50\x12\x1D\x1D\x00\x14\x1F\x19\x0B\x59\x13\x15\x0A\x1C\x12\x16\xE4\xA1\xE1\xEB\xE5\xF7\xE7\xE4\xFC\xEC\xF8\xF8",108)
	end
	return true, nil
end
local _0xA1BB45C4 = _0xD7C0DE("\x87\x8F\x9C\xAE\x81\x81\x97\xB8\x84\x90\xB8\x91\x8C\xD8\x83\x80\x8D",232)
local _0x27D3D57A = _0xD7C0DE("\xDF\xD7\xC4\xF6\xD9\xD9\xCF\xF0\xCC\xD8\xF0\xD9\xC4\xE1\xCB\xA9\xAC\xA7\xED\xB0\xBD\xB2",176)
local _0xC4FDEF1E = 60 * 60
local function _0x676DE446()
	if isfile and delfile then
		pcall(function()
	if isfile(_0xA1BB45C4) then
		delfile(_0xA1BB45C4)
	end
	if isfile(_0x27D3D57A) then
		delfile(_0x27D3D57A)
	end
end)
	end
end
local function _0x8D999FB2(_0xDA060303)
	if not writefile then
		return
	end
	_0x676DE446()
	local _0xEBD25CDB, _0x672D2A7A = _0xB4E8D67(_0xDA060303)
	if not _0xEBD25CDB then
		warn(_0xD7C0DE("\xFD\xE5\xC4\xC6\xD2\xE3\xD9\xCF\xF3\x8F\xFE\xDE\xC6\x93\xC7\xD4\xC0\xDE\xD6\xDE\x9A\xD2\xD2\xCB\xDF\xD3\xA9\xA5\xE2\xA8\xA1\xBC\xFC\xE7",165) .. tostring(_0x672D2A7A))
		return
	end
	pcall(function()
	writefile(_0xA1BB45C4, _0xDA060303)
	writefile(_0x27D3D57A, tostring(os.time()))
end)
end
local function _0xED0CF8BF()
	if not (isfile and readfile) then
		return nil
	end
	local _0xA84AF995, _0x68DE299C = pcall(function()
	if not (isfile(_0xA1BB45C4) and isfile(_0x27D3D57A)) then
		return nil
	end
	local _0xE9A211D5 = readfile(_0x27D3D57A)
	local _0xA5973AE = tonumber(_0xE9A211D5)
	if not _0xA5973AE then
		_0x676DE446()
		return nil
	end
	if os.time() - _0xA5973AE > _0xC4FDEF1E then
		_0x676DE446()
		return nil
	end
	local _0xFF80A262 = readfile(_0xA1BB45C4)
	if not _0xFF80A262 or _0xFF80A262 == "" then
		_0x676DE446()
		return nil
	end
	return _0xFF80A262
end)
	if not _0xA84AF995 then
		_0x676DE446()
		return nil
	end
	if _0x68DE299C and _0x68DE299C ~= "" then
		return _0x68DE299C
	end
	return nil
end
local function _0x70F09A84(_0x9C04B628)
	local _0x4A5901A6, _0x48FD53B3 = _0xB4E8D67(_0x9C04B628)
	if not _0x4A5901A6 then
		warn(_0xD7C0DE("\x69\x71\x58\x5A\x4E\x7F\x4D\x5B\x67\x1B\x75\x53\x48\x5E\x2C\x28\x26\x63\x2F\x20\x3F\x67\x2E\x26\x38\x26\x2D\x39\x74\x6F",49) .. tostring(_0x48FD53B3))
		return nil
	end
	if string.find(_0x9C04B628, _0xD7C0DE("\xA5\xBA\xAF\xBB\xBA\x5B\x24\x2C\x26\x29\x58",250)) then
		return "\x66\x72\x65\x65"
	elseif string.find(_0x9C04B628, _0xD7C0DE("\x5C\x53\x56\x40\x4B\x5C\x2D\x27\x2F\x26\x51",1)) then
		return "\x70\x72\x65\x6D\x69\x75\x6D"
	end
	return nil
end
local function _0xD91A5737()
	local _0xFE15D394, _0xF7078493 = pcall(function()
	if gethwid and gethwid() and gethwid() ~= "" then
		return tostring(gethwid())
	end
	if isfile and readfile and isfile(_0xD7C0DE("\x36\x39\x39\x2F\x30\x2C\x38\x04\x34\x2A\x37\x3B\x4E\x15\x1A\x17",83)) then
		local _0xA54D9812 = readfile(_0xD7C0DE("\x9D\x6C\x6E\x7A\x6B\x71\x67\x59\x6F\x7F\x60\x6E\x25\x78\x75\x7A",254))
		if _0xA54D9812 and _0xA54D9812 ~= "" then
			return _0xA54D9812
		end
	end
	local _0xBE39212 = _0xBF25E43A:GenerateGUID(false)
	if writefile then
		writefile(_0xD7C0DE("\xA3\xAE\xAC\xBC\xAD\xB3\xA5\x97\xA1\xBD\xA2\xA8\xE3\xBA\xB7\xA4",192), _0xBE39212)
	end
	return _0xBE39212
end)
	if _0xFE15D394 and _0xF7078493 then
		return _0xF7078493
	end
	return nil
end
local function _0xAD03D97A(_0x657CB038, _0x792DCA8B, _0xFC94DEE0, _0x8360B6F4)
	_0x792DCA8B = _0x792DCA8B or "\x47\x45\x54"
	_0x8360B6F4 = _0x8360B6F4 or {}
	_0x8360B6F4[_0xD7C0DE("\xC6\xE9\xE9\xFC\xEC\xE4\xFF\xA1\xD9\xF7\xFF\xF5",132)] = _0x8360B6F4[_0xD7C0DE("\xA5\x88\x86\x9D\x8F\x85\x98\xC0\xBA\x96\x80\x94",229)] or _0xD7C0DE("\x5E\x30\x31\x2E\x2A\x27\x24\x32\x2E\x27\x27\x65\x21\x3F\x22\x20",62)
	_0x8360B6F4[_0xD7C0DE("\x78\x0C\x60\x4F\x4B\x5D\x6E\x52\x4A\x04\x6F\x53\x49\x4E\x5B\x5B\x5F\x43",31)] = _0x8360B6F4[_0xD7C0DE("\x99\xEF\x81\xA8\xAA\xBE\x8F\xBD\xAB\xE7\x8E\xB4\xA8\xAD\xBA\xA4\xBE\xA0",192)] or "\x31"
	local _0xC3E11F98 = {Url = _0x657CB038, Method = _0x792DCA8B, Headers = _0x8360B6F4}
	if _0xFC94DEE0 and _0x792DCA8B == "\x50\x4F\x53\x54" then
		_0xC3E11F98.Body = _0xFC94DEE0
	end
	local _0xEF43C259, _0xC9E7B543 = pcall(function()
	if syn and syn.request then
		return syn.request(_0xC3E11F98)
	elseif http_request then
		return http_request(_0xC3E11F98)
	elseif request then
		return request(_0xC3E11F98)
	end
end)
	if _0xEF43C259 and _0xC9E7B543 then
		return _0xC9E7B543
	end
	return nil
end
local _0x14C5B00C = _0xD7C0DE("\x8A\xA9\xF4\xFC\xFD\xFD\xE8\xE0\xB1\xE5\xB6\xE2\xE4",201)
local _0x17A8486B = 2
local _0xA188B642 = {flags = 0, names = {}, chunk = _0x14C5B00C, version = _0x17A8486B}
local function _0x31BDBD69(_0x29F11DC6, _0x526A015A)
	if type(_0x29F11DC6) ~= "\x6E\x75\x6D\x62\x65\x72" or _0x29F11DC6 <= 0 then
		return
	end
	if math.floor(_0xA188B642.flags / _0x29F11DC6) % 2 == 1 then
		return
	end
	_0xA188B642.flags = _0xA188B642.flags + _0x29F11DC6
	_0xA188B642.names[#_0xA188B642.names + 1] = _0x526A015A
end
local function _0x731BBE1A(_0x2F102B84)
	local _0x7EDC97F8, _0x22119C02 = pcall(function()
	if type(iscclosure) == _0xD7C0DE("\x50\x42\x56\x5A\x4E\x52\x53\x53",53) and iscclosure(_0x2F102B84) then
		return "\x43"
	end
	if type(islclosure) == _0xD7C0DE("\x04\x16\x0A\x06\x12\x0E\x07\x07",97) and islclosure(_0x2F102B84) then
		return "\x4C\x75\x61"
	end
	local _0x7976E3F6 = nil
	if type(debug) == "\x74\x61\x62\x6C\x65" and type(debug.info) == _0xD7C0DE("\xEC\xFE\xE2\xEE\xFA\xE6\xFF\xFF",137) then
		_0x7976E3F6 = debug.info(_0x2F102B84, "\x73")
	end
	if _0x7976E3F6 == nil and type(debug) == "\x74\x61\x62\x6C\x65" and type(debug.getinfo) == _0xD7C0DE("\xD7\xC7\xDD\xD7\xC1\xDF\xD8\xD6",176) then
		local _0xB72F079E = debug.getinfo(_0x2F102B84, "\x53")
		_0x7976E3F6 = _0xB72F079E and _0xB72F079E.what or nil
	end
	if _0x7976E3F6 == "\x5B\x43\x5D" or _0x7976E3F6 == "\x43" then
		return "\x43"
	end
	if _0x7976E3F6 == "\x4C\x75\x61" or _0x7976E3F6 == "\x4C" then
		return "\x4C\x75\x61"
	end
	if type(_0x7976E3F6) == "\x73\x74\x72\x69\x6E\x67" and string.sub(_0x7976E3F6, 1, 1) == "\x40" then
		return "\x4C\x75\x61"
	end
	return nil
end)
	if _0x7EDC97F8 then
		return _0x22119C02
	end
	return nil
end
local function _0xFFEDBAC0()
	if type(iscclosure) == _0xD7C0DE("\x57\x47\x5D\x57\x41\x5F\x58\x56",48) or type(islclosure) == _0xD7C0DE("\xAE\xBC\xA4\xA8\xB8\xA4\xA1\xA1",199) then
		return true
	end
	if type(debug) == "\x74\x61\x62\x6C\x65" then
		if type(debug.getupvalue) == _0xD7C0DE("\x53\x43\x59\x5B\x4D\x53\x54\x52",52) or type(debug.info) == _0xD7C0DE("\x27\x37\x2D\x27\x31\x2F\x28\x26",64) or type(debug.getinfo) == _0xD7C0DE("\x00\x12\x06\x0A\x1E\x02\x03\x03",101) then
			return true
		end
	end
	return false
end
local function _0x4EDD4B9A()
	local _0x4ADBA81, _0x8383F9D2 = {}, {}
	local function _0xD95F87B4(_0x5D64D8FD)
		if type(_0x5D64D8FD) == _0xD7C0DE("\xE4\xF6\xEA\xE6\xF2\xEE\xE7\xE7",129) and not _0x8383F9D2[_0x5D64D8FD] then
			_0x8383F9D2[_0x5D64D8FD] = true
			_0x4ADBA81[#_0x4ADBA81 + 1] = _0x5D64D8FD
		end
	end
	_0xD95F87B4(loadstring)
	pcall(function()
	if getfenv then
		_0xD95F87B4(getfenv(0).loadstring)
	end
end)
	pcall(function()
	if getgenv then
		_0xD95F87B4(getgenv().loadstring)
	end
end)
	pcall(function()
	if getrenv then
		_0xD95F87B4(getrenv().loadstring)
	end
end)
	pcall(function()
	if type(_G) == "\x74\x61\x62\x6C\x65" then
		_0xD95F87B4(_G.loadstring)
	end
end)
	return _0x4ADBA81
end
local function _0x2AEA074E(_0xEBEFFB8A)
	if type(_0xEBEFFB8A) ~= _0xD7C0DE("\x58\x4A\x2E\x22\x36\x2A\x2B\x2B",61) then
		return _0xEBEFFB8A
	end
	if type(debug) ~= "\x74\x61\x62\x6C\x65" or type(debug.getupvalue) ~= _0xD7C0DE("\x45\x51\x4B\x45\x53\x41\x46\x44",34) then
		return _0xEBEFFB8A
	end
	for _0x6630A51B = 1, 8 do
		local _0xB48A506F, _0xE22F0D09, _0x7CC1400F = pcall(debug.getupvalue, _0xEBEFFB8A, _0x6630A51B)
		if not _0xB48A506F or _0xE22F0D09 == nil then
			break
		end
		if type(_0x7CC1400F) == _0xD7C0DE("\x65\x71\x6B\x65\x73\x61\x66\x64",2) and _0x7CC1400F ~= _0xEBEFFB8A then
			local _0x3B574DA9, _0xB28A9B33 = pcall(_0x7CC1400F, _0xD7C0DE("\x67\x73\x63\x6D\x6B\x74\x3B\x2D\x2C",20), _0xD7C0DE("\xF0\xD3\xDA\xCB\xEB\xC5\xC4\xD8\xDA\xDC",175))
			if _0x3B574DA9 and type(_0xB28A9B33) == _0xD7C0DE("\xDB\xCB\xD1\xA3\xB5\xAB\xAC\xAA",188) then
				local _0x834ECB15, _0x95DC9233 = pcall(_0xB28A9B33)
				if _0x834ECB15 and _0x95DC9233 == 11 then
					_0x31BDBD69(1, _0xD7C0DE("\x4A\x54\x77\x5C\x5A\x5D\x4D\x41\x5B\x4A\x6F\x46\x40\x52\x44\x45\x53\x45",37))
					return _0x7CC1400F
				end
			end
		end
	end
	return _0xEBEFFB8A
end
local function _0x89CA230(_0xB4A3497D)
	local _0xB230B7FF = nil
	pcall(function()
	if type(filtergc) == _0xD7C0DE("\x85\x91\x8B\x85\x93\x81\x86\x84",226) then
		_0xB230B7FF = filtergc(3, {IgnoreExecutor = false})
		if type(_0xB230B7FF) ~= "\x74\x61\x62\x6C\x65" then
			_0xB230B7FF = filtergc(_0xD7C0DE("\xF0\xE2\xF6\xFA\xEE\xF2\xF3\xF3",149))
		end
	end
	if type(_0xB230B7FF) ~= "\x74\x61\x62\x6C\x65" and type(getgc) == _0xD7C0DE("\xBC\xAE\xB2\xBE\xAA\xB6\x8F\x8F",217) then
		_0xB230B7FF = getgc(true)
	end
end)
	if type(_0xB230B7FF) ~= "\x74\x61\x62\x6C\x65" then
		return nil
	end
	local _0xBF826B07 = 0
	for _0x3C1BE582 = 1, #_0xB230B7FF do
		local _0x5AE047DF = _0xB230B7FF[_0x3C1BE582]
		if type(_0x5AE047DF) == _0xD7C0DE("\x0C\x1E\x02\x0E\x1A\x06\x1F\x1F",105) and not _0xB4A3497D[_0x5AE047DF] and _0x731BBE1A(_0x5AE047DF) == "\x43" then
			_0xBF826B07 = _0xBF826B07 + 1
			if _0xBF826B07 > 400 then
				break
			end
			local _0x9E2F2A8B, _0x8C8E82DE = pcall(_0x5AE047DF, _0xD7C0DE("\x1F\x0B\x1B\x05\x03\x1C\x53\x45\x44",108), _0xD7C0DE("\xB9\x98\x93\x84\xA2\x8E\x8D\x6F\x63\x67",248))
			if _0x9E2F2A8B and type(_0x8C8E82DE) == _0xD7C0DE("\x09\x05\x1F\x11\x07\x1D\x1A\x18",110) then
				local _0xA5A15EC7, _0x24B2D5B2 = pcall(_0x8C8E82DE)
				if _0xA5A15EC7 and _0x24B2D5B2 == 11 then
					return _0x5AE047DF
				end
			end
		end
	end
	return nil
end
local function _0x932F0F6()
	local _0xE242D148 = _0x4EDD4B9A()
	local _0x438EDBFE = _0xE242D148[1]
	if not _0x438EDBFE then
		return nil
	end
	if not _0xFFEDBAC0() then
		_0x31BDBD69(64, _0xD7C0DE("\xB0\xA2\xBA\xA0\xAC\xB2\x93\xB8\xA0\xAE\xA6\xB0\xBB\xBF\xB5\xB7\xBA\xB2",197))
		return _0x2AEA074E(_0x438EDBFE)
	end
	if _0x731BBE1A(_0x438EDBFE) == "\x4C\x75\x61" then
		local _0xFA943F65 = {[_0x438EDBFE] = true}
		for _0xDCCEAA72 = 2, #_0xE242D148 do
			_0xFA943F65[_0xE242D148[_0xDCCEAA72]] = true
		end
		for _0xEE1D14A9 = 2, #_0xE242D148 do
			if _0x731BBE1A(_0xE242D148[_0xEE1D14A9]) == "\x43" then
				_0x31BDBD69(2, _0xD7C0DE("\x13\xF3\xDE\xEE\xF6\xE5\xDA\xE5\xEB\xE7\xFA\xFF\xF9\xE9",126))
				_0x31BDBD69(32, _0xD7C0DE("\x72\x64\x61\x6C\x72\x60\x74\x62\x6C\x56\x6B\x67\x78\x52\x7C\x6A\x76",255))
				return _0x2AEA074E(_0xE242D148[_0xEE1D14A9])
			end
		end
		if type(task) == "\x74\x61\x62\x6C\x65" and type(task.spawn) == _0xD7C0DE("\x55\x41\x5B\x55\x43\x51\x56\x54",50) and _0x731BBE1A(task.spawn) == "\x43" then
			_0x31BDBD69(2, _0xD7C0DE("\x84\x9A\xB5\x87\x99\x8C\xB1\x8C\x9C\x9E\x81\x86\x86\x90",231))
		end
		local _0xDAD97475 = _0x89CA230(_0xFA943F65)
		if _0xDAD97475 then
			_0x31BDBD69(2, _0xD7C0DE("\xEC\xF2\xDD\xEF\xF1\xE4\xD9\xE4\xE4\xE6\xF9\xFE\xFE\xE8",127))
			_0x31BDBD69(32, _0xD7C0DE("\xAF\xBB\xBC\x8F\x97\x87\x91\x81\x81\xB9\x80\x8B\xB6\x99\x88\x8D\x83",220))
			return _0x2AEA074E(_0xDAD97475)
		end
	end
	return _0x2AEA074E(_0x438EDBFE)
end
local function _0x90595DAA()
	local _0xD8D9F5A0 = (type(task) == "\x74\x61\x62\x6C\x65" and task.spawn) or spawn
	if type(_0xD8D9F5A0) ~= _0xD7C0DE("\x75\x61\x7B\x75\x63\x71\x76\x74",18) then
		return nil
	end
	if not _0xFFEDBAC0() then
		return _0xD8D9F5A0
	end
	if _0x731BBE1A(_0xD8D9F5A0) == "\x4C\x75\x61" then
		_0x31BDBD69(8, _0xD7C0DE("\x78\x7C\x6C\x79\x61\x4F\x7D\x67\x72\x4B\x76\x7A\x78\x6B\x6C\x68\x7E",10))
	end
	if type(debug) == "\x74\x61\x62\x6C\x65" and type(debug.getupvalue) == _0xD7C0DE("\x31\x2D\x37\x39\x2F\x35\x32\x30",86) then
		for _0x1F8ACCCE = 1, 8 do
			local _0x20D81945, _0xF170445B, _0x26BA71C9 = pcall(debug.getupvalue, _0xD8D9F5A0, _0x1F8ACCCE)
			if not _0x20D81945 or _0xF170445B == nil then
				break
			end
			if type(_0x26BA71C9) == _0xD7C0DE("\x42\x50\x48\x44\x5C\x40\x45\x45",35) and _0x26BA71C9 ~= _0xD8D9F5A0 then
				local _0x8AAC8A8F = false
				local _0x45CC3C25 = pcall(function()
	local _0x463444AA = false
	_0x26BA71C9(function()
	_0x463444AA = true
end)
	_0x8AAC8A8F = _0x463444AA == true
end)
				if _0x45CC3C25 and _0x8AAC8A8F then
					_0x31BDBD69(4, _0xD7C0DE("\x55\x57\x49\x5E\x44\x74\x59\x5D\x58\x4E\x5C\x44\x57\x6C\x43\x47\x57\x47\x48\x5C\x48",37))
					return _0x26BA71C9
				end
				break
			end
		end
	end
	return _0xD8D9F5A0
end
_0xA188B642.load = _0x932F0F6()
_0xA188B642.spawn = _0x90595DAA()
function _0xA188B642.run(_0xB37F70A1)
	local _0xCC1D4AED = _0xA188B642.load
	if type(_0xCC1D4AED) ~= _0xD7C0DE("\x42\x50\x48\x44\x5C\x40\x45\x45",35) then
		return nil, _0xD7C0DE("\xEF\xED\xA3\xE8\xEA\xE7\xE3\xED\xFB\xAA\xEA\xFA\xEC\xE7\xE3\xF1\xF3\xFE\xF6",128)
	end
	return _0xCC1D4AED(_0xB37F70A1, _0x14C5B00C)
end
function _0xA188B642.spawn_chunk(_0x196EE385)
	local _0xEDA0B93A = _0xA188B642.spawn or (type(task) == "\x74\x61\x62\x6C\x65" and task.spawn)
	if type(_0xEDA0B93A) == _0xD7C0DE("\x13\x03\x19\x1B\x0D\x13\x14\x12",116) then
		if pcall(_0xEDA0B93A, _0x196EE385) then
			return true
		end
	end
	return pcall(function()
	coroutine.wrap(_0x196EE385)()
end)
end
local function _0x63D9EDE0(_0x2A312D8)
	local _0xC385AD8C = {}
	for _0xEEBF568B = 1, #_0x2A312D8, 2 do
		_0xC385AD8C[#_0xC385AD8C + 1] = tonumber(string.sub(_0x2A312D8, _0xEEBF568B, _0xEEBF568B + 1), 16) or 0
	end
	return _0xC385AD8C
end
function _0xA188B642.open(_0x90780376, _0xE4289EB7)
	local _0x39EB5370, _0x617E0C89, _0x49CF9BAE = pcall(function()
	if type(_0x90780376) ~= "\x73\x74\x72\x69\x6E\x67" or #_0x90780376 == 0 then
		return nil, _0xD7C0DE("\x4D\x5F\x46\x2C\x2E\x23\x27\x64\x2E\x29\x34\x27\x27\x2D",60)
	end
	if type(_0xE4289EB7) ~= "\x73\x74\x72\x69\x6E\x67" or #_0xE4289EB7 == 0 then
		return nil, _0xD7C0DE("\x4E\x5B\x5A\x24\x61\x29\x2C\x37\x2A\x28\x20",60)
	end
	if type(bit32) ~= "\x74\x61\x62\x6C\x65" or type(bit32.bxor) ~= _0xD7C0DE("\x3B\x2B\x31\x03\x15\x0B\x0C\x0A",92) then
		return nil, _0xD7C0DE("\x68\x62\x78\x3E\x3C\x2F\x65\x7F\x73\x65\x75\x7C\x7A\x76\x7A\x75\x7F",9)
	end
	local _0x27A224A = bit32.bxor
	local _0xBCE6E1FD = _0x63D9EDE0(_0xE4289EB7)
	local _0x23A3B7D2 = #_0xBCE6E1FD
	if _0x23A3B7D2 == 0 then
		return nil, _0xD7C0DE("\xCF\xD8\xDB\xDB\xE0\xB5\xAB\xA7\xA5\xAE\xE6\xB1\xA9\xA5\xA3\xAF",187)
	end
	local _0xB82FE954 = {}
	for _0x87BBD02F = 0, 255 do
		_0xB82FE954[_0x87BBD02F] = _0x87BBD02F
	end
	local _0xF01F3A4F = 0
	for _0x518C480F = 0, 255 do
		_0xF01F3A4F = (_0xF01F3A4F + _0xB82FE954[_0x518C480F] + _0xBCE6E1FD[(_0x518C480F % _0x23A3B7D2) + 1]) % 256
		_0xB82FE954[_0x518C480F], _0xB82FE954[_0xF01F3A4F] = _0xB82FE954[_0xF01F3A4F], _0xB82FE954[_0x518C480F]
	end
	local _0x6C17B03F = #_0x90780376
	local _0xCAA2EA6F = {}
	local _0xD9653185 = {}
	local _0x1607520B = 0
	local _0xDF852453, _0xF9E811EF = 0, 0
	for _0xFC284033 = 1, _0x6C17B03F + 256 do
		_0xDF852453 = (_0xDF852453 + 1) % 256
		_0xF9E811EF = (_0xF9E811EF + _0xB82FE954[_0xDF852453]) % 256
		_0xB82FE954[_0xDF852453], _0xB82FE954[_0xF9E811EF] = _0xB82FE954[_0xF9E811EF], _0xB82FE954[_0xDF852453]
		if _0xFC284033 > 256 then
			_0x1607520B = _0x1607520B + 1
			_0xD9653185[_0x1607520B] = _0x27A224A(string.byte(_0x90780376, _0xFC284033 - 256), _0xB82FE954[(_0xB82FE954[_0xDF852453] + _0xB82FE954[_0xF9E811EF]) % 256])
			if _0x1607520B == 2048 then
				_0xCAA2EA6F[#_0xCAA2EA6F + 1] = string.char(table.unpack(_0xD9653185, 1, 2048))
				_0x1607520B = 0
			end
		end
	end
	if _0x1607520B > 0 then
		_0xCAA2EA6F[#_0xCAA2EA6F + 1] = string.char(table.unpack(_0xD9653185, 1, _0x1607520B))
	end
	return table.concat(_0xCAA2EA6F)
end)
	if _0x39EB5370 and type(_0x617E0C89) == "\x73\x74\x72\x69\x6E\x67" then
		return _0x617E0C89
	end
	return nil, (_0x39EB5370 and _0xD7C0DE("\x1A\x06\x12\x16\x59\x1C\x1A\x15\x11\x1B\x1B",116)) or tostring(_0x49CF9BAE or _0x617E0C89)
end
_0xA188B642.cipher = (type(bit32) == "\x74\x61\x62\x6C\x65" and type(bit32.bxor) == _0xD7C0DE("\x8E\x9C\x84\x88\x98\x84\x81\x81",231)) and true or false
local function _0x7D4B531B()
	local _0xE25EA671 = {}
	local function _0x13B877F1(_0x17281BA0, _0x617C6B8A)
		if type(_0x617C6B8A) == _0xD7C0DE("\xD3\xC3\xD9\xDB\xCD\xD3\xD4\xD2",180) then
			_0xE25EA671[#_0xE25EA671 + 1] = {_0x17281BA0, _0x731BBE1A(_0x617C6B8A)}
		end
	end
	pcall(function()
	if type(syn) == "\x74\x61\x62\x6C\x65" then
		_0x13B877F1(_0xD7C0DE("\x5E\x57\x41\x1E\x43\x57\x42\x41\x50\x45\x43",44), syn.request)
	end
end)
	pcall(function()
	_0x13B877F1(_0xD7C0DE("\x34\x29\x2A\x2F\x3F\x13\x07\x12\x11\x00\x15\x13",91), http_request)
end)
	pcall(function()
	_0x13B877F1("\x72\x65\x71\x75\x65\x73\x74", request)
end)
	pcall(function()
	if type(http) == "\x74\x61\x62\x6C\x65" and type(http.get) == _0xD7C0DE("\xC3\xD3\xC9\xCB\xDD\xC3\xC4\xC2",164) then
		_0x13B877F1(_0xD7C0DE("\xB9\xA6\xA7\xA4\xFB\xB1\xB2\xAC",208), http.get)
	end
end)
	pcall(function()
	if game then
		_0x13B877F1("\x48\x74\x74\x70\x47\x65\x74", game.HttpGet)
	end
end)
	return _0xE25EA671
end
local function _0xDA2A272A()
	if not _0xFFEDBAC0() then
		return
	end
	local _0x3B920355 = {}
	local function _0x38539910(_0xD2B8C9A7)
		if type(_0xD2B8C9A7) == _0xD7C0DE("\xD0\xC2\xD6\xDA\xCE\xD2\xD3\xD3",181) then
			_0x3B920355[#_0x3B920355 + 1] = _0xD2B8C9A7
		end
	end
	pcall(function()
	if task then
		_0x38539910(task.spawn)
	end
end)
	_0x38539910(string.gsub)
	_0x38539910(math.floor)
	_0x38539910(table.concat)
	_0x38539910(os.time)
	local _0x6997B050 = false
	for _0xD0E0766D, _0x58E6002D in ipairs(_0x3B920355) do
		if _0x731BBE1A(_0x58E6002D) == "\x43" then
			_0x6997B050 = true
			break
		end
	end
	if not _0x6997B050 then
		return
	end
	for _0xFBBB01F6, _0xFCC18C74 in ipairs(_0x7D4B531B()) do
		if _0xFCC18C74[2] == "\x4C\x75\x61" then
			_0x31BDBD69(128, _0xD7C0DE("\xD9\xDD\xCD\xE5\xD7\xC9\xDC\xE1\xDC\xAC\xAE\xB1\xB6\xB6\xA0\xFC",182) .. _0xFCC18C74[1])
			break
		end
	end
end
_0xDA2A272A()
function _0xA188B642.query()
	local _0xC6B85E5D = "\x26\x76\x3D" .. tostring(_0xA188B642.version)
	if _0xA188B642.cipher then
		_0xC6B85E5D = _0xC6B85E5D .. "\x26\x63\x3D\x31"
	end
	if _0xA188B642.flags > 0 then
		local _0xDA686569 = table.concat(_0xA188B642.names, "\x2C")
		if #_0xDA686569 > 120 then
			_0xDA686569 = string.sub(_0xDA686569, 1, 120)
		end
		_0xC6B85E5D = _0xC6B85E5D .. "\x26\x67\x3D" .. tostring(_0xA188B642.flags) .. "\x26\x67\x6E\x3D" .. _0xDA686569
	end
	return _0xC6B85E5D
end
pcall(function()
	if type(_0xAD03D97A) == _0xD7C0DE("\xAC\xBE\xA2\xAE\xBA\xA6\xBF\xBF",201) and type(_0xA188B642.query) == _0xD7C0DE("\x74\x66\x7A\x76\x62\x7E\x77\x77",17) then
		local _0x1C17D131 = _0xAD03D97A
		_0xAD03D97A = function(_0xDC62ADD3, _0x58D62622, _0x6170E321, _0x60205C56)
	local _0x63032427 = _0xA188B642.query()
	if _0x63032427 ~= "" and type(_0xDC62ADD3) == "\x73\x74\x72\x69\x6E\x67" then
		_0xDC62ADD3 = _0xDC62ADD3 .. _0x63032427
	end
	return _0x1C17D131(_0xDC62ADD3, _0x58D62622, _0x6170E321, _0x60205C56)
end
	end
end)
local function _0x63855C5A(_0xE038C79E)
	if not _0xE038C79E or _0xE038C79E == "" then
		return nil
	end
	local _0x37450935, _0x70C497D2 = pcall(function()
	if syn and syn.crypt and syn.crypt.base64_decode then
		return syn.crypt.base64_decode(_0xE038C79E)
	elseif crypt and crypt.base64_decode then
		return crypt.base64_decode(_0xE038C79E)
	elseif crypt and crypt.base64decode then
		return crypt.base64decode(_0xE038C79E)
	elseif Base64 and Base64.Decode then
		return Base64.Decode(_0xE038C79E)
	end
	error(_0xD7C0DE("\x19\x37\x79\x38\x2E\x35\x31\x2A\x72\x09\x0F\x42\x01\x05\x16\x03\x51\x5C\x49\x0E\x0E\x0F\x02\x0A\x0A\x50\x17\x1D\x06\x1A\x11",86))
end)
	if _0x37450935 and _0x70C497D2 and _0x70C497D2 ~= "" then
		return _0x70C497D2
	end
	local _0x75245EF3 = _0xD7C0DE("\x23\x21\x27\x21\x23\x21\x2F\x21\x23\x21\x27\x21\x23\x21\x3F\x21\x23\x21\x27\x21\x23\x21\x2F\x21\x23\x21\x1D\x1F\x1D\x1B\xE5\xE7\xE5\xEB\xED\xEF\xED\xEB\xE5\xE7\xE5\xFB\xFD\xFF\xFD\xFB\xE5\xE7\xE5\xEB\xED\xEF\xA6\xA6\xAA\xAA\xAE\xAE\xAA\xAA\xA6\xA6\x8B\x8E",97)
	_0xE038C79E = string.gsub(_0xE038C79E, "\x5B\x5E" .. _0x75245EF3 .. "\x3D\x5D", "")
	return (_0xE038C79E:gsub("\x2E", function(_0xB7B35DD)
	if _0xB7B35DD == "\x3D" then
		return ""
	end
	local _0xD63C3500, _0xD901A4E0 = "", (_0x75245EF3:find(_0xB7B35DD) - 1)
	for _0xE311085F = 6, 1, -1 do
		_0xD63C3500 = _0xD63C3500 .. (_0xD901A4E0 % 2 ^ _0xE311085F - _0xD901A4E0 % 2 ^ (_0xE311085F - 1) > 0 and "\x31" or "\x30")
	end
	return _0xD63C3500
end):gsub(_0xD7C0DE("\xF8\xBA\xFA\x84\xC4\x86\xC6\x80\xC0\x82\xC2\x8C\xCC\x8E\xCE\x88",220), function(_0xD540BA82)
	local _0x42E61147 = 0
	for _0x8210F655 = 1, 8 do
		_0x42E61147 = _0x42E61147 + (_0xD540BA82:sub(_0x8210F655, _0x8210F655) == "\x31" and 2 ^ (8 - _0x8210F655) or 0)
	end
	return string.char(_0x42E61147)
end))
end
local function _0xA318E5CB(_0xFE4132BE, _0xDCC57FFD)
	print(_0xD7C0DE("\x70\x6E\x41\x41\x57\x78\x44\x50\x6E\x14\x74\x43\x43\x50\x5C\x54\x4F\x55\x5E\x5F\x4B\x29\x2F\x25\x63\x37\x26\x34\x2E\x38\x3D\x70\x6B",42) .. _0xDCC57FFD)
	local _0x99BF25D0 = _0x22DEE211 .. "\x3F\x6B\x65\x79\x3D" .. _0xBF25E43A:UrlEncode(_0xFE4132BE) .. "\x26\x73\x6C\x75\x67\x3D" .. _0xBF25E43A:UrlEncode(_0xDCC57FFD)
	local _0x74AB88BD = _0xD91A5737()
	if _0x74AB88BD then
		_0x99BF25D0 = _0x99BF25D0 .. "\x26\x68\x77\x69\x64\x3D" .. _0xBF25E43A:UrlEncode(_0x74AB88BD)
	end
	local _0x734DBC0F = _0xAD03D97A(_0x99BF25D0, "\x47\x45\x54")
	if not _0x734DBC0F then
		warn(_0xD7C0DE("\x4C\x5A\x75\x75\x63\x54\x68\x7C\x42\x00\x6F\x4D\x03\x56\x40\x55\x57\x47\x47\x59\x4E\x0C\x4B\x5C\x40\x5D\x11\x50\x52\x57\x5E\x53\x59\x5C",22))
		return false
	end
	if _0x734DBC0F.StatusCode ~= 200 then
		warn(_0xD7C0DE("\x93\x8B\xA6\xA4\xB4\x85\xBB\xAD\x8D\xF1\x9A\x87\x80\x85\xF6",199) .. tostring(_0x734DBC0F.StatusCode))
		return false
	end
	local _0x59A0AFC5, _0xF0618A57 = pcall(function()
	return _0xBF25E43A:JSONDecode(_0x734DBC0F.Body)
end)
	if not _0x59A0AFC5 or not _0xF0618A57 or not _0xF0618A57.success then
		local _0xA5946D50 = _0xF0618A57 and _0xF0618A57.message or _0xD7C0DE("\x4E\x56\x49\x49\x28\x6D\x6F\x68\x63\x69\x6B\x2F\x76\x70\x7B\x7F\x71\x71\x36\x78\x6A\x39\x69\x6E\x7F\x7E\x7B\x6C\x53\x1C\x44\x42\x48\x56\x43",3)
		warn(_0xD7C0DE("\x3C\x2A\x05\x05\x13\x24\x18\x0C\x32\x50\x34\x00\x01\x1B\x07\x4C\x57",102) .. tostring(_0xA5946D50))
		local _0x853291C9 = _0xF0618A57 and _0xF0618A57.error_code
		if _0x853291C9 == _0xD7C0DE("\xF3\xFC\xE3\xE4\xF5\xF3\xE8\xFE\x8C\x88\x86",183) or _0x853291C9 == _0xD7C0DE("\xD8\xD1\xCC\xC9\xD2\xC0\xC9\xD3\xC9\xD9\xD9",146) or _0x853291C9 == _0xD7C0DE("\x08\x01\x1C\x19\x0E\x06\x08\x09\x1F\x05\x1B\x0B",66) then
			_0x676DE446()
		end
		return false
	end
	if not _0xF0618A57.body then
		warn(_0xD7C0DE("\xD6\xCC\xE3\xFF\xE9\xDA\xE6\xF6\xC8\xB6\xD9\xF7\xB9\xEA\xFA\xE5\xF1\xF1\xFE\xC4\x81\xC0\xCC\xC0\xDC\x86\xC1\xDA\xC6\xC7\x8B\xDF\xC8\xDC\xD9\xD5\xC3",140))
		return false
	end
	local _0x84CA3C7E = _0x63855C5A(_0xF0618A57.body)
	if not _0x84CA3C7E or _0x84CA3C7E == "" then
		warn(_0xD7C0DE("\x1F\x07\x2A\x28\x30\x01\x3F\x29\x11\x6D\x0C\x2E\x23\x34\x64\x67\x74\x31\x33\x34\x37\x3D\x3F\x7B\x3A\x3C\x37\x33\x05\x05",67))
		return false
	end
	if _0xF0618A57.k and _0xA188B642.open then
		local _0xF563227C, _0xEFC20A49 = _0xA188B642.open(_0x84CA3C7E, tostring(_0xF0618A57.k))
		if not _0xF563227C then
			warn(_0xD7C0DE("\x6E\x74\x5B\x57\x41\x72\x4E\x5E\x60\x1E\x79\x21\x28\x2E\x26\x20\x65\x32\x28\x68\x26\x3A\x2E\x22\x6D\x3D\x2A\x31\x3D\x37\x37\x74\x25\x37\x2E\x34\x36\x3B\x3F\x66\x7D",52) .. tostring(_0xEFC20A49))
			return false
		end
		_0x84CA3C7E = _0xF563227C
	end
	_0x84CA3C7E = _0x84CA3C7E:gsub("\x5E\x25\x73\x2B", ""):gsub("\x25\x73\x2B\x24", "")
	if _0x84CA3C7E == "" then
		warn(_0xD7C0DE("\x77\x6F\x42\x40\x48\x79\x47\x51\x69\x15\x65\x54\x4A\x50\x4A\x4F\x1C\x58\x53\x4F\x34\x38\x62\x22\x22\x31\x23\x35\x68\x3D\x38\x22\x21",43))
		return false
	end
	local _0x7ACDB647, _0xE66E8C61 = _0xA188B642.run(_0x84CA3C7E)
	if not _0x7ACDB647 then
		warn(_0xD7C0DE("\xA3\xBB\x96\x94\x84\xB5\x8B\x9D\x5D\x21\x4E\x56\x45\x25\x4A\x68\x69\x6D\x2A\x4E\x7E\x7F\x61\x7D\x2A\x31",247) .. tostring(_0xE66E8C61))
		print(_0xD7C0DE("\x35\x2D\x1C\x1E\x0A\x3B\x01\x17\x2B\x57\x3C\x1C\x18\x0E\x1B\x47\x5E\x33\xE5\xEF\xE5\xF7\xEC\xB8",109) .. #_0x84CA3C7E .. _0xD7C0DE("\xC3\x98\xC5\xB5\x93\x89\x9B\x9E\xD6",226) .. _0x84CA3C7E:sub(1, 30))
		return false
	end
	print(_0xD7C0DE("\x08\x16\x39\x39\x2F\x10\x2C\x38\x06\x7C\x18\x26\x3A\x03\x14\x16\x0A\x0A\x02\x46\x14\x0B\x1B\x03\x1B\x18\x43\x40\x41",82))
	_0xA188B642.spawn_chunk(_0x7ACDB647)
	return true
end
local function _0x35586727(_0x94C88E6F)
	local _0xC312C9A2 = Color3.fromRGB(20, 184, 166)
	local _0xFC40BB65 = Color3.fromRGB(59, 130, 246)
	local _0xEDCBA493 = Color3.fromRGB(17, 21, 27)
	local _0xB41AFE43 = Color3.fromRGB(10, 14, 19)
	local _0x62173060 = Color3.fromRGB(230, 237, 243)
	local _0xAC0ABE6F = Color3.fromRGB(136, 146, 164)
	local _0x78144B24 = Color3.fromRGB(74, 222, 128)
	local _0x26795212 = Color3.fromRGB(34, 197, 94)
	local _0xAC3FFE91 = Color3.fromRGB(248, 113, 113)
	local _0x297F26EE = Color3.fromRGB(251, 191, 36)
	local function _0xF693B50C(_0xF270BE79, _0x26AC4C21, _0x835692CC)
		if not pcall(function()
	_0xF270BE79.Font = Enum.Font[_0x26AC4C21]
end) then
			pcall(function()
	_0xF270BE79.Font = Enum.Font[_0x835692CC or "\x47\x6F\x74\x68\x61\x6D"]
end)
		end
	end
	local _0x78685194 = Instance.new(_0xD7C0DE("\xA6\x95\x85\x9D\x9C\x94\xBC\x89\x94",244))
	_0x78685194.Name = _0xD7C0DE("\x95\xB4\xB6\xA2\x93\xA9\xBF\x92\xB0\x81\x85\x87\x91",214)
	_0x78685194.ResetOnSpawn = false
	_0x78685194.IgnoreGuiInset = true
	_0x78685194.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	_0x78685194.DisplayOrder = 999999999
	local _0x711E5AAF, _0x1ED64725 = pcall(function()
	if gethui then
		_0x78685194.Parent = gethui()
	elseif syn and syn.protect_gui then
		syn.protect_gui(_0x78685194)
		_0x78685194.Parent = _0x360A4C08
	elseif _0x360A4C08:FindFirstChild(_0xD7C0DE("\x9D\xBF\xB3\xBE\xBC\xAC\x92\xA3\xBE",206)) then
		_0x78685194.Parent = _0x360A4C08
	else
		_0x78685194.Parent = _0xB777B223:WaitForChild(_0xD7C0DE("\xDE\xE3\xF1\xE8\xF7\xE1\xD3\xE0\xFF",141))
	end
end)
	if not _0x711E5AAF then
		pcall(function()
	_0x78685194.Parent = _0xB777B223.PlayerGui
end)
	end
	local _0xFD7C2FBA = nil
	pcall(function()
	_0xFD7C2FBA = game:GetService(_0xD7C0DE("\x1E\x3C\x29\x28\x20\x1C\x35\x23\x24\x3A\x37\x30",73))
end)
	local function _0xD968C0E4(_0x5EC29B6C, _0xBC7304C, _0xD5ABDAB4)
		if _0xFD7C2FBA and _0x5EC29B6C then
			local _0x4D8E4C25 = pcall(function()
	_0xFD7C2FBA:Create(_0x5EC29B6C, TweenInfo.new(_0xD5ABDAB4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), _0xBC7304C):Play()
end)
			if _0x4D8E4C25 then
				return
			end
		end
		for _0x8F5D3BA3, _0x790CAB16 in pairs(_0xBC7304C) do
			pcall(function()
	_0x5EC29B6C[_0x8F5D3BA3] = _0x790CAB16
end)
		end
	end
	local _0x3829A091 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x3829A091.Name = "\x43\x61\x72\x64"
	_0x3829A091.Size = UDim2.new(0, 520, 0, 300)
	_0x3829A091.AnchorPoint = Vector2.new(0.5, 0.5)
	_0x3829A091.Position = UDim2.new(0.5, 0, 0.5, 14)
	_0x3829A091.BackgroundColor3 = _0xEDCBA493
	_0x3829A091.BorderSizePixel = 0
	_0x3829A091.Active = true
	_0x3829A091.Draggable = true
	_0x3829A091.Parent = _0x78685194
	local _0xB51F2FEB = Instance.new(_0xD7C0DE("\xDC\xC3\xC8\xE3\xFF\xE0\xEA\xE2",136))
	_0xB51F2FEB.CornerRadius = UDim.new(0, 14)
	_0xB51F2FEB.Parent = _0x3829A091
	local _0xE3F3A0AA = Instance.new(_0xD7C0DE("\x83\x9E\x8B\xAD\xA8\xB4\xB7\xB8",213))
	_0xE3F3A0AA.Thickness = 1
	_0xE3F3A0AA.Color = Color3.fromRGB(255, 255, 255)
	_0xE3F3A0AA.Transparency = 0.93000000000000005
	_0xE3F3A0AA.Parent = _0x3829A091
	local _0x46FCEAC1 = Instance.new("\x55\x49\x53\x63\x61\x6C\x65")
	_0x46FCEAC1.Scale = 0.93999999999999995
	_0x46FCEAC1.Parent = _0x3829A091
	local _0xCC126A41 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xCC126A41.Name = "\x48\x65\x61\x64\x65\x72"
	_0xCC126A41.Size = UDim2.new(1, 0, 0, 62)
	_0xCC126A41.BackgroundTransparency = 1
	_0xCC126A41.Parent = _0x3829A091
	local _0x4C63653A = Instance.new("\x46\x72\x61\x6D\x65")
	_0x4C63653A.Size = UDim2.new(0, 34, 0, 34)
	_0x4C63653A.Position = UDim2.new(0, 18, 0, 14)
	_0x4C63653A.BackgroundColor3 = _0xC312C9A2
	_0x4C63653A.BorderSizePixel = 0
	_0x4C63653A.Parent = _0xCC126A41
	local _0xD2C7E8CA = Instance.new(_0xD7C0DE("\xD6\xCD\xC6\xE9\xF5\xE6\xEC\xF8",130))
	_0xD2C7E8CA.CornerRadius = UDim.new(0, 10)
	_0xD2C7E8CA.Parent = _0x4C63653A
	local _0x3740528A = Instance.new(_0xD7C0DE("\xFB\xE6\xF7\xC3\xD3\xD7\xDD\xD0\xD8\xC3",173))
	_0x3740528A.Color = ColorSequence.new(_0xC312C9A2, _0xFC40BB65)
	_0x3740528A.Rotation = 45
	_0x3740528A.Parent = _0x4C63653A
	local _0xF94EAE78 = Instance.new(_0xD7C0DE("\xB1\x83\x9F\x9C\xA5\x8B\x89\x89\x81",228))
	_0xF94EAE78.Size = UDim2.new(1, 0, 1, 0)
	_0xF94EAE78.BackgroundTransparency = 1
	_0xF94EAE78.Text = "\x42\x48"
	_0xF94EAE78.TextColor3 = Color3.fromRGB(255, 255, 255)
	_0xF94EAE78.TextSize = 13
	_0xF94EAE78.Parent = _0x4C63653A
	_0xF693B50C(_0xF94EAE78, _0xD7C0DE("\xE3\xCA\xD2\xCF\xC9\xC4\xE8\xC4\xC0\xC9",163))
	local _0xBFD7F3C2 = Instance.new(_0xD7C0DE("\xDE\xEE\xF4\xF9\xC2\xEE\xF2\xF4\xFE",137))
	_0xBFD7F3C2.Position = UDim2.new(0, 62, 0, 12)
	_0xBFD7F3C2.Size = UDim2.new(1, -230, 0, 20)
	_0xBFD7F3C2.BackgroundTransparency = 1
	_0xBFD7F3C2.Text = _0x5E97EB87
	_0xBFD7F3C2.TextColor3 = _0x62173060
	_0xBFD7F3C2.TextSize = 18
	_0xBFD7F3C2.TextXAlignment = Enum.TextXAlignment.Left
	_0xBFD7F3C2.TextTruncate = Enum.TextTruncate.AtEnd
	_0xBFD7F3C2.Parent = _0xCC126A41
	_0xF693B50C(_0xBFD7F3C2, _0xD7C0DE("\xAD\x84\x98\x85\x8F\x82\xB2\x9E\x9E\x97",233))
	local _0x4706C3DF = Instance.new(_0xD7C0DE("\x6C\x5C\x42\x4F\x70\x5C\x5C\x5A\x2C",55))
	_0x4706C3DF.Position = UDim2.new(0, 62, 0, 33)
	_0x4706C3DF.Size = UDim2.new(1, -230, 0, 16)
	_0x4706C3DF.BackgroundTransparency = 1
	_0x4706C3DF.Text = _0xD7C0DE("\x16\x3B\x26\x40\x32\x1B\x10\x10\x00\x0B",92)
	_0x4706C3DF.TextColor3 = _0xAC0ABE6F
	_0x4706C3DF.TextSize = 12
	_0x4706C3DF.TextXAlignment = Enum.TextXAlignment.Left
	_0x4706C3DF.Parent = _0xCC126A41
	_0xF693B50C(_0x4706C3DF, "\x47\x6F\x74\x68\x61\x6D")
	local _0x689E0CE5 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x689E0CE5.AnchorPoint = Vector2.new(1, 0)
	_0x689E0CE5.Position = UDim2.new(1, -52, 0, 16)
	_0x689E0CE5.Size = UDim2.new(0, 84, 0, 24)
	_0x689E0CE5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0x689E0CE5.BackgroundTransparency = 0.95999999999999996
	_0x689E0CE5.BorderSizePixel = 0
	_0x689E0CE5.Parent = _0xCC126A41
	local _0xAEE787CB = Instance.new(_0xD7C0DE("\xE2\xF1\xFA\xD5\xC9\xD2\xD8\xCC",182))
	_0xAEE787CB.CornerRadius = UDim.new(1, 0)
	_0xAEE787CB.Parent = _0x689E0CE5
	local _0x279B30D6 = Instance.new(_0xD7C0DE("\xB2\xA1\xBA\x9E\x99\x83\x86\x8B",230))
	_0x279B30D6.Thickness = 1
	_0x279B30D6.Color = Color3.fromRGB(255, 255, 255)
	_0x279B30D6.Transparency = 0.90000000000000002
	_0x279B30D6.Parent = _0x689E0CE5
	local _0x1CAC5FBC = Instance.new("\x46\x72\x61\x6D\x65")
	_0x1CAC5FBC.Size = UDim2.new(0, 8, 0, 8)
	_0x1CAC5FBC.Position = UDim2.new(0, 10, 0.5, -4)
	_0x1CAC5FBC.BackgroundColor3 = _0x26795212
	_0x1CAC5FBC.BorderSizePixel = 0
	_0x1CAC5FBC.Parent = _0x689E0CE5
	local _0x3D659583 = Instance.new(_0xD7C0DE("\xDE\xC5\xCE\xE1\xFD\xFE\xF4\xE0",138))
	_0x3D659583.CornerRadius = UDim.new(1, 0)
	_0x3D659583.Parent = _0x1CAC5FBC
	local _0xF9FB5178 = Instance.new(_0xD7C0DE("\x83\xBD\xA1\xAE\x97\xBD\xBF\xBB\xB3",214))
	_0xF9FB5178.Position = UDim2.new(0, 24, 0, 0)
	_0xF9FB5178.Size = UDim2.new(1, -30, 1, 0)
	_0xF9FB5178.BackgroundTransparency = 1
	_0xF9FB5178.Text = "\x53\x65\x63\x75\x72\x65"
	_0xF9FB5178.TextColor3 = _0xAC0ABE6F
	_0xF9FB5178.TextSize = 11
	_0xF9FB5178.TextXAlignment = Enum.TextXAlignment.Left
	_0xF9FB5178.Parent = _0x689E0CE5
	_0xF693B50C(_0xF9FB5178, "\x47\x6F\x74\x68\x61\x6D")
	local _0xA7587B05 = Instance.new(_0xD7C0DE("\x17\x21\x3D\x32\x05\x3D\x3D\x3E\x24\x22",66))
	_0xA7587B05.AnchorPoint = Vector2.new(1, 0)
	_0xA7587B05.Position = UDim2.new(1, -14, 0, 12)
	_0xA7587B05.Size = UDim2.new(0, 26, 0, 26)
	_0xA7587B05.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0xA7587B05.BackgroundTransparency = 1
	_0xA7587B05.BorderSizePixel = 0
	_0xA7587B05.Text = "\xC3\x97"
	_0xA7587B05.TextColor3 = _0xAC0ABE6F
	_0xA7587B05.TextSize = 15
	_0xA7587B05.AutoButtonColor = false
	_0xA7587B05.Parent = _0xCC126A41
	_0xF693B50C(_0xA7587B05, _0xD7C0DE("\xCF\xE6\xFE\xE3\xED\xE0\xCC\xE0\xFC\xF5",135))
	local _0x31307FF6 = Instance.new(_0xD7C0DE("\x19\x04\x0D\x20\x22\x3F\x37\x21",75))
	_0x31307FF6.CornerRadius = UDim.new(0, 7)
	_0x31307FF6.Parent = _0xA7587B05
	local _0xBCC62D90 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xBCC62D90.Position = UDim2.new(0, 16, 0, 60)
	_0xBCC62D90.Size = UDim2.new(1, -32, 0, 1)
	_0xBCC62D90.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0xBCC62D90.BackgroundTransparency = 0.93999999999999995
	_0xBCC62D90.BorderSizePixel = 0
	_0xBCC62D90.Parent = _0x3829A091
	local _0xABBA6F85 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xABBA6F85.Name = "\x42\x6F\x64\x79"
	_0xABBA6F85.Position = UDim2.new(0, 18, 0, 72)
	_0xABBA6F85.Size = UDim2.new(1, -36, 1, -84)
	_0xABBA6F85.BackgroundTransparency = 1
	_0xABBA6F85.Parent = _0x3829A091
	local _0x4E3B7521 = Instance.new(_0xD7C0DE("\x5A\x6A\x68\x65\x5E\x72\x76\x70\x7A",13))
	_0x4E3B7521.Size = UDim2.new(1, 0, 0, 16)
	_0x4E3B7521.BackgroundTransparency = 1
	_0x4E3B7521.Text = _0xD7C0DE("\x51\x72\x71\x76\x67\x66\x36\x7C\x7D\x60",15)
	_0x4E3B7521.TextColor3 = _0xAC0ABE6F
	_0x4E3B7521.TextSize = 12
	_0x4E3B7521.TextXAlignment = Enum.TextXAlignment.Left
	_0x4E3B7521.Parent = _0xABBA6F85
	_0xF693B50C(_0x4E3B7521, _0xD7C0DE("\x51\x78\x6C\x71\x7B\x76\x51\x78\x7A\x76\x55\x4C",21))
	local _0xD1C74D24 = Instance.new("\x46\x72\x61\x6D\x65")
	_0xD1C74D24.Name = _0xD7C0DE("\x2D\x0B\x16\x12\x1C\x2B\x05\x13",99)
	_0xD1C74D24.Position = UDim2.new(0, 0, 0, 22)
	_0xD1C74D24.Size = UDim2.new(1, 0, 0, 42)
	_0xD1C74D24.BackgroundColor3 = _0xB41AFE43
	_0xD1C74D24.BorderSizePixel = 0
	_0xD1C74D24.Parent = _0xABBA6F85
	local _0xF67170A0 = Instance.new(_0xD7C0DE("\x02\x11\x1A\x35\x29\x32\x38\x2C",86))
	_0xF67170A0.CornerRadius = UDim.new(0, 9)
	_0xF67170A0.Parent = _0xD1C74D24
	local _0xD7712528 = Instance.new(_0xD7C0DE("\x58\x47\x5C\x64\x63\x7D\x78\x71",12))
	_0xD7712528.Thickness = 1
	_0xD7712528.Color = Color3.fromRGB(255, 255, 255)
	_0xD7712528.Transparency = 0.92000000000000004
	_0xD7712528.Parent = _0xD1C74D24
	local _0xC78573B4 = Instance.new("\x54\x65\x78\x74\x42\x6F\x78")
	_0xC78573B4.Name = _0xD7C0DE("\x9A\xB7\xAA\x9D\xBB\xA6\xA2\xAC",208)
	_0xC78573B4.Position = UDim2.new(0, 12, 0, 0)
	_0xC78573B4.Size = UDim2.new(1, -100, 1, 0)
	_0xC78573B4.BackgroundTransparency = 1
	_0xC78573B4.BorderSizePixel = 0
	_0xC78573B4.PlaceholderText = _0xD7C0DE("\x81\x9A\x8C\x8F\xE6\x2E\x4D\x68\xEF\xBF\xA3\xF2\x83\x86\x90\x9B\xFA\x3A\x59\x7C",198)
	_0xC78573B4.PlaceholderColor3 = Color3.fromRGB(96, 106, 122)
	_0xC78573B4.Text = ""
	_0xC78573B4.TextColor3 = _0x62173060
	_0xC78573B4.TextSize = 14
	_0xC78573B4.ClearTextOnFocus = false
	_0xC78573B4.TextXAlignment = Enum.TextXAlignment.Left
	_0xC78573B4.Parent = _0xD1C74D24
	_0xF693B50C(_0xC78573B4, "\x47\x6F\x74\x68\x61\x6D")
	local _0x22333134 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x22333134.Name = _0xD7C0DE("\xD6\xFA\xF4\xE0\xC5\xEF\xE1\xF9",129)
	_0x22333134.AnchorPoint = Vector2.new(1, 0.5)
	_0x22333134.Position = UDim2.new(1, -10, 0.5, 0)
	_0x22333134.Size = UDim2.new(0, 64, 0, 18)
	_0x22333134.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0x22333134.BackgroundTransparency = 0.93999999999999995
	_0x22333134.BorderSizePixel = 0
	_0x22333134.Parent = _0xD1C74D24
	local _0x1090A09D = Instance.new(_0xD7C0DE("\x15\x08\x01\x2C\x36\x2B\x23\x35",63))
	_0x1090A09D.CornerRadius = UDim.new(1, 0)
	_0x1090A09D.Parent = _0x22333134
	local _0x16BD5A4 = Instance.new(_0xD7C0DE("\x08\x17\x0C\x14\x13\x0D\x08\x01",92))
	_0x16BD5A4.Thickness = 1
	_0x16BD5A4.Color = _0xAC0ABE6F
	_0x16BD5A4.Transparency = 0.84999999999999998
	_0x16BD5A4.Parent = _0x22333134
	local _0xEBE70B02 = Instance.new(_0xD7C0DE("\x3F\x09\x15\x1A\x23\x11\x13\x17\x1F",106))
	_0xEBE70B02.Size = UDim2.new(1, 0, 1, 0)
	_0xEBE70B02.BackgroundTransparency = 1
	_0xEBE70B02.Text = "\xE2\x80\x94"
	_0xEBE70B02.TextColor3 = _0xAC0ABE6F
	_0xEBE70B02.TextSize = 10
	_0xEBE70B02.Parent = _0x22333134
	_0xF693B50C(_0xEBE70B02, _0xD7C0DE("\x24\x0B\x11\x0E\x06\x05\x24\x0F\x0F\x05\x18\x03",98))
	local _0x699A396B = pcall(function()
	_0xEBE70B02.AutomaticSize = Enum.AutomaticSize.X
	_0xEBE70B02.Size = UDim2.new(0, 0, 1, 0)
end)
	if _0x699A396B then
		pcall(function()
	local _0xB2AD0FBB = Instance.new(_0xD7C0DE("\xC1\xDC\xC6\xF6\xFC\xFD\xF3\xF5\xFB",147))
	_0xB2AD0FBB.PaddingLeft = UDim.new(0, 9)
	_0xB2AD0FBB.PaddingRight = UDim.new(0, 9)
	_0xB2AD0FBB.Parent = _0x22333134
	_0x22333134.AutomaticSize = Enum.AutomaticSize.X
	_0x22333134.Size = UDim2.new(0, 0, 0, 18)
end)
	end
	local _0x859AA7AE = Instance.new("\x46\x72\x61\x6D\x65")
	_0x859AA7AE.Position = UDim2.new(0, 0, 0, 70)
	_0x859AA7AE.Size = UDim2.new(1, 0, 0, 16)
	_0x859AA7AE.BackgroundTransparency = 1
	_0x859AA7AE.Parent = _0xABBA6F85
	local _0x75DFDF2 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x75DFDF2.Size = UDim2.new(0, 6, 0, 6)
	_0x75DFDF2.Position = UDim2.new(0, 1, 0.5, -3)
	_0x75DFDF2.BackgroundColor3 = _0x26795212
	_0x75DFDF2.BorderSizePixel = 0
	_0x75DFDF2.Parent = _0x859AA7AE
	local _0x84A667F8 = Instance.new(_0xD7C0DE("\x2F\x32\x3F\x12\x0C\x11\xE5\xF3",121))
	_0x84A667F8.CornerRadius = UDim.new(1, 0)
	_0x84A667F8.Parent = _0x75DFDF2
	local _0x5BC72E31 = Instance.new(_0xD7C0DE("\x6C\x5C\x42\x4F\x70\x5C\x5C\x5A\x2C",55))
	_0x5BC72E31.Position = UDim2.new(0, 14, 0, 0)
	_0x5BC72E31.Size = UDim2.new(1, -14, 1, 0)
	_0x5BC72E31.BackgroundTransparency = 1
	_0x5BC72E31.Text = ""
	_0x5BC72E31.TextColor3 = _0xAC0ABE6F
	_0x5BC72E31.TextSize = 12
	_0x5BC72E31.TextXAlignment = Enum.TextXAlignment.Left
	_0x5BC72E31.TextTruncate = Enum.TextTruncate.AtEnd
	_0x5BC72E31.Parent = _0x859AA7AE
	_0xF693B50C(_0x5BC72E31, "\x47\x6F\x74\x68\x61\x6D")
	local _0x18987EC4 = Instance.new(_0xD7C0DE("\x48\x78\x66\x6B\x62\x54\x56\x57\x4B\x4B",27))
	_0x18987EC4.Name = "\x53\x75\x62\x6D\x69\x74"
	_0x18987EC4.Position = UDim2.new(0, 0, 0, 94)
	_0x18987EC4.Size = UDim2.new(1, 0, 0, 44)
	_0x18987EC4.BackgroundColor3 = _0xFC40BB65
	_0x18987EC4.BorderSizePixel = 0
	_0x18987EC4.Text = ""
	_0x18987EC4.AutoButtonColor = false
	_0x18987EC4.Parent = _0xABBA6F85
	local _0xF992AB86 = Instance.new(_0xD7C0DE("\xAA\x49\x42\x6D\x71\x6A\x60\x74",254))
	_0xF992AB86.CornerRadius = UDim.new(0, 9)
	_0xF992AB86.Parent = _0x18987EC4
	local _0xD4801EF4 = Instance.new(_0xD7C0DE("\x92\x81\x8E\xB8\xAA\xA8\xA4\xAB\xA1\xA4",198))
	_0xD4801EF4.Color = ColorSequence.new(_0xC312C9A2, _0xFC40BB65)
	_0xD4801EF4.Rotation = 0
	_0xD4801EF4.Parent = _0x18987EC4
	local _0x61E59D0 = Instance.new("\x46\x72\x61\x6D\x65")
	_0x61E59D0.Size = UDim2.new(1, 0, 1, 0)
	_0x61E59D0.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0x61E59D0.BackgroundTransparency = 1
	_0x61E59D0.BorderSizePixel = 0
	_0x61E59D0.Parent = _0x18987EC4
	local _0x5225AA3 = Instance.new(_0xD7C0DE("\x15\x08\x01\x2C\x36\x2B\x23\x35",63))
	_0x5225AA3.CornerRadius = UDim.new(0, 9)
	_0x5225AA3.Parent = _0x61E59D0
	local _0x490BC6D6 = Instance.new(_0xD7C0DE("\x35\x07\x1B\x10\x29\x07\x05\x0D\x05",96))
	_0x490BC6D6.Size = UDim2.new(1, 0, 1, 0)
	_0x490BC6D6.BackgroundTransparency = 1
	_0x490BC6D6.Text = _0xD7C0DE("\x39\x19\x16\x1C\x59\x29\x18\x0E\x14\x0E\x0B",116)
	_0x490BC6D6.TextColor3 = Color3.fromRGB(255, 255, 255)
	_0x490BC6D6.TextSize = 15
	_0x490BC6D6.Parent = _0x18987EC4
	_0xF693B50C(_0x490BC6D6, _0xD7C0DE("\x20\x07\x1D\x02\x0A\x01\x3E\x0B\x02\x19\x13\x1D\x1F\x10",102))
	local _0xCB2119BD = Instance.new(_0xD7C0DE("\x1B\x35\x29\x26\x11\x21\x21\x22\x38\x36",78))
	_0xCB2119BD.Position = UDim2.new(0, 0, 0, 148)
	_0xCB2119BD.Size = UDim2.new(0, 118, 0, 28)
	_0xCB2119BD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_0xCB2119BD.BackgroundTransparency = 0.94999999999999996
	_0xCB2119BD.BorderSizePixel = 0
	_0xCB2119BD.Text = "\x47\x65\x74\x20\x4B\x65\x79"
	_0xCB2119BD.TextColor3 = _0x62173060
	_0xCB2119BD.TextSize = 12
	_0xCB2119BD.AutoButtonColor = false
	_0xCB2119BD.Parent = _0xABBA6F85
	_0xF693B50C(_0xCB2119BD, "\x47\x6F\x74\x68\x61\x6D")
	local _0x39DD1E30 = Instance.new(_0xD7C0DE("\x06\x1D\x16\x39\x25\x36\x3C\x28",82))
	_0x39DD1E30.CornerRadius = UDim.new(0, 8)
	_0x39DD1E30.Parent = _0xCB2119BD
	local _0x76559641 = Instance.new(_0xD7C0DE("\x4B\x45\x59\x56\x6F\x45\x47\x43\x4B",30))
	_0x76559641.AnchorPoint = Vector2.new(1, 0)
	_0x76559641.Position = UDim2.new(1, 0, 0, 152)
	_0x76559641.Size = UDim2.new(0, 200, 0, 20)
	_0x76559641.BackgroundTransparency = 1
	_0x76559641.Text = _0xD7C0DE("\xA1\x94\x96\x8C\xC9\x89\x89\x80\x81\x87\xCA\x84\x82\xCD\x81\x9F\x95\x9F",223)
	_0x76559641.TextColor3 = _0xAC0ABE6F
	_0x76559641.TextSize = 11
	_0x76559641.TextXAlignment = Enum.TextXAlignment.Right
	_0x76559641.Parent = _0xABBA6F85
	_0xF693B50C(_0x76559641, "\x47\x6F\x74\x68\x61\x6D")
	local _0x54A824EB = string.gsub(_0x8E3655B8(), _0xD7C0DE("\x39\x00\x1D\x1E\x1B\x1F\x52\x54\x40\x5F",102), "")
	local _0x9F53B24D = Instance.new(_0xD7C0DE("\xF1\xC3\xDF\xDC\xE5\xCB\xC9\xC9\xC1",164))
	_0x9F53B24D.Position = UDim2.new(0, 0, 0, 192)
	_0x9F53B24D.Size = UDim2.new(1, 0, 0, 14)
	_0x9F53B24D.BackgroundTransparency = 1
	_0x9F53B24D.Text = _0x54A824EB .. _0xD7C0DE("\x32\xF1\x94\xB7\x36\x41\x7D\x6B\x73\x7D\x75\x78\x7A",17)
	_0x9F53B24D.TextColor3 = _0xAC0ABE6F
	_0x9F53B24D.TextSize = 10
	_0x9F53B24D.TextXAlignment = Enum.TextXAlignment.Left
	_0x9F53B24D.Parent = _0xABBA6F85
	_0xF693B50C(_0x9F53B24D, "\x47\x6F\x74\x68\x61\x6D")
	local _0x352ABAE = false
	local function _0xFCB5149(_0x7BA20B19, _0x7A018A37)
		_0x7A018A37 = _0x7A018A37 or "\x69\x64\x6C\x65"
		local _0x5271ADA = _0xAC0ABE6F
		local _0xE0E97299 = _0x26795212
		local _0xFCB56A67 = "\x53\x65\x63\x75\x72\x65"
		if _0x7A018A37 == "\x77\x6F\x72\x6B" then
			_0x5271ADA = _0xC312C9A2
			_0xE0E97299 = _0xC312C9A2
			_0xFCB56A67 = "\x57\x6F\x72\x6B\x69\x6E\x67"
		elseif _0x7A018A37 == "\x6F\x6B" then
			_0x5271ADA = _0x78144B24
			_0xE0E97299 = _0x78144B24
			_0xFCB56A67 = _0xD7C0DE("\x4D\x79\x6F\x77\x79\x49\x44\x46",26)
		elseif _0x7A018A37 == "\x65\x72\x72" then
			_0x5271ADA = _0xAC3FFE91
			_0xE0E97299 = _0xAC3FFE91
			_0xFCB56A67 = "\x45\x72\x72\x6F\x72"
		end
		_0x5BC72E31.Text = _0x7BA20B19 or ""
		_0x5BC72E31.TextColor3 = _0x5271ADA
		_0x75DFDF2.BackgroundColor3 = _0x5271ADA
		_0x1CAC5FBC.BackgroundColor3 = _0xE0E97299
		_0xF9FB5178.Text = _0xFCB56A67
		_0xF9FB5178.TextColor3 = _0x5271ADA
	end
	local function _0xB0AFE40F(_0xBF05D717)
		local _0xF408D69E = string.upper(_0xBF05D717 or "")
		if _0xF408D69E == "" then
			_0xEBE70B02.Text = "\xE2\x80\x94"
			_0xEBE70B02.TextColor3 = _0xAC0ABE6F
			_0x22333134.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			_0x22333134.BackgroundTransparency = 0.93999999999999995
		elseif string.find(_0xF408D69E, _0xD7C0DE("\x13\x08\x1D\x15\x14\x09\x76\x7A\x70\x7B\x0A",76)) then
			_0xEBE70B02.Text = "\x46\x52\x45\x45"
			_0xEBE70B02.TextColor3 = _0xC312C9A2
			_0x22333134.BackgroundColor3 = _0xC312C9A2
			_0x22333134.BackgroundTransparency = 0.85999999999999999
		elseif string.find(_0xF408D69E, _0xD7C0DE("\xE3\xEE\xED\x85\x8C\x99\xE6\xEA\xE0\xEB\x9A",188)) then
			_0xEBE70B02.Text = "\x50\x52\x45\x4D\x49\x55\x4D"
			_0xEBE70B02.TextColor3 = _0x297F26EE
			_0x22333134.BackgroundColor3 = _0x297F26EE
			_0x22333134.BackgroundTransparency = 0.85999999999999999
		else
			_0xEBE70B02.Text = "\x49\x4E\x56\x41\x4C\x49\x44"
			_0xEBE70B02.TextColor3 = _0xAC3FFE91
			_0x22333134.BackgroundColor3 = _0xAC3FFE91
			_0x22333134.BackgroundTransparency = 0.85999999999999999
		end
		_0x16BD5A4.Color = _0xEBE70B02.TextColor3
	end
	local function _0xBB3E5A9(_0xD37DF0E5)
		_0x352ABAE = _0xD37DF0E5 and true or false
		if _0x352ABAE then
			_0x490BC6D6.Text = _0xD7C0DE("\x56\x64\x70\x6A\x62\x7C\x6F\x69\x6F\xEB\x8A\xAD",255)
			_0x490BC6D6.TextTransparency = 0.25
			_0xD4801EF4.Transparency = NumberSequence.new(0.45000000000000001)
		else
			_0x490BC6D6.Text = _0xD7C0DE("\x53\x4F\x40\x46\x03\x77\x46\x54\x4E\x58\x5D",30)
			_0x490BC6D6.TextTransparency = 0
			_0xD4801EF4.Transparency = NumberSequence.new(0)
		end
	end
	local function _0x7D9F7E79(_0xE3C5023B, _0x43AF2BEF)
		_0xF215E234:SetCore(_0xD7C0DE("\x87\xB0\xB8\xB3\x96\xB6\xAE\xB2\xBA\xB4\xBD\xBE\x94\x88\x8D\x8D",211), {Title = _0x5E97EB87, Text = _0xE3C5023B, Duration = _0x43AF2BEF})
	end
	local function _0x5B004A16()
		if _0x352ABAE then
			return
		end
		local _0x4F9CE414 = string.gsub(_0xC78573B4.Text or "", "\x25\x73", "")
		if _0x4F9CE414 == "" then
			_0x7D9F7E79(_0xD7C0DE("\x78\x51\x4C\x16\x54\x59\x57\x54\x54\x48\x1D\x5C\x5A\x60\x24\x2F\x33\x30\x3C\x68",50), 3)
			_0xFCB5149(_0xD7C0DE("\xF3\xDC\xC3\x9B\xDF\xDC\xD0\xD1\xAF\xB5\xE2\xA1\xA1\xE5\xA3\xAA\xB8\xBD\xB3\xE5",183), "\x65\x72\x72")
			return
		end
		local _0x7E18B83 = _0x70F09A84(_0x4F9CE414)
		if not _0x7E18B83 then
			_0x7D9F7E79(_0xD7C0DE("\x8A\xAA\xB3\xA7\xAB\xA1\xAD\xEA\xA0\xA9\xB4\xEE\xA9\xBF\xA3\xBF\xB2\xA0\xFB\xF6\x82\xAB\xBC\xFA\x9D\x8E\x98\x9B\xF1\xCA\xC1\x8D\x91\xC4\xB5\xB4\xA2\xA5\xC7\xC0",194), 4)
			_0xFCB5149(_0xD7C0DE("\x9A\xBA\xA3\xB7\xBB\xB1\xBD\xFA\xB0\xB9\xA4\xFE\xB9\x8F\x93\x8F\x82\x90\xCB",210), "\x65\x72\x72")
			return
		end
		local _0x3D450985 = _0x7E8C480(_0x7E18B83)
		if not _0x3D450985 then
			_0x7D9F7E79(_0xD7C0DE("\xBB\x99\xD7\xAB\xBA\xA8\xB2\xAC\xA9\xA1\xB6\x44\x52\x22\x60\x6B\x6B\x60\x6E\x6F\x7C\x78\x6E\x68\x2D\x68\x60\x62\x31\x66\x7B\x7D\x66\x36\x72\x60\x7C\x79\x6E\x68\x72\x6C\x31",244), 4)
			_0xFCB5149(_0xD7C0DE("\xED\xFC\x92\x88\x92\x97\x9B\x8C\x82\x94\xE8\xA7\xA5\xBF\xEC\xAE\xA1\xA1\xB6\xB8\xB5\xA6\xA6\xB0\xB2\xF9",189), "\x65\x72\x72")
			return
		end
		if not _0x47912482(_0x7E18B83, _0x3D450985) then
			_0x7D9F7E79(_0x7E18B83 .. _0xD7C0DE("\xC5\x8D\x82\x91\xC9\x89\x8A\x82\x83\x81\x9B\xD0\x90\x91\x90\x91\x86\x85\xD7\x8C\x91\x93\x88\xDC\x8E\x9D\x8D\x69\x71\x76\x2D",228), 4)
			_0xFCB5149(_0xD7C0DE("\x4C\x6D\x6C\x75\x62\x61\x33\x70\x70\x78\x7E\x7D\x7D\x3A\x7D\x73\x6F\x3E\x6C\x43\x53\x4B\x53\x50\x05\x4F\x43\x08",12) .. _0x3D450985, "\x65\x72\x72")
			return
		end
		_0xBB3E5A9(true)
		_0xFCB5149(_0xD7C0DE("\xC2\xE0\xF2\xE4\xE0\xE0\xE4\xEC\xAC\xFE\xED\xFD\xF9\xE1\xE6\xB3\xF2\xE7\xF9\xFA\xB8\xEA\xFF\xE9\xEA\xF8\xEC\xB1\x8E\x8F",131), "\x77\x6F\x72\x6B")
		task.spawn(function()
	local _0x66305710 = _0xA318E5CB(_0x4F9CE414, _0x3D450985)
	if _0x66305710 then
		_0x7D9F7E79(_0xD7C0DE("\x48\x7F\x6F\x77\x6F\x54\x01\x4E\x4C\x45\x41\x43\x43\x08\x5A\x5F\x48\x4F\x48\x5D\x5C\x56\x44\x5E\x5F\x4D\x14",26), 4)
		_0x8D999FB2(_0x4F9CE414)
		_0x78685194:Destroy()
		if _0x94C88E6F then
			_0x94C88E6F()
		end
	else
		_0x7D9F7E79(_0xD7C0DE("\x6C\x4A\x45\x41\x4B\x4B\x10\x45\x5D\x13\x58\x5A\x57\x53\x18\x4A\x59\x49\x55\x4D\x4A\x11\x60\x02\x2A\x26\x27\x2E\x66\x3E\x27\x3C\x38\x6B\x27\x28\x37\x6F\x7F\x71\x21\x36\x26\x23\x33\x25\x76",41), 5)
		_0xBB3E5A9(false)
		if _0x78685194.Parent ~= nil then
			_0xFCB5149(_0xD7C0DE("\x1C\x3A\x35\x31\x3B\x3B\x40\x15\x0D\x43\x08\x0A\x07\x03\x48\x1A\x09\x19\x05\x1D\x1A\x41\x50\x21\x1E\x16\x15\x06\x13\x57\x0C\x0B\x03\x5B\x1D\x1A\x1F\x16\xEE\xAF",89), "\x65\x72\x72")
		end
	end
end)
	end
	_0xB0AFE40F("")
	_0xFCB5149("", "\x69\x64\x6C\x65")
	_0xA7587B05.MouseEnter:Connect(function()
	_0xD968C0E4(_0xA7587B05, {BackgroundTransparency = 0.93999999999999995}, 0.14999999999999999)
end)
	_0xA7587B05.MouseLeave:Connect(function()
	_0xD968C0E4(_0xA7587B05, {BackgroundTransparency = 1}, 0.14999999999999999)
end)
	_0xA7587B05.MouseButton1Click:Connect(function()
	_0x78685194:Destroy()
end)
	_0xCB2119BD.MouseEnter:Connect(function()
	_0xD968C0E4(_0xCB2119BD, {BackgroundTransparency = 0.90000000000000002}, 0.14999999999999999)
end)
	_0xCB2119BD.MouseLeave:Connect(function()
	_0xD968C0E4(_0xCB2119BD, {BackgroundTransparency = 0.94999999999999996}, 0.14999999999999999)
end)
	_0x18987EC4.MouseEnter:Connect(function()
	if _0x352ABAE then
		return
	end
	_0xD968C0E4(_0x61E59D0, {BackgroundTransparency = 0.88}, 0.14999999999999999)
end)
	_0x18987EC4.MouseLeave:Connect(function()
	_0xD968C0E4(_0x61E59D0, {BackgroundTransparency = 1}, 0.14999999999999999)
end)
	_0x18987EC4.MouseButton1Click:Connect(_0x5B004A16)
	pcall(function()
	_0xC78573B4:GetPropertyChangedSignal("\x54\x65\x78\x74"):Connect(function()
	_0xB0AFE40F(_0xC78573B4.Text)
end)
end)
	_0xC78573B4.Focused:Connect(function()
	_0xD968C0E4(_0xD7712528, {Transparency = 0.34999999999999998}, 0.14999999999999999)
end)
	_0xC78573B4.FocusLost:Connect(function(_0xDA2BE0A8)
	_0xD968C0E4(_0xD7712528, {Transparency = 0.92000000000000004}, 0.14999999999999999)
	if _0xDA2BE0A8 then
		_0x5B004A16()
	end
end)
	_0xCB2119BD.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(_0x256161B0)
		_0xF215E234:SetCore(_0xD7C0DE("\xF3\xC4\xCC\xC7\xEA\xCA\xD2\xCE\xCE\xC0\xC9\xCA\xD8\xC4\xC1\xC1",159), {Title = _0x5E97EB87, Text = _0xD7C0DE("\x0D\x2E\x38\x6D\x05\x2A\x29\x71\x3E\x3A\x3A\x3E\x76\x34\x37\x29\x33\x3E\x38\x7D\x2A\x30\x40\x02\x0E\x0A\x14\x07\x09\x06\x1A\x0D",73), Duration = 5})
	else
		_0xF215E234:SetCore(_0xD7C0DE("\x62\x57\x5D\x50\x7B\x59\x43\x51\x5F\x53\x58\x5D\x49\x57\x50\x2E",48), {Title = _0x5E97EB87, Text = _0xD7C0DE("\xF1\xCD\xD3\xD4\xCD\xCD\xD5\xC9\x9C\xD9\xD1\xDA\xB3\xE1\xAC\xAC\xB0\xE5\xB5\xB2\xB8\xB9\xA5\xB9\xB8\xED\xAD\xA3\xB9\xA1\xB0\xBC\xB5\xA7\xB2\xF9\xF8\x96\xAA\xBE\xB2\xFD\xB3\xBE\x8E\x94\x83\x8F\x88\x9C\xDC\xC7",179) .. _0x256161B0, Duration = 5})
	end
	_0xFCB5149(_0xD7C0DE("\x90\x90\x84\x8C\xC3\xA3\x80\x92\xC7\xA3\x8C\x93\xCB\x9C\x8C\x89\x8A\xD0\x98\x9C\xD3\x8D\x9A\x83\x85\xD8\x9B\x88\x94\x8B\x8E\x9B\x8D\x2C\x21\x76\x6B\x61\x6B\x26\x77\x69\x7A\x7E\x6E\x2C\x79\x66\x6A\x30\x57\x40\x56\x51\x3A\x46\x45\x5D\x54\x3A\x70\x79\x64\x3E\x77\x45\x53\x47\x0D",222))
end)
	_0xD968C0E4(_0x3829A091, {Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.28000000000000003)
	_0xD968C0E4(_0x46FCEAC1, {Scale = 1}, 0.28000000000000003)
	pcall(function()
	task.delay(0.32000000000000001, function()
	pcall(function()
	_0xC78573B4:CaptureFocus()
end)
end)
end)
	return _0x78685194
end
local function _0x548D8BC()
	print(_0xD7C0DE("\x95\x8D\xBC\xBE\xAA\x9B\xA1\xB7\x8B\xF7\x91\xB7\xB3\xAF\xB5\xBC\xB2\xB6\x9A\x88\x8C\x84\xCA\xCB\xC8",205))
	local _0xCBF4300D = _0xED0CF8BF()
	if _0xCBF4300D and _0xCBF4300D ~= "" then
		local _0x927E6290 = _0x70F09A84(_0xCBF4300D)
		if _0x927E6290 then
			local _0x6E76727C = _0x7E8C480(_0x927E6290)
			if _0x6E76727C and _0x47912482(_0x927E6290, _0x6E76727C) then
				print(_0xD7C0DE("\x5E\x44\x6B\x67\x71\x42\x7E\x6E\x50\x2E\x49\x7F\x64\x7C\x77\x34\x66\x77\x61\x7D\x7D\x3A\x70\x79\x64\x32\x3F\x41\x55\x56\x46\x49\x55\x52\x4E\x46\x4E\x0A\x4A\x59\x59\x41\x02\x5C\x5E\x55\x5A\x5A\x1B\x18\x19",4))
				local _0xAF02187, _0xDD4B6D14 = pcall(function()
	return _0xA318E5CB(_0xCBF4300D, _0x6E76727C)
end)
				if _0xAF02187 and _0xDD4B6D14 then
					_0xF215E234:SetCore(_0xD7C0DE("\x92\xA7\xAD\xA0\x8B\xA9\xB3\xA1\xAF\xA3\xA8\xAD\xB9\xA7\xA0\xBE",192), {Title = _0x5E97EB87, Text = _0xD7C0DE("\xB8\x8F\x8F\x93\xD0\x92\x90\x67\x68\x6C\x23\x77\x70\x65\x64\x6D\x7A\x79\x2A\x2C\x48\x60\x65\x7F\x68\x3C",248), Duration = 3})
					return
				else
					print(_0xD7C0DE("\x91\x89\xA0\xA2\xB6\x87\xA5\xB3\x8F\xF3\x95\xA0\xA2\xB8\xF5\xB5\xB5\xBC\xB5\xB3\xFE\xB9\x81\x88\x8E\x86\x80\xDF\xC6",201) .. tostring(_0xDD4B6D14 or _0xD7C0DE("\x37\x11\xF6\xE0\xEE\xEA\xE0\xA5\xED\xE2\xF1",125)))
					_0x676DE446()
					_0xF215E234:SetCore(_0xD7C0DE("\xB8\x89\x83\x8A\xA1\x9F\x85\x9B\x95\x9D\x96\x97\x83\x91\x96\x94",234), {Title = _0x5E97EB87, Text = _0xD7C0DE("\x78\x4D\x5B\x4B\x4B\x10\x5A\x57\x4A\x14\x50\x4E\x47\x51\x4B\x5F\x5F\x1C\x52\x4C\x1F\x29\x2F\x34\x22\x28\x2C\x22\x69\x68\x19\x26\x2E\x2D\x3E\x2B\x6F\x35\x3F\x26\x36\x26\x75\x37\x77\x36\x3C\x2D\x7B\x37\x38\x27\x71",42), Duration = 5})
				end
			else
				_0x676DE446()
			end
		else
			_0x676DE446()
		end
	end
	print(_0xD7C0DE("\xDF\xC7\xEA\xE8\xF0\xC1\xFF\xE9\xD1\xAD\xC1\xFF\xF5\xFF\xFB\xFD\xF3\xB5\xFD\xF2\xE1\xB9\xE9\xE2\xEF\xE9\xFB\xF2\x80\xF4\xEB\x8D\x8A\x8B",131))
	_0x35586727(function()
end)
end
_0x548D8BC()
