local globalMultipliers = {
    [HITGROUP_HEAD] = 1,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 1,
    [HITGROUP_RIGHTLEG] = 1
}

hook.Add("ScalePlayerDamage", "CFC_HitgroupDamageModifiers_ApplyDamageMultiplier", function( ply, hitGroup, dmgInfo )
    local inflictor = dmgInfo:GetInflictor()
    if inflictor:IsPlayer() then
        inflictor = inflictor:GetActiveWeapon()
    end

    local damageMultipliers = inflictor.CFCDamageMultipliers
    if not damageMultipliers then return end

    local mul = damageMultipliers[hitGroup] or 1
    local globalMul = globalMultipliers[hitGroup] or 1

    dmgInfo:ScaleDamage(mul * globalMul)
end)

local function SetGlobalDamageMultiplier(hitGroup, mul)
    globalMultipliers[hitGroup] = mul
end
