-- ----------------------------------------------------------------------------
--
-- Workfile: hudplayerswnd.lua
-- Copyright é 2006, Targem LLC. All rights reserved.
--
-- ----------------------------------------------------------------------------
--  $Id: $
-- ----------------------------------------------------------------------------

--
UI.HudPlayersWnd =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "PlayersWnd",

    	props =
    	{
    		name	= "HudPlayersWnd",
    	},
    },

	mode = UI.PlayersWnd.modes.HUD
}


--
UI.HudPlayersWnd2_friends =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "PlayersWnd",

    	props =
    	{
    		name	= "HudPlayersWnd2_friends",
    	},
    },

	mode = UI.PlayersWnd.modes.HUD_2_FRIENDS
}


--
UI.HudPlayersWnd2_enemies =
{
    def =
    {
    	className	= "Wnd",
    	prototype	= "PlayersWnd",

    	props =
    	{
    		name	= "HudPlayersWnd2_enemies",
    	},
    },

	mode = UI.PlayersWnd.modes.HUD_2_ENEMIES
}