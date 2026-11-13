Mission = 
{
}


-- функция вызывается, когда есть все объекты, но нет игроков. боты могут быть.
function Mission:SV_OnStart()
	cvars.sv_mmBattleRank = 15 --  чтобы работали ранговые баффы  #93450

	eventContainer = {}

	AID.mod_by_bot = 0
	PvE_Mission.bFocusPoints = true
	
	sys.concmd( "e_event EnergyGeneratorLong2 DisableAssociatedSpawn" )
	sys.concmd( "e_event EnergyGeneratorLong3 DisableAssociatedSpawn" )
	sys.concmd( "e_event ActiveJumpgate1 FullDeactivate" )		
	sys.concmd( "e_event ActiveJumpgate2 FullDeactivate" )
	sys.concmd( "e_event ActiveJumpgate3 FullDeactivate" )
	sys.concmd( "e_event Station1 FullActivate" )			
	sys.concmd( "e_event SpaceShield5 FullDeactivate" )		
	sys.concmd( "e_event SpaceShield6 FullDeactivate" )	
	sys.concmd( "e_event SpaceShield7 FullDeactivate" )
	sys.concmd( "e_event EnergyGeneratorLong2 FullDeactivate" )
	sys.concmd( "e_event Jericho5 FullDeactivate" )
	sys.concmd( "e_event Jericho6 FullDeactivate" )
	sys.concmd( "e_event Jericho7 FullDeactivate" )
	sys.concmd( "e_event Jericho8 FullDeactivate" )
	sys.concmd( "e_event Jericho9 FullDeactivate" )
	sys.concmd( "e_event Jericho10 FullDeactivate" )
	sys.concmd( "e_event Jericho11 FullDeactivate" )
	sys.concmd( "e_event Jericho12 FullDeactivate" )
	sys.concmd( "e_event Jericho13 FullDeactivate" )				
	sys.concmd( "e_event JerichoControlStationA1 HideFromHud" )	
	sys.concmd( "e_event JerichoControlStationB1 HideFromHud" )
	sys.concmd( "e_event JerichoControlStationC1 HideFromHud" )		
	sys.concmd( "e_event PirateAvanpost2 FullActivate" )
	sys.concmd( "e_event PirateAvanpost3 FullActivate" )
	sys.concmd( "e_event PirateAvanpost2 DisableAssociatedSpawn" )
	sys.concmd( "e_event PirateAvanpost3 DisableAssociatedSpawn" )				
	sys.concmd( "e_event PoliceTurret1 FullDeactivate" )	
	sys.concmd( "e_event PoliceTurret2 FullDeactivate" )
	sys.concmd( "e_event PoliceTurret3 FullDeactivate" )
	sys.concmd( "e_event PoliceTurret4 FullDeactivate" )
	sys.concmd( "e_event PoliceTurret5 FullDeactivate" )
	sys.concmd( "e_event PoliceTurret6 FullDeactivate" )
	sys.concmd( "e_event PoliceTurret7 FullDeactivate" )
	sys.concmd( "e_event PoliceTurret8 FullDeactivate" )
	sys.concmd( "e_event PoliceTurret9 FullDeactivate" )
	sys.concmd( "e_event PoliceTurret10 FullDeactivate" )			
	sys.concmd( "e_event EntityBuilderTrigger1 DeactivateTrigger" )							
	sys.concmd( "e_event EntityBuilderTrigger2 DeactivateTrigger" )			
	sys.concmd( "e_event EntityBuilderTrigger3 DeactivateTrigger" )
	sys.concmd( "e_event EntityBuilderTrigger4 DeactivateTrigger" )
	sys.concmd( "e_event EntityBuilderTrigger5 DeactivateTrigger" )
	sys.concmd( "e_event EntityBuilderTrigger6 DeactivateTrigger" )
	sys.concmd( "e_event EntityBuilderTrigger7 DeactivateTrigger" )
	sys.concmd( "e_event EntityBuilderTrigger8 DeactivateTrigger" )		
	sys.concmd( "e_event EntityBuilderTrigger9 DeactivateTrigger" )			
	sys.concmd( "e_event EntityBuilderTrigger10 DeactivateTrigger" )
	sys.concmd( "e_event EntityBuilderTrigger11 DeactivateTrigger" )
	sys.concmd( "e_event EntityBuilderTrigger12 DeactivateTrigger" )						
	
	for i, aPhases in pairs( PvE_Container4 ) do
		PvE_Mission[ i ] = aPhases
	end	
	
	PvE_Func:InitMission()
	PvE_JB_H:OnStart()
	
	AID.portals = true
	
end
