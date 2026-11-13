RoleDescription = {}

RoleDescription[ ai.ShipRoles.SCOUT ] =
{
    special = ItemSubtype.MicroWarp,
    active =
    {
        [ 1 ] = ItemSubtype.SpyDrone,
        [ 2 ] = ItemSubtype.SpyBeacon,
        [ 3 ] = ItemSubtype.Shift,
    },
}

RoleDescription[ ai.ShipRoles.RECON ] =
{
    special = ItemSubtype.PlasmaWeb,
    active =
    {
        [ 1 ] = ItemSubtype.AchillesTargetingUnit,
        [ 2 ] = ItemSubtype.EnergyLance,
        [ 3 ] = ItemSubtype.Chameleon,
    },
}

RoleDescription[ ai.ShipRoles.ECM ] =
{
    special = ItemSubtype.BlackoutGenerator,
    active =
    {
        [ 1 ] = ItemSubtype.IonRay,
        [ 2 ] = ItemSubtype.StasisGenerator,
        [ 3 ] = ItemSubtype.FocusedEMI,
    },
}

RoleDescription[ ai.ShipRoles.ATTACK ] =
{
    special = ItemSubtype.TimeBoost,
    active =
    {
        [ 1 ] = ItemSubtype.Eagleeye,
        [ 2 ] = ItemSubtype.ShieldExplosion,
        [ 3 ] = ItemSubtype.Invulnerability,
    },
}

RoleDescription[ ai.ShipRoles.TACKLER ] =
{
    special = ItemSubtype.CloakingDevice,
    active =
    {
        [ 1 ] = ItemSubtype.WebPropulsion,
        [ 2 ] = ItemSubtype.TargetPainter,
        [ 3 ] = ItemSubtype.GuidedDron,
    },
}

RoleDescription[ ai.ShipRoles.COMMAND ] =
{
    special = ItemSubtype.EnergyShieldCommander,
    active =
    {
        [ 1 ] = ItemSubtype.CommandShieldResist,
        [ 2 ] = ItemSubtype.CommandWeaknessAnalyzer,
        [ 3 ] = ItemSubtype.GravitationAnalyzer,
    },
}

RoleDescription[ ai.ShipRoles.SNIPER ] =
{
    special = ItemSubtype.Disintegrator,
    active =
    {
        [ 1 ] = ItemSubtype.SniperOverload,
        [ 2 ] = ItemSubtype.SniperFastShot,
        [ 3 ] = ItemSubtype.Camouflage,
    },
}

RoleDescription[ ai.ShipRoles.ENGINEER ] =
{
    special = ItemSubtype.FrigateDrone,
    active =
    {
        [ 1 ] = ItemSubtype.ShieldEmitter,
        [ 2 ] = ItemSubtype.ShieldRayLarge,
        [ 3 ] = ItemSubtype.WarpGate,
    },
}

RoleDescription[ ai.ShipRoles.GUARD ] =
{
    special = ItemSubtype.PhaseShield,
    active =
    {
        [ 1 ] = ItemSubtype.BoostJammerAOE,
        [ 2 ] = ItemSubtype.MissileDefence,
        [ 3 ] = ItemSubtype.ShieldChargeLarge,
    },
}

RoleDescription[ ai.ShipRoles.OVERSEER ] =
{
    special = ItemSubtype.EnergyReroute ,
    active =
    {
        [ 1 ] = ItemSubtype.TachRay,
        [ 2 ] = ItemSubtype.RocketSilo,
        [ 3 ] = ItemSubtype.Teleporter,
    },
}