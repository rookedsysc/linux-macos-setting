-- key mapping for vim 
-- Convert input soruce as English and sends 'escape' if inputSource is not English.
-- Sends 'escape' if inputSource is English.
-- key bindding reference --> https://www.hammerspoon.org/docs/hs.hotkey.html
-- key mapping for vim 
-- Convert input soruce as English and sends 'escape' if inputSource is not English.
-- Sends 'escape' if inputSource is English.
-- key bindding reference --> https://www.hammerspoon.org/docs/hs.hotkey.html
local inputEnglish = "com.apple.keylayout.ABC"
local esc_bind

-- 맥 잠들기 모드로 진입
hs.hotkey.bind({ 'ctrl', 'cmd', 'shift' }, 'L', function()
    hs.caffeinate.lockScreen()
end)
-- END

-- 'escape' 키를 눌렀을 때의 동작을 담은 함수와 이를 트리거하는 단축키 설정
function convert_to_eng_with_esc()
    local inputSource = hs.keycodes.currentSourceID()
    if not (inputSource == inputEnglish) then
        hs.keycodes.currentSourceID(inputEnglish)
    end
    esc_bind:disable()
    hs.eventtap.keyStroke({}, 'escape')
    esc_bind:enable()
end

esc_bind = hs.hotkey.new({}, 'escape', convert_to_eng_with_esc):enable()
-- END

-- REFERENCE : https://www.philgineer.com/2021/01/m1-hammerspoon.html
-- GITHUB : https://github.com/hetima/hammerspoon-foundation_remapping
--
-- START cmd to f18
local FRemap = require('foundation_remapping')
local remapper = FRemap.new()
remapper:remap('rcmd', 'f18')
remapper:register()
-- END
