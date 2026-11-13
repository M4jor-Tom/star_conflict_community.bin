if not LogoSlideshow then
	LogoSlideshow = {}
end

-- intro logo slide show
LogoSlideshow.DEFAULT = 
{
	-- опциональная музыка (играет все время показа слайдов)
	--music = "NoThanx_MM",
	
	-- не останавливать звук предыдущего слайда когда появляется новый
	--stop_prev_sound = false,

	-- показывать этот слайд только при первом старте игры и не показывать при последующих
	-- show_only_first_time = true
	
	{ vid = "video/splash_0.ogv" },
	{ vid = "video/splash_2_eng.ogv" },	
}

LogoSlideshow.RUSSIAN = 
{
	{ vid = "video/splash_0.ogv" },
	{ vid = "video/splash_2.ogv" },		
}