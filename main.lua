--- STEAMODDED HEADER
--- MOD_NAME: Balatro Mod For Max
--- MOD_ID: BalatroModForMax
--- MOD_AUTHOR: [Slimeinator]
--- MOD_DESCRIPTION: Balatro mod for max's 3rd year anniversary




    -----------------------MOD CODE----------------------------
    SMODS.Atlas{
        key = 'Jokers',
        path = 'Jokers.png',
        px = 71,
        py = 95
    }

    SMODS.Joker{
        key = 'joker2',
        loc_txt = {
            name = 'Spring Garden',
            text = {
                "This joker gains",
                "{C:chips}+4 Chips{} when each",
                "played {C:attention}Club{} card is scored",
                "{C:inactive}(Currently {C:chips}#1#{C:inactive} Chips)"
            }
        },
        config = {extra = {chips=0, chip_mod = 4}},
        rarity = 2,
        atlas = 'Jokers',
        pos = {x = 0, y = 0},
        cost = 6,
        loc_vars = function(self, info_queue, card)
                return {vars = {card.ability.extra.chips,
                card.ability.extra.chip_mod}}
        end,
        discovered = true,
        unlocked = true,
        calculate = function(self,card,context)
            if self.debuff then return nil end
            if context.individual and context.cardarea == G.play and not SMODS.has_no_rank(context.other_card) and not context.blueprint then
                if not context.other_card.debuff and context.other_card:is_suit('Clubs') then
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.Chips
                    }
                end
            elseif context.joker_main and context.cardarea == G.jokers then
                return {
                    chips = card.ability.extra.chips,
                    colour = G.C.CHIPS
                }
            end
        end
    }

