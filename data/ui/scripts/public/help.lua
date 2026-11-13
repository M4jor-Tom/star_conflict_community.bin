-- ----------------------------------------------------------------------------
--
-- Copyright й 2006, Targem LLC. All rights reserved.
-- 
--
-- ----------------------------------------------------------------------------
--  $Id:  $
-- ----------------------------------------------------------------------------

UI.Help =
{
    path = "ui/locale/%s/textures",		-- вместо %s будет подставлен язык

    themes =
    {
       --[[ {
            name		= "hangar",
            textures	= { "help_img_2", "help_img_2-2" } 
        },--]]

        {
            name		= "equipment",
            textures	= { "help_img_2", "help_img_2-2", "help_img_5", }
        },

        {
            name		= "shipsTree",
            textures	= {"help_img_11"}
        },

        {
            name		= "skills",
            textures	= { "help_img_4" }
        },

        -- {
            -- name		= "quests",
            -- textures	= { "help_img_10" }
        -- },

        {
            name		= "shop",
            textures	= { "help_img_3" }
        },

    --[[
        {
            name		= "stickers",
            textures 	= { "help_img_2" }
        },
    ]]

        {
            name		= "shipSelection",
            textures 	= { "help_img_6" }
        },

        {
            name		= "hud",
            textures 	= { "help_img_9", "help_img_7", "help_img_8" }
        },
    }
}


UI.Help.themesByName = {}

for idx, themeInfo in pairs( UI.Help.themes ) do
	UI.Help.themesByName[ themeInfo.name ] = themeInfo
end