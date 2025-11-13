--[[
    BloxHub GUI Framework - Showcase Example
    
    Deskripsi:
    Script ini memuat BloxHub GUI Framework dari GitHub dan membuat
    sebuah jendela UI untuk mendemonstrasikan semua komponen yang tersedia,
    seperti tombol, toggle, slider, dropdown, keybind, dan banyak lagi.
    
    Cara Kerja:
    1. Memuat library menggunakan loadstring(game:HttpGet(...)).
    2. Membuat jendela utama (Window).
    3. Mendaftarkan hotkey (RightShift) untuk membuka/menutup GUI.
    4. Membuat ikon floating yang juga bisa membuka/menutup GUI.
    5. Membuat beberapa tab (Features, Visuals, Settings).
    6. Mengisi setiap tab dengan berbagai komponen UI untuk showcase.
]]

-- URL ke file source BloxHub GUI Framework Anda
local GITHUB_URL = "https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILib/source.lua"

-- Muat library dari GitHub
local BloxHub = loadstring(game:HttpGet(GITHUB_URL))()

-- Periksa apakah library berhasil dimuat
if not BloxHub then
    warn("Gagal memuat BloxHub GUI Framework. Periksa koneksi internet atau URL.")
    return
end

-- =========================================================================
-- MEMBUAT JENDELA UTAMA
-- =========================================================================

-- Buat jendela utama dengan judul "BloxHub Showcase"
-- Konfigurasi: { Size = UDim2.new(...), Position = UDim2.new(...) } bisa ditambahkan jika perlu
local MainWindow = BloxHub:CreateWindow("BloxHub Showcase")

-- Daftarkan hotkey 'RightShift' untuk membuka/menutup GUI
MainWindow:RegisterHotkey("ToggleGUI", Enum.KeyCode.RightShift, function()
    MainWindow:Toggle()
end)

-- Buat ikon floating yang bisa di-drag untuk membuka/menutup GUI dengan mudah
BloxHub:CreateFloatingIcon(MainWindow, {
    Text = "Toggle Menu", 
    ShowOnMinimize = true -- Tampilkan ikon saat GUI ditutup
})


-- =========================================================================
-- TAB 1: FITUR UTAMA (MAIN FEATURES)
-- =========================================================================

local featuresTab = MainWindow:CreateTab("Main Features")

featuresTab:AddLabel("Komponen Dasar", { Bold = true, TextSize = 16 })

-- Contoh Button: Menampilkan notifikasi saat diklik
featuresTab:AddButton("Tampilkan Notifikasi", function()
    BloxHub:Notify("Info", "Ini adalah contoh notifikasi.", 3, "Info")
end)

-- Contoh Toggle: Mengaktifkan/menonaktifkan sebuah fitur
featuresTab:AddToggle("Enable Fly", false, function(state)
    print("Fly state:", state)
    BloxHub:Notify("Fitur Diubah", "Fly sekarang " .. (state and "AKTIF" or "NONAKTIF"), 2, "Success")
end)

-- Contoh Slider: Mengatur nilai numerik seperti Field of View (FOV)
featuresTab:AddSlider("FOV", 30, 120, 90, function(value)
    print("FOV diatur ke:", value)
end)

-- Contoh Keybind: Mengatur hotkey untuk sebuah aksi
featuresTab:AddKeybind("Aimbot Key", Enum.KeyCode.E, function(keyCode, inputType, keyName)
    print("Aimbot key diatur ke:", keyName)
    BloxHub:Notify("Keybind Disimpan", "Aimbot key sekarang: " .. keyName, 3, "Info")
end)

-- Contoh TextBox: Input teks dari pengguna
featuresTab:AddTextBox("Nama Player", "Masukkan nama...", function(text, enterPressed)
    if enterPressed then
        print("Nama yang dimasukkan:", text)
        BloxHub:Notify("Input Diterima", "Halo, " .. text, 3, "Success")
    end
end)


-- =========================================================================
-- TAB 2: VISUAL & LAINNYA
-- =========================================================================

local visualsTab = MainWindow:CreateTab("Visuals & More")

visualsTab:AddLabel("Opsi Visual", { Bold = true, TextSize = 16 })

-- Contoh beberapa Toggle
visualsTab:AddToggle("ESP (Player)", true)
visualsTab:AddToggle("Chams", false)
visualsTab:AddToggle("Tracers", true)

-- Pembatas visual antar seksi
visualsTab:AddDivider()

visualsTab:AddLabel("Opsi Lanjutan", { Bold = true, TextSize = 16 })

-- Contoh Dropdown: Memilih dari beberapa opsi yang tersedia
visualsTab:AddDropdown("ESP Mode", {"Box", "Corner", "Name Only", "Healthbar"}, function(choice)
    print("ESP Mode dipilih:", choice)
    BloxHub:Notify("Opsi Dipilih", "Mode ESP diubah ke " .. choice, 2)
end)

visualsTab:AddDropdown("Target Part", {"Head", "Torso", "HumanoidRootPart"}, function(choice)
    print("Target Part dipilih:", choice)
end)


-- =========================================================================
-- TAB 3: PENGATURAN (SETTINGS)
-- =========================================================================

local settingsTab = MainWindow:CreateTab("Settings")

settingsTab:AddLabel("Kustomisasi Tampilan", { Bold = true, TextSize = 16 })

-- Contoh Dropdown untuk mengganti tema UI secara real-time
settingsTab:AddDropdown("UI Theme", {"Dark", "Light", "Purple", "Green"}, function(themeName)
    BloxHub:SetTheme(themeName)
    BloxHub:Notify("Tema Diubah", "Tema UI sekarang: " .. themeName, 2)
end)

settingsTab:AddDivider()

settingsTab:AddLabel("Manajemen Konfigurasi", { Bold = true, TextSize = 16 })

-- Tombol untuk menyimpan konfigurasi UI saat ini (posisi window, dll)
settingsTab:AddButton("Save Config", function()
    local success = BloxHub:SaveConfig()
    if success then
        BloxHub:Notify("Sukses", "Konfigurasi berhasil disimpan.", 2, "Success")
    else
        BloxHub:Notify("Gagal", "Tidak dapat menyimpan konfigurasi.", 3, "Error")
    end
end)

-- Tombol untuk memuat konfigurasi yang sudah disimpan
settingsTab:AddButton("Load Config", function()
    BloxHub:LoadConfig()
    BloxHub:Notify("Info", "Konfigurasi berhasil dimuat.", 2, "Info")
end)

settingsTab:AddButton("Destroy GUI", function()
    -- Fungsi ini akan menghapus seluruh GUI dari layar
    -- Berguna untuk clean-up saat script di-unload
    BloxHub:Destroy()
end)

-- Notifikasi akhir bahwa setup selesai
BloxHub:Notify(
    "Showcase Siap",
    "Tekan RightShift untuk membuka/menutup menu.",
    5,
    "Success"
)
