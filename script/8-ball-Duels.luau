( function (...) local _lllllIIIlI = "\104\116\116\112\115\058\047\047\114\097\119\046\103\105\116\104\117\098\117\115\101\114\099\111\110\116\101\110\116\046\099\111\109\047\065\114\116\067\104\105\118\101\103\114\111\117\112\047\066\108\111\120\072\117\098\085\073\076\105\098\115\047\114\101\102\115\047\104\101\097\100\115\047\109\097\105\110\047\115\111\117\114\099\101\046\108\117\097" local _IlllIIllII = "\069\105\103\104\116\066\097\108\108\068\117\101\108\115\065\115\115\105\115\116" local function _llIIlllIII(key) local _lIIIIlllll = _G[key] if type(_lIIIIlllll) == "\116\097\098\108\101" and type(_lIIIIlllll.Destroy) == "\102\117\110\099\116\105\111\110" then pcall(_lIIIIlllll.Destroy) end
 end
 _llIIlllIII(_IlllIIllII) task.wait(0.05) do local _lIlIIIlIIl, hui = pcall( function () return (type(gethui) == "\102\117\110\099\116\105\111\110") and gethui() or game:GetService("\067\111\114\101\071\117\105") end
 ) if _lIlIIIlIIl and hui then for _, c in ipairs(hui:GetChildren()) do if c:IsA("\083\099\114\101\101\110\071\117\105") and string.sub(c.Name, 0x1, #("\066\108\111\120\072\117\098\070\114\097\109\101\119\111\114\107\095")) == "\066\108\111\120\072\117\098\070\114\097\109\101\119\111\114\107\095" then pcall( function () c:Destroy() end
 ) end
 end
 end
 end
 local _IlIlllllll = loadstring(game:HttpGet(_lllllIIIlI))() local RunService = game:GetService("\082\117\110\083\101\114\118\105\099\101") local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101") local _IlIIIlIlll = { guide = false, guideMult = 0x7, predict = false, autix = false, } local _IIlIIIlIlI = "\056\098\097\108\108\045\100\117\101\108\115\045\099\102\103\046\116\120\116" local _IIIllIIIII = "\104\116\116\112\115\058\047\047\114\097\119\046\103\105\116\104\117\098\117\115\101\114\099\111\110\116\101\110\116\046\099\111\109\047\065\114\116\067\104\105\118\101\103\114\111\117\112\047\082\111\098\108\111\120\047\114\101\102\115\047\104\101\097\100\115\047\109\097\105\110\047\115\099\114\105\112\116\047\056\045\098\097\108\108\045\068\117\101\108\115\046\108\117\097\117" local function _IllIIIIllI(name, content) if type(writefile) == "\102\117\110\099\116\105\111\110" then pcall(writefile, name, content) end
 end
 local function _IIllIlIlII(name: string): string? if type(readfile) == "\102\117\110\099\116\105\111\110" then local _lIlIIIlIIl, _IIlIlIIlII = pcall(readfile, name) if _lIlIIIlIIl and type(_IIlIlIIlII) == "\115\116\114\105\110\103" then return _IIlIlIIlII end
 end
 return nil end
 local function _IIlllIIIlI() _IllIIIIllI( _IIlIIIlIlI, table.concat({ "\103\117\105\100\101\061" .. (_IlIIIlIlll.guide and 0x1 or 0x0), "\109\117\108\116\061" .. tostring(_IlIIIlIlll.guideMult), "\112\114\101\100\105\099\116\061" .. (_IlIIIlIlll.predict and 0x1 or 0x0), "\097\117\116\105\120\061" .. (_IlIIIlIlll.autix and 0x1 or 0x0), }, "\092\110") ) end
 do local _lIllIlIIlI = _IIllIlIlII(_IIlIIIlIlI) if type(_lIllIlIIlI) == "\115\116\114\105\110\103" and #_lIllIlIIlI > 0x0 then _IlIIIlIlll.guide = string.find(_lIllIlIIlI, "\103\117\105\100\101\061\049") ~= nil _IlIIIlIlll.predict = string.find(_lIllIlIIlI, "\112\114\101\100\105\099\116\061\049") ~= nil _IlIIIlIlll.autix = string.find(_lIllIlIIlI, "\097\117\116\105\120\061\049") ~= nil local _IIIllIIIll = string.match(_lIllIlIIlI, "\109\117\108\116\061\040\037\100\043\041") if _IIIllIIIll then _IlIIIlIlll.guideMult = math.clamp(tonumber(_IIIllIIIll) or 0x7, 0x1, 0xC) end
 end
 end
 local function _lllllllIlI() if _IIIllIIIII == "" then return nil end
 return "\116\097\115\107\046\119\097\105\116\040\050\041\032\112\099\097\108\108\040\102\117\110\099\116\105\111\110\040\041\032\105\102\032\114\101\097\100\102\105\108\101\032\097\110\100\032\105\115\102\105\108\101\032\097\110\100\032\105\115\102\105\108\101\040\034" .. _IIlIIIlIlI .. "\034\041\032\097\110\100\032\115\116\114\105\110\103\046\102\105\110\100\040\114\101\097\100\102\105\108\101\040\034" .. _IIlIIIlIlI .. "\034\041\044\032\034\097\117\116\105\120\061\049\034\041\032\116\104\101\110\032\108\111\097\100\115\116\114\105\110\103\040\103\097\109\101\058\072\116\116\112\071\101\116\040\034" .. _IIIllIIIII .. "\034\041\041\040\041\032\101\110\100\032\101\110\100\041" end
 local function _lIIIIlllII() if not _IlIIIlIlll.autix or _IIIllIIIII == "" then return false end
 if type(queue_on_teleport) ~= "\102\117\110\099\116\105\111\110" then return false end
 local _IIllIIIIIl = _lllllllIlI() if not _IIllIIIIIl then return false end
 return pcall(queue_on_teleport, _IIllIIIIIl) end
 _lIIIIlllII() local _IIIllllIII = _G[_IlllIIllII .. "\095\066\097\115\101"] if type(_IIIllllIII) ~= "\116\097\098\108\101" then _IIIllllIII = {} _G[_IlllIIllII .. "\095\066\097\115\101"] = _IIIllllIII end
 local _lllllIlllI = _IlIlllllll:CreateWindow("\056\032\066\097\108\108\032\068\117\101\108\115\032\8212\032\065\115\115\105\115\116", { Size = UDim2.new(0x0, 0x1D6, 0x0, 0x17C), MinimizeButton = true, }) pcall( function () _lllllIlllI:SetPosition(UDim2.new(0x0, 0xC + 0xEB, 0x0, 0x48 + 0xBE)) end
 ) local _lllllIIlII = nil pcall( function () _lllllIIlII = _lllllIlllI:CreateMiniWidget({ Title = "\056\032\066\097\108\108\032\065\115\115\105\115\116", Position = UDim2.new(0x0, 0xC, 0x0, 0xC8), Rows = 0x3, }) end
 ) local _IIIIlIlIII = {} local function _llIIlIIlIl(row, text) if _IIIIlIlIII[row] == text then return end
 _IIIIlIlIII[row] = text if _lllllIIlII then pcall( function () _lllllIIlII.SetText(row, text) end
 ) end
 end
 local _lIlIllllII = _lllllIlllI:CreateTab("\065\115\115\105\115\116") _lIlIllllII:AddLabel( "\069\120\116\101\110\100\101\100\032\071\117\105\100\101\032\108\101\110\103\116\104\101\110\115\032\116\104\101\032\098\117\105\108\116\045\105\110\032\097\105\109\032\108\105\110\101\046\032\073\109\112\097\099\116\032\080\114\101\100\105\099\116\105\111\110\032\100\114\097\119\115\032\119\104\101\114\101\032\116\104\101\032\099\117\101\032\098\097\108\108\032\097\110\100\032\111\098\106\101\099\116\032\098\097\108\108\115\032\119\105\108\108\032\116\114\097\118\101\108\032\097\102\116\101\114\032\099\111\110\116\097\099\116\044\032\105\110\099\108\117\100\105\110\103\032\099\117\115\104\105\111\110\032\114\101\098\111\117\110\100\115\046" ) _lIlIllllII:AddDivider() _lIlIllllII:AddToggle("\069\120\116\101\110\100\101\100\032\071\117\105\100\101", _IlIIIlIlll.guide, function (on) _IlIIIlIlll.guide = on _IIlllIIIlI() _llIIlIIlIl(0x1, _IlIIIlIlll.guide and ("\071\117\105\100\101\058\032" .. _IlIIIlIlll.guideMult .. "\120") or "\071\117\105\100\101\058\032\111\102\102") end
 ) _lIlIllllII:AddSlider("\071\117\105\100\101\032\076\101\110\103\116\104\032\040\120\041", 0x1, 0xC, _IlIIIlIlll.guideMult, function (v) _IlIIIlIlll.guideMult = v _IIlllIIIlI() _llIIlIIlIl(0x1, _IlIIIlIlll.guide and ("\071\117\105\100\101\058\032" .. _IlIIIlIlll.guideMult .. "\120") or "\071\117\105\100\101\058\032\111\102\102") end
 ) _lIlIllllII:AddDivider() _lIlIllllII:AddToggle("\073\109\112\097\099\116\032\080\114\101\100\105\099\116\105\111\110", _IlIIIlIlll.predict, function (on) _IlIIIlIlll.predict = on _IIlllIIIlI() _llIIlIIlIl(0x2, _IlIIIlIlll.predict and "\080\114\101\100\105\099\116\105\111\110\058\032\111\110\032\8212\032\097\105\109\032\110\111\119" or "\080\114\101\100\105\099\116\105\111\110\058\032\111\102\102") end
 ) local _llIlIIIlll _llIlIIIlll = _lIlIllllII:AddToggle("\065\117\116\111\032\069\120\101\099\117\116\101\032\065\102\116\101\114\032\084\101\108\101\112\111\114\116", _IlIIIlIlll.autix, function (on) _IlIIIlIlll.autix = on if on then if _IIIllIIIII == "" then _IlIIIlIlll.autix = false _IIlllIIIlI() pcall( function () _llIlIIIlll.SetValue(false) end
 ) _IlIlllllll:Notify("\065\117\116\111\032\069\120\101\099\117\116\101", "\070\105\108\108\032\076\079\065\068\083\084\082\073\078\071\095\085\082\076\032\097\116\032\116\104\101\032\116\111\112\032\111\102\032\116\104\101\032\115\099\114\105\112\116\032\102\105\114\115\116\032\040\114\097\119\032\108\105\110\107\032\116\111\032\116\104\105\115\032\115\099\114\105\112\116\041\044\032\116\104\101\110\032\114\101\045\114\117\110\032\105\116\046", 0x5, "\087\097\114\110\105\110\103") elseif _lIIIIlllII() then _IIlllIIIlI() _IlIlllllll:Notify("\065\117\116\111\032\069\120\101\099\117\116\101", "\065\114\109\101\100\032\8212\032\097\102\116\101\114\032\109\111\118\105\110\103\032\115\101\114\118\101\114\115\032\116\104\101\032\115\099\114\105\112\116\032\114\101\045\114\117\110\115\032\102\114\111\109\032\076\079\065\068\083\084\082\073\078\071\095\085\082\076\046", 0x4, "\083\117\099\099\101\115\115") else _IlIIIlIlll.autix = false _IIlllIIIlI() pcall( function () _llIlIIIlll.SetValue(false) end
 ) _IlIlllllll:Notify("\065\117\116\111\032\069\120\101\099\117\116\101", "\069\120\101\099\117\116\111\114\032\104\097\115\032\110\111\032\113\117\101\117\101\095\111\110\095\116\101\108\101\112\111\114\116\032\115\117\112\112\111\114\116\032\8212\032\102\101\097\116\117\114\101\032\117\110\097\118\097\105\108\097\098\108\101\046", 0x5, "\069\114\114\111\114") end
 else _IIlllIIIlI() _IlIlllllll:Notify("\065\117\116\111\032\069\120\101\099\117\116\101", "\079\102\102\032\8212\032\116\104\101\032\113\117\101\117\101\100\032\108\111\097\100\101\114\032\099\104\101\099\107\115\032\116\104\101\032\099\111\110\102\105\103\032\102\108\097\103\032\097\110\100\032\119\105\108\108\032\100\111\032\110\111\116\104\105\110\103\046", 0x4, "\073\110\102\111") end
 _llIIlIIlIl(0x3, _IlIIIlIlll.autix and "\065\117\116\111\069\120\101\099\058\032\111\110" or "\065\117\116\111\069\120\101\099\058\032\111\102\102") end
 ) _lIlIllllII:AddLabel( "\065\105\109\032\116\111\032\115\101\101\032\112\097\116\104\115\058\032\119\104\105\116\101\032\061\032\099\117\101\032\098\097\108\108\032\097\102\116\101\114\032\099\111\110\116\097\099\116\044\032\099\111\108\111\114\101\100\032\061\032\111\098\106\101\099\116\032\098\097\108\108\115\044\032\099\105\114\099\108\101\032\061\032\099\111\110\116\097\099\116\032\112\111\105\110\116\046\032\080\097\116\104\115\032\104\105\100\101\032\119\104\101\110\032\105\116\032\105\115\032\110\111\116\032\121\111\117\114\032\116\117\114\110\046\032\065\117\116\111\032\069\120\101\099\117\116\101\032\114\101\045\114\117\110\115\032\116\104\101\032\115\099\114\105\112\116\032\102\114\111\109\032\105\116\115\032\076\079\065\068\083\084\082\073\078\071\095\085\082\076\032\097\102\116\101\114\032\116\101\108\101\112\111\114\116\115\032\040\110\111\116\104\105\110\103\032\105\115\032\115\097\118\101\100\032\116\111\032\100\105\115\107\041\059\032\121\111\117\114\032\116\111\103\103\108\101\115\032\097\114\101\032\114\101\115\116\111\114\101\100\032\097\117\116\111\109\097\116\105\099\097\108\108\121\046" ) _lIlIllllII:AddLabel("\104\116\116\112\115\058\047\047\098\108\111\120\104\117\098\046\099\108\105\099\107") _llIIlIIlIl(0x1, _IlIIIlIlll.guide and ("\071\117\105\100\101\058\032" .. _IlIIIlIlll.guideMult .. "\120") or "\071\117\105\100\101\058\032\111\102\102") _llIIlIIlIl(0x2, _IlIIIlIlll.predict and "\080\114\101\100\105\099\116\105\111\110\058\032\111\110\032\8212\032\097\105\109\032\110\111\119" or "\080\114\101\100\105\099\116\105\111\110\058\032\111\102\102") _llIIlIIlIl(0x3, _IlIIIlIlll.autix and "\065\117\116\111\069\120\101\099\058\032\111\110" or "\065\117\116\111\069\120\101\099\058\032\111\102\102") task.spawn( function () local _IIlIIIIIIl = ReplicatedStorage:WaitForChild("\076\105\098\114\097\114\105\101\115"):WaitForChild("\071\097\109\101\083\112\101\099\105\102\105\099"):WaitForChild("\080\111\111\108") local _IIllIIIIll = require(_IIlIIIIIIl.PoolPhysics) local _llIIlIllIl = require(_IIlIIIIIIl.PoolSkins) local _llllllllll = require(_IIlIIIIIIl.PoolStepper) local _IIlIllllII = require(_IIlIIIIIIl.PoolConstants) local _IIlIIllIII = require(_IIlIIIIIIl.PoolTableRenderer2D) local _lIIIllIlIl = _IIlIllllII.CueBallNumber local _IllllllllI = _IIlIllllII.FrameWidth local _llllllIIII = _IIlIllllII.FrameHeight _IIIllllIII.GetCueEffects = _IIIllllIII.GetCueEffects or _llIIlIllIl.GetCueEffects _llIIlIllIl.GetCueEffects = function (...) local _IIlIlIIlII = _IIIllllIII.GetCueEffects(...) if _IlIIIlIlll.guide and type(_IIlIlIIlII) == "\116\097\098\108\101" then local _IIIllllIIl = table.clone(_IIlIlIIlII) _IIIllllIIl.Aim = (_IIlIlIIlII.Aim or 0x1) * _IlIIIlIlll.guideMult return _IIIllllIIl end
 return _IIlIlIIlII end
 local _IlIlIIIllI = { _IlllllIIII = nil, _llIIIIIIll = nil, power = nil, spin = nil, at = 0x0, } _IIIllllIII.PredictShot = _IIIllllIII.PredictShot or _IIllIIIIll.PredictShot _IIllIIIIll.PredictShot = function (_IlllllIIII, _llIIIIIIll, power, spin, ...) _IlIlIIIllI.sim = _IlllllIIII _IlIlIIIllI.dir = _llIIIIIIll _IlIlIIIllI.power = power _IlIlIIIllI.spin = spin _IlIlIIIllI.at = os.clock() return _IIIllllIII.PredictShot(_IlllllIIII, _llIIIIIIll, power, spin, ...) end
 local _lllIIIIIII = nil _IIIllllIII.PixelToTable = _IIIllllIII.PixelToTable or _IIlIIllIII.PixelToTable _IIlIIllIII.PixelToTable = function (renderer, ...) if renderer then _lllIIIIIII = renderer end
 return _IIIllllIII.PixelToTable(renderer, ...) end
 local _IIIlllIlIl = {} local function _lIIIIIllII() local _IIIllIIllI = {} for _, inst in ipairs(workspace:GetDescendants()) do if inst:IsA("\077\101\115\104\080\097\114\116") then local _IIIIlllIII = inst.Name:match("\094\066\097\108\108\040\037\100\043\041\036") if _IIIIlllIII then _IIIllIIllI[tonumber(_IIIIlllIII)] = inst end
 end
 end
 _IIIlllIlIl = _IIIllIIllI end
 local function _lIlIIIIIll(_IIIllIIIll, b) local function _lllIllIIlI(_lIIllllIII) return _lIIllllIII[0x1][0x1] * (_lIIllllIII[0x2][0x2] * _lIIllllIII[0x3][0x3] - _lIIllllIII[0x2][0x3] * _lIIllllIII[0x3][0x2]) - _lIIllllIII[0x1][0x2] * (_lIIllllIII[0x2][0x1] * _lIIllllIII[0x3][0x3] - _lIIllllIII[0x2][0x3] * _lIIllllIII[0x3][0x1]) + _lIIllllIII[0x1][0x3] * (_lIIllllIII[0x2][0x1] * _lIIllllIII[0x3][0x2] - _lIIllllIII[0x2][0x2] * _lIIllllIII[0x3][0x1]) end
 local _lIIlllIIII = _lllIllIIlI(_IIIllIIIll) if math.abs(_lIIlllIIII) < 1e-0x6 then return nil end
 local function _IlIlIllIll(col) local _lIIllllIII = {} for _llIIIIIIll = 0x1, 0x3 do _lIIllllIII[_llIIIIIIll] = { _IIIllIIIll[_llIIIIIIll][0x1], _IIIllIIIll[_llIIIIIIll][0x2], _IIIllIIIll[_llIIIIIIll][0x3] } _lIIllllIII[_llIIIIIIll][col] = b[_llIIIIIIll] end
 return _lIIllllIII end
 return _lllIllIIlI(_IlIlIllIll(0x1)) / _lIIlllIIII, _lllIllIIlI(_IlIlIllIll(0x2)) / _lIIlllIIII, _lllIllIIlI(_IlIlIllIll(0x3)) / _lIIlllIIII end
 local function _IlIlIlIlll() local _IIIIIIllII = {} for _IIIIlllIII, part in pairs(_IIIlllIlIl) do local _IlIIllIIIl = _IlIlIIIllI.sim and _IlIlIIIllI.sim.Balls[_IIIIlllIII] if _IlIIllIIIl and _IlIIllIIIl.Position then table.insert(_IIIIIIllII, { p = _IlIIllIIIl.Position, w = part.Position }) end
 end
 if #_IIIIIIllII < 0x4 then return nil end
 local _lIIlIIIIII, iB, best = 0x1, 0x2, -0x1 for i = 0x1, #_IIIIIIllII do for j = i + 0x1, #_IIIIIIllII do local _lIIIlIlIll = (_IIIIIIllII[i].p - _IIIIIIllII[j].p).Magnitude if _lIIIlIlIll > best then best = _lIIIlIlIll _lIIlIIIIII, iB = i, j end
 end
 end
 local _IIIIlllllI, best2 = nil, -0x1 for i = 0x1, #_IIIIIIllII do if i ~= _lIIlIIIIII and i ~= iB then local _lIIIlIlIll = (_IIIIIIllII[i].p - _IIIIIIllII[_lIIlIIIIII].p).Magnitude + (_IIIIIIllII[i].p - _IIIIIIllII[iB].p).Magnitude if _lIIIlIlIll > best2 then best2 = _lIIIlIlIll _IIIIlllllI = i end
 end
 end
 if not _IIIIlllllI then return nil end
 local _IIIllllIII, B, C = _IIIIIIllII[_lIIlIIIIII], _IIIIIIllII[iB], _IIIIIIllII[_IIIIlllllI] if math.abs((B.p.X - _IIIllllIII.p.X) * (C.p.Y - _IIIllllIII.p.Y) - (B.p.Y - _IIIllllIII.p.Y) * (C.p.X - _IIIllllIII.p.X)) < 0x1 then return nil end
 local _IIIllIIIll = { { 0x1, _IIIllllIII.p.X, _IIIllllIII.p.Y }, { 0x1, B.p.X, B.p.Y }, { 0x1, C.p.X, C.p.Y } } local _lIIlIlIIII, exx, exy = _lIlIIIIIll(_IIIllIIIll, { _IIIllllIII.w.X, B.w.X, C.w.X }) local _IlIIIlllII, eyx, eyy = _lIlIIIIIll(_IIIllIIIll, { _IIIllllIII.w.Y, B.w.Y, C.w.Y }) local _lIlIlllIlI, ezx, ezy = _lIlIIIIIll(_IIIllIIIll, { _IIIllllIII.w.Z, B.w.Z, C.w.Z }) if not (_lIIlIlIIII and _IlIIIlllII and _lIlIlllIlI) then return nil end
 local _IIllIlIIll = Vector3.new(_lIIlIlIIII, _IlIIIlllII, _lIlIlllIlI) local _IlIlIIllll = Vector3.new(exx, eyx, ezx) local _llIlIlIIlI = Vector3.new(exy, eyy, ezy) for i = 0x1, #_IIIIIIllII do if i ~= _lIIlIIIIII and i ~= iB and i ~= _IIIIlllllI then local _llllIlIIIl = _IIIIIIllII[i] local _IIlIIlIIll = _IIllIlIIll + _IlIlIIllll * _llllIlIIIl.p.X + _llIlIlIIlI * _llllIlIIIl.p.Y if (_IIlIIlIIll - _llllIlIIIl.w).Magnitude > 0x1 then return nil end
 break end
 end
 return function (p) return _IIllIlIIll + _IlIlIIllll * p.X + _llIlIlIIlI * p.Y end
 end
 local _lIIIIlIlll = { [0x1] = Color3.fromRGB(0xFF, 0xD2, 0x0), [0x2] = Color3.fromRGB(0x28, 0x6E, 0xFF), [0x3] = Color3.fromRGB(0xFF, 0x32, 0x32), [0x4] = Color3.fromRGB(0x96, 0x28, 0xDC), [0x5] = Color3.fromRGB(0xFF, 0x8C, 0x0), [0x6] = Color3.fromRGB(0x0, 0xB9, 0x50), [0x7] = Color3.fromRGB(0xAA, 0x32, 0x32), [0x8] = Color3.fromRGB(0xD2, 0xD2, 0xD2), } local _llIlllIIIl = nil local _llIlIlllll = nil local _lllIllIIII = nil local _IIIllIlIIl = 0x0 local function _lIIIllIIIl() if not (_IlIlIIIllI.sim and _IlIlIIIllI.dir and _IlIlIIIllI.power) then return end
 local _lIlIIIlIIl, result = pcall( function () local _llIIIIllII = _IIllIIIIll.Clone(_IlIlIIIllI.sim) local _lIlllIIllI = _llIIIIllII and _llIIIIllII.Balls[_lIIIllIlIl] if not _lIlllIIllI then return nil end
 _IIllIIIIll.Shoot(_llIIIIllII, _IlIlIIIllI.dir, _IlIlIIIllI.power, _IlIlIIIllI.spin or Vector2.zero) local _llIIIIIlll = {} for _IIIIlllIII, b in pairs(_llIIIIllII.Balls) do if _IIIIlllIII ~= _lIIIllIlIl then _llIIIIIlll[_IIIIlllIII] = b.Position end
 end
 local _IlllIlIlII = {} local _IIlIIlllll = {} local _lIllIIllll = nil for _ = 0x1, 0x96 do _IIllIIIIll.Step(_llIIIIllII, _llllllllll.FixedDelta) table.insert(_IlllIlIlII, _lIlllIIllI.Position) for _IIIIlllIII, b in pairs(_llIIIIllII.Balls) do if _IIIIlllIII ~= _lIIIllIlIl and _llIIIIIlll[_IIIIlllIII] and (b.Position - _llIIIIIlll[_IIIIlllIII]).Magnitude > 0.05 then _IIlIIlllll[_IIIIlllIII] = _IIlIIlllll[_IIIIlllIII] or {} table.insert(_IIlIIlllll[_IIIIlllIII], b.Position) end
 end
 if not _lIllIIllll and next(_IIlIIlllll) then _lIllIIllll = #_IlllIlIlII end
 if _llIIIIllII.Settled then break end
 end
 local function _IlIlllIIll(pts) local _IIIIlllIII = #pts if _IIIIlllIII <= 0x2 then return pts end
 local _lIlllIlIlI = {} local _lIllIlIIIl = math.max(0x1, math.floor(_IIIIlllIII / 0x18)) for i = 0x1, _IIIIlllIII - 0x1, _lIllIlIIIl do table.insert(_lIlllIlIlI, pts[i]) end
 table.insert(_lIlllIlIlI, pts[_IIIIlllIII]) return _lIlllIlIlI end
 local _IlIlIIIlII = {} for _IIIIlllIII, pts in pairs(_IIlIIlllll) do table.insert(_IlIlIIIlII, { _IIIIlllIII = _IIIIlllIII, dist = (pts[#pts] - pts[0x1]).Magnitude }) end
 table.sort(_IlIlIIIlII, function (a, b) return a.dist > b.dist end
 ) local _IIIIllIIII = { { pts = _IlIlllIIll(_IlllIlIlII), color = Color3.fromRGB(0xFF, 0xFF, 0xFF), thickness = 0x2 }, } for i = 0x1, math.min(0x3, #_IlIlIIIlII) do local _IIlllIlIII = _IlIlIIIlII[i] table.insert(_IIIIllIIII, { pts = _IlIlllIIll(_IIlIIlllll[_IIlllIlIII.n]), color = _lIIIIlIlll[_IIlllIlIII.n % 0x8 == 0x0 and 0x8 or (_IIlllIlIII.n > 0x8 and _IIlllIlIII.n - 0x8 or _IIlllIlIII.n)], thickness = i == 0x1 and 0x3 or 0x2, }) end
 return { _IIIIllIIII = _IIIIllIIII, _llIlIlllll = _lIllIIllll and _IlllIlIlII[_lIllIIllll] or nil } end
 ) if _lIlIIIlIIl and result then _llIlllIIIl = result.lines _llIlIlllll = result.ghost end
 end
 local _IlIlIllIlI = {} local _lIllIlIIlI = 0x6E local _llIIlIllll = nil local _lIIIlllIlI = pcall( function () local _lllIIIllIl = Drawing.new("\076\105\110\101") _lllIIIllIl:Remove() end
 ) local function _IllIlIIIII() for _, _lllIIIllIl in ipairs(_IlIlIllIlI) do _lllIIIllIl.Visible = false end
 if _llIIlIllll then _llIIlIllll.Visible = false end
 end
 if _lIIIlllIlI then for _ = 0x1, _lIllIlIIlI do local _lllIIIllIl = Drawing.new("\076\105\110\101") _lllIIIllIl.Thickness = 0x2 _lllIIIllIl.Visible = false table.insert(_IlIlIllIlI, _lllIIIllIl) end
 _llIIlIllll = Drawing.new("\067\105\114\099\108\101") _llIIlIllll.Thickness = 0x2 _llIIlIllll.NumSides = 0x18 _llIIlIllll.Radius = 0x9 _llIIlIllll.Filled = false _llIIlIllll.Visible = false end
 local function _lIlIIIIIll(p) local _llIIIIIIll = _lllIIIIIII if _llIIIIIIll and _llIIIIIIll.Root and _llIIIIIIll.Root.Parent then local _lIlIIIlIIl, absPos, absSize = pcall( function () return _IIlIIllIII.GetScreenRect(_llIIIIIIll) end
 ) if _lIlIIIlIIl and absPos and absSize and absSize.X > 0x0 and absSize.Y > 0x0 then return Vector2.new( absPos.X + (p.X / _IllllllllI + 0.5) * absSize.X, absPos.Y + (0.5 - p.Y / _llllllIIII) * absSize.Y ) end
 end
 local _lIIlIlIlIl = _IlIlIlIlll() local _IIllllIIIl = _lIIlIlIlIl and workspace.CurrentCamera if not _IIllllIIIl then return nil end
 local _IllIIlIlll = _IIllllIIIl:WorldToViewportPoint(_lIIlIlIlIl(p)) if _IllIIlIlll.Z <= 0x0 then return nil end
 return Vector2.new(_IllIIlIlll.X, _IllIIlIlll.Y) end
 local function _lIIIIIlllI() if not (_lIIIlllIlI and _IlIIIlIlll.predict and _llIlllIIIl and _IlIlIIIllI.sim) or os.clock() - _IlIlIIIllI.at > 0.3 then _IllIlIIIII() return end
 local _IllllIIIII = 0x0 for _, line in ipairs(_llIlllIIIl) do local _lIIllIlIII = nil for _, pt in ipairs(line.pts) do local _IIIlIlllIl = _lIlIIIIIll(pt) if _IIIlIlllIl and _lIIllIlIII then _IllllIIIII += 0x1 if _IllllIIIII <= _lIllIlIIlI then local _lIIIlIlIll = _IlIlIllIlI[_IllllIIIII] _lIIIlIlIll.From = _lIIllIlIII _lIIIlIlIll.To = _IIIlIlllIl _lIIIlIlIll.Color = line.color _lIIIlIlIll.Thickness = line.thickness _lIIIlIlIll.Visible = true end
 end
 _lIIllIlIII = _IIIlIlllIl end
 end
 if _llIlIlllll then local _llllIlllIl = _lIlIIIIIll(_llIlIlllll) if _llllIlllIl then _llIIlIllll.Position = _llllIlllIl _llIIlIllll.Color = Color3.fromRGB(0xFF, 0xFF, 0x78) _llIIlIllll.Visible = true else _llIIlIllll.Visible = false end
 else _llIIlIllll.Visible = false end
 for i = _IllllIIIII + 0x1, _lIllIlIIlI do _IlIlIllIlI[i].Visible = false end
 end
 local _lIIIlIllll _lIIIlIllll = RunService.Heartbeat:Connect( function () if not _IlIIIlIlll.predict then if _llIlllIIIl then _llIlllIIIl = nil _llIlIlllll = nil _IllIlIIIII() end
 return end
 if _IlIlIIIllI.sim and _IlIlIIIllI.dir and _IlIlIIIllI.power then local _IIIIllIllI = string.format( "\037\046\050\102\124\037\046\050\102\124\037\046\050\102\124\037\046\049\102", _IlIlIIIllI.dir.X, _IlIlIIIllI.dir.Y, _IlIlIIIllI.power, _IlIlIIIllI.spin and _IlIlIIIllI.spin.Magnitude or 0x0 ) local _lIlllllIII = os.clock() if _IIIIllIllI ~= _lllIllIIII and _lIlllllIII - _IIIllIlIIl > 0.1 then _lllIllIIII = _IIIIllIllI _IIIllIlIIl = _lIlllllIII _lIIIllIIIl() end
 end
 _lIIIIIlllI() end
 ) local function _lIIIIlIlII() pcall( function () _lIIIlIllll:Disconnect() end
 ) pcall( function () if _llIIlIllIl.GetCueEffects ~= _IIIllllIII.GetCueEffects then _llIIlIllIl.GetCueEffects = _IIIllllIII.GetCueEffects end
 if _IIllIIIIll.PredictShot ~= _IIIllllIII.PredictShot then _IIllIIIIll.PredictShot = _IIIllllIII.PredictShot end
 end
 ) pcall(_IllIlIIIII) for _, _lllIIIllIl in ipairs(_IlIlIllIlI) do pcall( function () _lllIIIllIl:Remove() end
 ) end
 if _llIIlIllll then pcall( function () _llIIlIllll:Remove() end
 ) end
 end
 local function _IIllIIIIII() local _IIIIlllIII = 0x0 for _ in pairs(_IIIlllIlIl) do _IIIIlllIII += 0x1 end
 return _IIIIlllIII end
 _G[_IlllIIllII] = { Destroy = function () _lIIIIlIlII() if _lllllIIlII then pcall( function () _lllllIIlII.Destroy() end
 ) end
 pcall( function () _lllllIlllI:Destroy() end
 ) _G[_IlllIIllII] = nil end
 , Status = function () return { guide = _IlIIIlIlll.guide, guideMult = _IlIIIlIlll.guideMult, predict = _IlIIIlIlll.predict, autix = _IlIIIlIlll.autix, autixSupported = type(queue_on_teleport) == "\102\117\110\099\116\105\111\110", loadstringUrlSet = _IIIllIIIII ~= "", _lIIIlllIlI = _lIIIlllIlI, aimFresh = (os.clock() - _IlIlIIIllI.at) < 0.3, _lllIIIIIII = _lllIIIIIII ~= nil, balls3d = _IIllIIIIII(), hasPaths = _llIlllIIIl ~= nil, pathLines = _llIlllIIIl and #_llIlllIIIl or 0x0, } end
 , SelfTest = function () local _IlllllIIII = _IIllIIIIll.newSimulation() _IIllIIIIll.Reset(_IlllllIIII, require(_IIlIIIIIIl.PoolGeometry).BuildRack(Random.new(0x309))) local _lIlllIIllI = _IlllllIIII.Balls[_lIIIllIlIl] local _IIllIIlIll for _, b in _IIllIIIIll.GetActiveBalls(_IlllllIIII) do if b.Number ~= _lIIIllIlIl then _IIllIIlIll = b break end
 end
 local _llIIIIIIll = (_IIllIIlIll.Position - _lIlllIIllI.Position).Unit local _llIIIlIIlI = { _IlIlIIIllI.sim, _IlIlIIIllI.dir, _IlIlIIIllI.power, _IlIlIIIllI.spin } _IlIlIIIllI.sim, _IlIlIIIllI.dir, _IlIlIIIllI.power, _IlIlIIIllI.spin = _IlllllIIII, _llIIIIIIll, 0.8, Vector2.zero _lIIIllIIIl() local _llIIIIIIll = { _IIIIllIIII = _llIlllIIIl and #_llIlllIIIl or 0x0, _llIlIlllll = _llIlIlllll ~= nil } _IlIlIIIllI.sim, _IlIlIIIllI.dir, _IlIlIIIllI.power, _IlIlIIIllI.spin = _llIIIlIIlI[0x1], _llIIIlIIlI[0x2], _llIIIlIIlI[0x3], _llIIIlIIlI[0x4] _llIlllIIIl, _llIlIlllll = nil, nil return _llIIIIIIll end
 , TestScan = function () _lIIIIIllII() return _IIllIIIIII() end
 , } print( "\091\056\066\097\108\108\065\115\115\105\115\116\093\032\118\050\046\050\032\108\111\097\100\101\100\032\183\032\103\117\105\100\101\032\049\045\049\050\032\040\100\101\102\097\117\108\116\032\055\041\032\183\032\105\109\112\097\099\116\032\112\114\101\100\105\099\116\105\111\110\032\183\032\100\114\097\119\105\110\103\058", _lIIIlllIlI, "\183\032\097\117\116\111\069\120\101\099\058", _IlIIIlIlll.autix and "\097\114\109\101\100" or "\111\102\102", "\183\032\117\114\108\058", _IIIllIIIII ~= "" and "\115\101\116" or "\069\077\080\084\089\032\040\105\115\105\032\109\097\110\117\097\108\041" ) task.spawn( function () while _G[_IlllIIllII] do pcall(_lIIIIIllII) task.wait(0x2) end
 end
 ) end
 ) end
 )(...)
