// complete copy from https://github.com/FPtje/DarkRP/blob/master/gamemode/modules/fadmin/fadmin/playeractions/teleport/sv_init.lua
// TODO: change this!
local function zapEffect(target)
    local effectdata = EffectData()
    effectdata:SetStart(target:GetShootPos())
    effectdata:SetOrigin(target:GetShootPos())
    effectdata:SetScale(1)
    effectdata:SetMagnitude(1)
    effectdata:SetScale(3)
    effectdata:SetRadius(1)
    effectdata:SetEntity(target)
    for i = 1, 100, 1 do
        timer.Simple(1 / i, function()
            util.Effect("TeslaHitBoxes", effectdata, true, true)
        end)
    end
    local Zap = math.random(1,9)
    if Zap == 4 then Zap = 3 end
    target:EmitSound("ambient/energy/zap" .. Zap .. ".wav")
end

// A list of available personalities, there should be two!!!
local personalities = {
    [1] = {
        name = "Uno",
        description = "Uno is a very calm and friendly person. He is very polite and will never say no to a friend.",
        color = Color(0, 255, 0),
        callback = function(ply)
            ply:SetWalkSpeed(200)
            ply:SetRunSpeed(400)
        end,
    },
    [2] = {
        name = "Dos",
        description = "Dos is a very angry and violent person. He always gets himself into trouble.",
        color = Color(255, 0, 0),
        callback = function(ply)
            ply:SetWalkSpeed(400)
            ply:SetRunSpeed(600)
        end,
    },
    // I made github copilot generate a personality, he's canon now.
    /*
    [3] = {
        name = "Tres",
        description = "Tres is a very friendly and social person. He is very kind to everyone he meets.",
        color = Color(0, 0, 255),
        callback = function(ply)
            ply:SetWalkSpeed(300)
            ply:SetRunSpeed(500)
        end,
    },
    */
}

// This is where we set the personality when we split.
function GM:SetSplitPersonality(player, personality)
    if personality > #personalities then
        personality = 1
    end
    if not personalities[personality] then return end // what???
    personalities[personality].callback(player)
    player:SetSkin(personality-1)
    player:SetNWInt("SplitPersonality", personality)
    zapEffect(player)
    //print("[Split Bullet: Anarchy] " .. player:Nick() .. " has changed their personality to " .. personalities[personality].name.." ("..personality..")")
end

// Splitting server-side.
util.AddNetworkString("SplitBullet.Network.Split")
net.Receive("SplitBullet.Network.Split", function(len, ply)
    hook.Run("SetSplitPersonality", ply, ply:GetNWInt("SplitPersonality", 1)+1)
end)
