--[[ корабли * 10 * 2если премиум
корабли * 30 * 2если премиум
остальна€ репа за квесты

 300/600   т1 
 400/800   т2 
 500/1000   т3 
600/1200 т4
но это то к чему мы —“–≈ћ»ћ—я 

 ]]
 
-- player reputation with factions
ai.Reputation =
{
    Private = 			      0, -- t1
    Corporal = 			   4200, -- t1p  
    Sergeant = 			  11400, -- t1f
    MasterSergeant = 	  24000, -- t2 начало 4 
    SergeantMajor = 	  48000, -- t2p
    Midshipman = 		  95000, -- t2f
    MasterMidshipman = 	 165000, -- т3  7
    Ensign = 			 265000, -- t3p
    ThirdLieutenant = 	 394000, -- т3f
    SecondLieutenant = 	 545000, -- t4 10
    FirstLieutenant = 	 720000, -- t4p 
    LtCommander = 		 910000, -- t4f
    Commander = 		1115000, -- t5 )  13
    Captain =   		1650000, -- t5p
    Commodore = 		2300000, -- t5f 15
	
    Marshal =	 		3000000, 
    FieldMarshal = 		3800000, 
    GrandMarshal =      4500000, 
	-- ограничено в 2000000
	-- 2300 боев под премиумом из расчета 400 репы забой ( 300 победа + 100 поражение *100% премиум = 800/2= 400) + 20-30 репы за в€кие квесты и пати.
}

ai.event_credits_cap = 300
ai.vessel_exp_pool_cap = 5000000
ai.credits_cap = 400000000
ai.tokens_cap = 10000 --#98284

-- вспомогательна€ таблица вида:
-- { [ 1 ] = ai.Reputation.Private, [ 2 ] = ai.Reputation.Corporal, ... }

ai.ReputationByRank = {}

local function l_makeReputationByRank()

    for name, val in pairs( ai.Reputation ) do
    	table.insert( ai.ReputationByRank, val )
    end

    table.sort( ai.ReputationByRank )

end

l_makeReputationByRank()