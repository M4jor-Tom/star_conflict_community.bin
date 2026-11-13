
-- коэфициент AOE повреждений в зависимости от "размеров" объекта
BlastWaveSignatureCoef = 
{
	[ ai.Signature.TINY ]		= 0.15,
	[ ai.Signature.SMALL ]		= 0.66, -- дроны маяка/перехваты
	[ ai.Signature.MEDIUM ] 	= 1, -- штурмовики
	[ ai.Signature.LARGE ]		= 1.25, -- фрегаты и каргошипы
	[ ai.Signature.HUGE ]		= 1.75, -- дестроеры
}

-- коэфициент повреждений в зависимости от "размеров" объекта для "Разрывных" снарядов
ExplosionShootSignatureCoef = 
{
	[ ai.Signature.TINY ]		= 1,
	[ ai.Signature.SMALL ]		= 1, -- дроны маяка/перехваты
	[ ai.Signature.MEDIUM ] 	= 1, -- штурмовики
	[ ai.Signature.LARGE ]		= 1, -- фрегаты и каргошипы
	[ ai.Signature.HUGE ]		= 2.0, -- дестроеры
}

-- масштабирование исцеления в зависимости от сигнатуры цели
--#36268
RemoteHealSignatureCoef = 
{
    [ ai.Signature.TINY ]		= 0.25,
    [ ai.Signature.SMALL ]		= 0.5,
    [ ai.Signature.MEDIUM ] 	= 0.75,
    [ ai.Signature.LARGE ]		= 1,
    [ ai.Signature.HUGE ]		= 1.25,
}

-- масштабирование наград в зависимости от сигнатуры цели
--#0060413
RewardSignatureCoef = 
{
    [ ai.Signature.TINY ]		= 1,
    [ ai.Signature.SMALL ]		= 1,
    [ ai.Signature.MEDIUM ] 	= 1,
    [ ai.Signature.LARGE ]		= 1, --1.2,
    [ ai.Signature.HUGE ]		= 1, --2,
}

-- уменьшение эффективности пассивных модулей
-- #0055549
PassiveModuleDiminishing = 
{
	1.0,	-- 1 модуль = 1 * 100% = 100%
	0.9,	-- 2 модуля =  180%
	0.8,	-- 3 модуля =  240%
}
