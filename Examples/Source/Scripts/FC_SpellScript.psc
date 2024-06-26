scriptName FC_SpellScript extends Quest

MagicEffect Property EffectModel Auto
MagicEffect Property EffectBase Auto
Spell Property StatsSource Auto
Spell Property ModelSource Auto

Event OnInit()
    RegisterForSingleUpdate(2)
EndEvent

Event OnUpdate()
    Spell newSpell = DynamicPersistentForms.Create(StatsSource) as Spell
    MagicEffect newEffect = DynamicPersistentForms.Create(EffectBase) as MagicEffect
    if(newSpell && newEffect)
        newSpell.SetName("My New Dynamic Spell")
        DynamicPersistentForms.SetSpellCostOverride(newSpell, 1000)
        DynamicPersistentForms.SetSpellChargeTime(newSpell,5)
        ; DynamicPersistentForms.SetSpellAutoCalculate(newSpell, true); Set to true to disable override

        DynamicPersistentForms.ClearMagicEffects(newSpell)
        DynamicPersistentForms.AddMagicEffect(newSpell, newEffect, 100, 100, 1, 100)
        DynamicPersistentForms.CopyAppearance(ModelSource, newSpell)
        DynamicPersistentForms.CopyAppearance(EffectModel, newEffect)
        Game.GetPlayer().AddSpell(newSpell,false)
        Game.GetPlayer().AddSpell(StatsSource,false)
        Game.GetPlayer().AddSpell(ModelSource,false)
    endif
EndEvent