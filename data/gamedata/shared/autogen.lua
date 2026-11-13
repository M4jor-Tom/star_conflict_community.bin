-- общие настройки
Autogen =
{
    sellCreditsPrice    = 1,    -- цена продажи со склада
    upgradeModPerLevel  = 0.2,  -- прирост каждого сролленного значения за уровень апгрейда

    -- формула для вычисления стоимости разных действий (сколько нужно кредитов/экспы для апгрейда, сколько даст экспы в качестве донора для апгрейда других модулей)
    -- base + ( ( pow( affix_sum * ( 1 + average_roll ) * ( 1 + ( average_rank / rank_coef ) * base_coef ), 2) / divide_coef ) * upgrade_coef )
    -- где average_roll - средний ролл, average_rank - средний ранг аффиксов, affix_sum - суммарный коэффициент стоимости всех аффиксов (поле cost_coef в аффиксах)

    -- общие коээффициенты
    rank_coef       = 15,               -- коэффициент влияния среднего ранга аффиксов на рост кривой
    upgrade_coefs   = { 1, 2, 3, 10 },  -- множитель цены для уровней апгрейда

    -- коэффициенты для расчета стоимости апгрейда в экспе
    upgradeExpPriceCoeffs =
    {
        base        = 0,        -- базовая стоимость
        base_coef   = 0.3,      -- базовый коэффициент кривизны роста
        divide_coef = 0.05,     -- базовый коэффициент сжатия
    },

    dismantleCreditsPriceCoeffs =
    {
        base        = 500000,   -- базовая стоимость
        base_coef   = 150,      -- базовый коэффициент кривизны роста
        divide_coef = 0.5,      -- базовый коэффициент сжатия
    },

    dismantleGoldPriceCoeffs =
    {
        base        = 10,       -- базовая стоимость
        base_coef   = 1.5,      -- базовый коэффициент кривизны роста
        divide_coef = 0.5,      -- базовый коэффициент сжатия
    },

    -- коэффициент для расчета того, сколько модуль даст экспы в качестве донора при апгрейде другого модуля (умножается на стоимость апгрейда донора)
    donate_coef = 0.2,

    -- коэффициент для расчета стоимости апгрейда в кредитах
    credits_coef = 1000,
}

AutogenClass =
{
    COMMON      = 0,
    BALANCED    = 1,
    SPECIAL     = 2,
    DOUBLE      = 3,
}

AutogenAffixGroup =
{
    COMMON      = 1,
    BALANCED    = 2,
    SPECIAL     = 3,
}

Affixes = {}
Affixes[ AutogenAffixGroup.COMMON ] = {}
Affixes[ AutogenAffixGroup.BALANCED ] = {}
Affixes[ AutogenAffixGroup.SPECIAL ] = {}

sys.execscript( 'gamedata/def/ex/autogen_common.lua' )
sys.execscript( 'gamedata/def/ex/autogen_balanced.lua' )
sys.execscript( 'gamedata/def/ex/autogen_special.lua' )
sys.execscript( 'gamedata/def/ex/autogen_guns.lua' )

-- описание того, сколько аффиксов и из каких групп содежит каждый класс аутогена
-- отсюда нельзя убирать класссы, т.к. иначе уже сролленные модули станут невалидными и их невозможно будет перероллить заново
AutogenClassDesc =
{
    [ AutogenClass.COMMON ] =
    {
        gold_dismantle = false,
        affixes =
        {
            { affix = AutogenAffixGroup.COMMON, min_rank = 4 },
            { affix = AutogenAffixGroup.COMMON, min_rank = 4 },
            { affix = AutogenAffixGroup.COMMON, min_rank = 10 },
            { affix = AutogenAffixGroup.COMMON, min_rank = 15 },
        }
    },

    [ AutogenClass.BALANCED ] =
    {
        gold_dismantle = false,
        affixes =
        {
            { affix = AutogenAffixGroup.BALANCED, min_rank = 5 },
            { affix = AutogenAffixGroup.COMMON, min_rank = 5 },
            { affix = AutogenAffixGroup.COMMON, min_rank = 10 },
            { affix = AutogenAffixGroup.COMMON, min_rank = 15 },
        }
    },

    [ AutogenClass.SPECIAL ] =
    {
        gold_dismantle = true,
        affixes =
        {
            { affix = AutogenAffixGroup.SPECIAL, min_rank = 7 },
            { affix = AutogenAffixGroup.COMMON, min_rank = 7 },
            { affix = AutogenAffixGroup.COMMON, min_rank = 10 },
            { affix = AutogenAffixGroup.COMMON, min_rank = 15 },
        }
    },

    [ AutogenClass.DOUBLE ] =
    {
        gold_dismantle = true,
        affixes =
        {
            { affix = AutogenAffixGroup.SPECIAL, min_rank = 7 },
            { affix = AutogenAffixGroup.SPECIAL, min_rank = 7 },
            { affix = AutogenAffixGroup.COMMON, min_rank = 7 },
            { affix = AutogenAffixGroup.COMMON, min_rank = 10 },
            { affix = AutogenAffixGroup.COMMON, min_rank = 15 },
        }
    },
}
