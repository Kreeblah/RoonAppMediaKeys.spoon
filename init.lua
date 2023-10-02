--- === RoonAppMediaKeys ===
---
--- Override macOS behaviour and send all media keys (play/prev/next/mute/volup/voldown) to Roon.app
local obj = { __gc = true }
--obj.__index = obj
setmetatable(obj, obj)
obj.__gc = function(t)
    t:stop()
end

-- Metadata
obj.name = "RoonAppMediaKeys"
obj.version = "1.0"
obj.author = "Matheus Salmi <mathsalmi@gmail.com>, Chris Jones <cmsj@tenshu.net>, Chris Gelatt <kreeblah@gmail.com>"
obj.homepage = "https://github.com/Kreeblah/RoonAppMediaKeys.spoon"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.eventtap = nil

-- Internal function used to find our location, so we know where to load files from
local function script_path()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
end
obj.spoonPath = script_path()

function obj:init()
    self.eventtap = hs.eventtap.new({hs.eventtap.event.types.systemDefined}, self.mediaKeyCallback)
end

function obj.mediaKeyCallback(event)
    local data = event:systemKey()
    local roonApp = hs.application.applicationsForBundleID('com.roon.Roon')[1]

    -- ignore when Roon isn't running
    if roonApp == nil then
        return false, nil
    end

    -- ignore everything but media keys (play/prev/next/mute/volup/voldown)
    if data["key"] ~= "PLAY" and data["key"] ~= "FAST" and data["key"] ~= "REWIND" and data["key"] ~= "MUTE" and data["key"] ~= "SOUND_UP" and data["key"] ~= "SOUND_DOWN" then
        return false, nil
    end

    -- handle action
    if data["down"] == false or data["repeat"] == true then
        if data["key"] == "PLAY" then
            hs.eventtap.keyStroke({}, "space", 0, roonApp)
        elseif data["key"] == "FAST" then
            hs.eventtap.keyStroke({"cmd"}, "k", 0, roonApp)
        elseif data["key"] == "REWIND" then
            hs.eventtap.keyStroke({"cmd"}, "j", 0, roonApp)
        elseif data["key"] == "MUTE" then
            hs.eventtap.keyStroke({"ctrl"}, "m", 0, roonApp)
        elseif data["key"] == "SOUND_UP" then
            hs.eventtap.keyStroke({"cmd"}, "up", 0, roonApp)
        elseif data["key"] == "SOUND_DOWN" then
            hs.eventtap.keyStroke({"cmd"}, "down", 0, roonApp)
        end
    end

    -- consume event
    return true, nil
end

--- RoonAppMediaKeys:start()
--- Method
--- Starts the hs.eventtap that powers this Spoon
---
--- Parameters:
---  * None
---
--- Returns:
---  * The RoonAppMediaKeys object
function obj:start()
    if self.eventtap:isEnabled() ~= true then
        self.eventtap:start()
    end
    return self
end

--- RoonAppMediaKeys:stop()
--- Method
--- Stops the hs.eventtap that powers this Spoon
---
--- Parameters:
---  * None
---
--- Returns:
---  * The RoonAppMediaKeys object
function obj:stop()
    if self.eventtap:isEnabled() then
        self.eventtap:stop()
    end
    return self
end

return obj