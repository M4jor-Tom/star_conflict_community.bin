WorldMap = {
    base_width = 1850,
    base_height = 850,
    min_scale = 2.5,
    max_scale = 16,
    default_scale = 5,
    scale_step = { 2.5, 3, 3.9, 5, 6.3, 8, 10.3, 13, 16},	--{ 3, 6, 10, 16, }, в БЗС нужен более стратегический вид, да и почему не плавнее?
    scale_threshold_map_name_min = 3.5,	--5
    scale_threshold_map_min = 3,	-- 3.5 это надо в БЗС общий вариант
    scale_threshold_system_picture_min = 3,	-- 3.5 это надо в БЗС
    scale_threshold_system_min = 1.9,
    scale_threshold_system_max = 2.9,	-- 3 это не нужно в БЗС вообще
	scale_threshold_region_min = 3,
    system_base_scale = 3,

    layers = {
        [ 1 ] = {
            scale_alpha = { { scale = 1, alpha = 255 }, { scale = 3.5, alpha = 0 }, }, -- 4 фоновая картинка слишком явркая для общего плана убавил до 2-3.5
            base_scale = 2.5,
            parallax = 1,
            width_in_parts = 2,
            height_in_parts = 1,
        },
        [ 2 ] = {
            scale_alpha = { { scale = 1, alpha = 255 }, { scale = 3, alpha = 0 }, }, -- звёзды не нужны для БЗС
            base_scale = 2.5,
            parallax = 1,
            width_in_parts = 2,
            height_in_parts = 1,
        },
        [ 3 ] = {
            scale_alpha = { { scale = 1.3, alpha = 0 }, { scale = 6, alpha = 255 }, }, -- фоновые звёзды тусклые
            base_scale = 16,
            parallax = 0.2,
            blend = UI.BM_SCREEN,
        },
        [ 4 ] = {
            scale_alpha = { { scale = 4, alpha = 0 }, { scale = 10, alpha = 255 }, }, -- фоновые звёзды яркие, мешают поэтому 4 - 10
            base_scale = 16,
            parallax = 0.4,
            blend = UI.BM_SCREEN,
        },
        [ 5 ] = {
            scale_alpha = { { scale = 2, alpha = 0 }, { scale = 6, alpha = 255 }, }, -- туманности
            base_scale = 16,
            parallax = 0.1,
            blend = UI.BM_SCREEN,
        },
        [ 6 ] = {
            scale_alpha = { { scale = 2, alpha = 0 }, { scale = 6, alpha = 255 }, }, -- х.з. что это
            base_scale = 16,
            parallax = 0.001,
            blend = UI.BM_SCREEN,
        },
    }
}
