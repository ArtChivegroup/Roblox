
# 🧩 BloxHub GUI Framework – Product Requirement Document (Final Customizable Edition)

**Author:** BloxHub  
**Version:** 2.0  
**Last Update:** 2025-11-12  

---

## 🏁 1. Overview  

**BloxHub GUI Framework** adalah *universal Roblox GUI system* berbasis satu file Lua yang menyediakan **komponen-komponen dasar UI** (button, slider, toggle, keybind, popup, tab, container, dll) yang sepenuhnya **customizable dan composable**.  
Framework ini **tidak mengunci tampilan atau struktur** seperti template, melainkan menyediakan **“building blocks”** untuk developer menyusun layout mereka sendiri — termasuk hotkey, mouse input, atau kombinasi event khusus.  

Tampilan default yang disertakan hanyalah **contoh grid 6 tile (ESP, Chams, Aimbot, dll)**, bukan UI final. Semua bisa diganti, dihapus, atau dikustomisasi.  

---

## 🎯 2. Core Goals  

1. **Single Source File:** Semua logika dan komponen UI dalam satu `.lua` file.  
2. **Fully Customizable:**  
   - Semua elemen UI (ukuran, warna, posisi, font, callback) bisa diubah atau di-clone.  
   - Developer bebas mengatur layout dan interaksi.  
3. **Cross-Platform Support:** Berjalan pada Roblox PC dan Mobile.  
4. **Dynamic Input System:**  
   - Hotkey editor dengan dukungan keyboard, klik kiri/kanan, dan kombinasi modifier (`Ctrl`, `Alt`, `Shift`).  
5. **Component-based Design:**  
   - Framework menyediakan komponen dasar, bukan layout statis.  
6. **Popup & Submenu Support:**  
   - Bisa menambah *context menu*, *mini popup*, atau *subpanel* pada setiap button/tab.  

---

## 🧱 3. Architecture & Structure  

### Struktur Internal
```lua
local BloxHub = {
    Core = {},       -- Sistem utama: event handler, input, animasi
    UI = {},         -- Komponen GUI (Frame, Slider, Button, Tab, Popup)
    Elements = {},   -- Generator API untuk membuat elemen
    Settings = {},   -- Konfigurasi default & user
    State = {},      -- Status GUI (visible, hotkey, aktif tab, dll)
}
```

### Modul Internal
| Modul | Fungsi |
|--------|--------|
| **Core** | Inisialisasi GUI, toggle system, render management |
| **Input** | Handler untuk keyboard, mouse, dan touch |
| **Elements** | API pembuatan elemen UI (Button, Slider, Toggle, Keybind, Popup) |
| **Layout** | Utility untuk menyusun posisi elemen (Grid, VerticalStack, Floating) |
| **Theme** | Sistem warna/font yang bisa diubah runtime |
| **Persistence** | Save/load config (hotkey, posisi, warna, dll) |

---

## 🧰 4. Provided UI Components  

BloxHub menyediakan **komponen kecil modular** yang dapat digunakan ulang:

| Komponen | Deskripsi | Customizable |
|-----------|------------|--------------|
| `Frame` | Kontainer utama/tab | ✅ |
| `Button` | Tombol klik biasa | ✅ |
| `Toggle` | Switch on/off dengan animasi | ✅ |
| `Slider` | Kontrol nilai numerik dengan label | ✅ |
| `Dropdown` | Pilihan list | ✅ |
| `Keybind` | Editor key/mouse | ✅ |
| `Popup` | Submenu / modal kecil | ✅ |
| `Tab` | Grup konten dengan judul | ✅ |
| `TextBox` | Input teks/script | ✅ |
| `Label` | Teks statis | ✅ |
| `Icon` | Tombol kecil floating (toggle GUI) | ✅ |

Semua komponen dapat diatur: posisi (`UDim2`), ukuran, warna, font, callback, dan event handler-nya.  

---

## 💡 5. Example Developer API  

### Membuat GUI Baru
```lua
local UI = loadstring(game:HttpGet("...BloxHub.lua"))()
local Main = UI:CreateWindow("My GUI", {Resizable = true})

local Tab = Main:CreateTab("Features")
Tab:AddButton("Spawn Dummy", function() print("Spawn!") end)
Tab:AddSlider("FOV", 1, 100, 60, function(v) print("FOV:", v) end)
Tab:AddToggle("Enable ESP", false, function(state) print("ESP:", state) end)
Tab:AddKeybind("Aimbot Key", Enum.KeyCode.E, function(key) print("Key:", key) end)
Tab:AddPopup("Mini Menu", {"Option 1", "Option 2"}, function(choice) print(choice) end)
```

---

## 🎮 6. Input & Hotkey System  

### Dukungan Input
- Keyboard (`UserInputService.InputBegan`)
- Mouse:
  - `MouseButton1` (klik kiri)
  - `MouseButton2` (klik kanan)
- Kombinasi: `Ctrl + E`, `Alt + Mouse1`, dll.  

### Hotkey Customization
- Developer dapat membuat `Keybind` component.  
- Saat diubah, GUI masuk “listening mode”: menunggu input apapun (key/mouse).  
- Jika user klik kanan → keybind diset ke “Mouse2”.  

---

## 📐 7. Layout & Visual Rules  

### Prinsip:
- Semua layout **bebas**: tidak dipaksa grid statis.  
- Disediakan helper seperti:
  - `UI:CreateGrid(columns, padding)`
  - `UI:CreateVerticalStack(spacing)`
- Developer bisa menambah popup/tab tambahan di bawah menu utama.  

### Default Style (bisa diubah)
| Elemen | Warna | CornerRadius |
|---------|--------|---------------|
| Background | #0F0F0F | 10 |
| Accent | #0078FF | 8 |
| Text | #FFFFFF | - |
| Highlight | #00A2FF | 6 |

---

## 🧠 8. Technical Implementation  

### Struktur file
```lua
-- Bagian utama
1. Init CoreGui + ScreenGui
2. Build default theme
3. Define component factory
4. Register input handler
5. Create default example (6 tiles)
6. Return API (BloxHub.Elements)
```

### Tween & State
- Menggunakan TweenService untuk hover/active feedback.  
- Semua instance direuse (tidak recreate saat toggle).  

### Popup System
- Bisa dipanggil via:
  ```lua
  local popup = UI:CreatePopup("Settings", {"Option A", "Option B"}, callback)
  popup:Show(position)
  ```

---

## 💾 9. Settings & Persistence  

- Semua preferensi (theme, hotkey, posisi) disimpan via:
  - `writefile("BloxHub_Config.json", HttpService:JSONEncode(data))`
  - Atau fallback ke `getgenv().BloxHubSettings`
- Load otomatis saat GUI dibuka ulang.

---

## 🔮 10. Extensibility  

Framework ini bisa dikembangkan untuk:
- Membuat GUI internal executor.  
- Membuat custom script hub.  
- Membuat control panel modular (ESP, tools, UI helper).  
- Dipakai multi-script dengan API:
  ```lua
  local tab = BloxHub:GetTab("MyTab") or BloxHub:CreateTab("MyTab")
  tab:AddToggle(...)
  ```

---

## ✅ 11. Acceptance Criteria  

| Kriteria | Deskripsi |
|-----------|------------|
| Semua komponen UI dapat dibuat dan diubah lewat API | ✅ |
| Mendukung hotkey keyboard dan mouse | ✅ |
| Popup & sub-menu dapat dibuat dinamis | ✅ |
| GUI dapat disusun ulang sepenuhnya | ✅ |
| Semua fungsi berjalan di PC & Mobile | ✅ |
| Semua ada di 1 file Lua | ✅ |

---

## 🧩 12. Summary  

BloxHub GUI Framework bukan template, tapi **modular system** dengan elemen-elemen kecil yang bisa dikombinasikan.  
Contoh default (6 tile) hanyalah *preview layout*.  
Developer bebas menambahkan, menghapus, atau mengatur ulang semua bagian UI, termasuk menambahkan popup, submenu, dan logic interaktif lainnya.  
