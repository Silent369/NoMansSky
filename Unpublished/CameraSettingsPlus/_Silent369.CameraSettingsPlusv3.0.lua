local modfilename = "CameraSettingsPlus"
local lua_author  = "Silent"
local lua_version = "3.0"
local mod_author  = "Silent369"
local nms_version = "5.73"
local maintenance = mod_author
local exmlcreate  = true
local description = [[

Various quality of life adjustments to several camera settings:

  1  Alters 1st/3rd Person Camera Views slightly,
  2. Removes Head Bob (depreciated, in settings now)
  3. Disables Camera Wander Animations
  4. No Visible Freighters/Ships When Warping. (off by default)
  5. Photomode Camera Adjustments
  6. No Character Auto Camera Center
  7. Minor SpaceShip Camera Adjustments

If you recompile you can set true/false the options below to
your personal preference.

]]

--Modifies:
--GCCAMERAGLOBALS.GLOBAL.MBIN

--|=======================================================================================--

local m_1st3rdPersonCams = true
local m_1st3rdShipFieldV = true
local m_OffsetCamOffsets = true
local m_1st_PersonInShip = true
local m_SpaceshipFollCam = true
local m_CameraBobAmounts = true
local m_CameraWanderShip = true
local m_WarpSettingsFPos = false
local m_WarpSettingsSPos = false
local m_CharNoCamAutoCen = true
local m_ShipsCamSettings = true

local m_PhotoModeMovSpeed = 12
local m_PhotoModeVeloTime = 0.4

--|=======================================================================================--

TableData = TableData or {}

--|=======================================================================================--

--| First / Third Person Field of View
--|=======================================================================================--
if m_1st3rdPersonCams then
table.insert(TableData,
    {
        REPLACE_TYPE = "ALL",
        VCT = {
            {"FirstPersonFoV",           "80"}, --Original "75"
            {"ThirdPersonFoV",           "75"}, --Original "70"
            {"ThirdPersonCombatFoV",     "75"}, --Original "65"
            {"FirstPersonZoom1FoV",      "45"}, --Original "40"
            {"FirstPersonZoom2FoV",      "20"}, --Original "15"
        }
    })
end

--| Ship First / Third Person Field of View
--|=======================================================================================--
if m_1st3rdShipFieldV then
table.insert(TableData,
    {
        REPLACE_TYPE = "ALL",
        VCT = {
            {"ShipFoVMin",               "85"}, --Original "75"
            {"ShipFoVMin2",              "85"}, --Original "75"
            {"ShipFoVMax",               "95"}, --Original "90"
            {"ShipWarpFoV",              "50"}, --Original "70"
            {"ShipFoVMin3rdPerson",      "90"}, --Original "95"
            {"ShipFoVMax3rdPerson",     "100"}, --Original "115"
            {"ShipFoVBoost",            "100"}, --Original "105"
            {"ShipFoVMiniJump",         "100"}, --Original "110"
        }
    })
end

--| Offset Camera Offsets
--|=======================================================================================--
if m_OffsetCamOffsets then
table.insert(TableData,
    {
        PKW = {"OffsetCamOffset"},
        VCT = {
            {"X",                        "14"}, --Original "12"
            {"Y",                         "5"}, --Original "4"
            {"Z",                        "14"}, --Original "12"
        }
    })
end

--| 1st Person In Ship
--|=======================================================================================--
if m_1st_PersonInShip then
table.insert(TableData,
    {
        PKW = {"FirstPersonInShipCamOffset"},
        VCT = {
            {"X",                         "0"}, --Original "0"
            {"Y",                      "2.40"}, --Original "2.45"
            {"Z",                       "0.6"}, --Original "0.5"
        }
    })
end

--| Spaceship Follow Camera
--|=======================================================================================--
if m_SpaceshipFollCam then
table.insert(TableData,
    {
        SKW = {"SpaceshipFollowCam", "GcCameraFollowSettings", "Name", "SPACESHIP"},
        VCT = {
            {"OffsetY",                    "1"}, --Original "-0.8"
            {"BackMinDistance",           "22"}, --Original "20"
            {"BackMaxDistance",           "55"}, --Original "50"
            {"BackSlopeAdjust",          "0.3"}, --Original "0"
            {"UpMinDistance",              "3"}, --Original "2"
            {"UpMaxDistance",             "12"}, --Original "10"
            {"UpSlopeAdjust",              "0"}, --Original "0"
        }
    })
end

--| Camera Bob (Redundant now, it is in the settings panel)
--|=======================================================================================--
if m_CameraBobAmounts then
table.insert(TableData,
    {
        VCT = {
            {"BobAmount",                 "0"}, --Original "0.06"
            {"BobFactor",                 "0"}, --Original "0.19"
            {"BobAmountAbandFreighter",   "0"}, --Original "0.1"
            {"BobFactorAbandFreighter",   "0"}, --Original "0.3"
        }
    })
end

--| Camera Wander
--|=======================================================================================--
if m_CameraWanderShip then
table.insert(TableData,
    {
        REPLACE_TYPE = "ALL",
        VCT = {
            {"CamWander",             "False"},
            {"CamWanderPhase",            "0"}, --Original "0.003"
            {"CamWanderAmplitude",        "0"}, --Original "0.5"
        }
    })
end

--| Warp Settings
--|=======================================================================================--
if m_WarpSettingsSPos then
table.insert(TableData,
    {
        SKW = {"WarpSettings", "GcCameraWarpSettings"},
        REPLACE_TYPE = "ALL",
        VCT = {
            {"FocusPointDist",       "100000"}, --Original "100000"
            {"OffsetZFrequency_1",        "0"}, --Original "1.1"
            {"OffsetZFrequency_2",        "0"}, --Original "0.9"
            {"OffsetZPhase_1",            "0"}, --Original "2.5"
            {"OffsetZPhase_2",            "0"}, --Original "6.5"
            {"OffsetZStartBias",         "-5"}, --Original "15"
            {"OffsetZBias",              "-5"}, --Original "2"
            {"OffsetZRange",            "-65"}, --Original "1.5"
            {"OffsetYFrequency_1",        "0"}, --Original "1.1"
            {"OffsetYFrequency_2",        "0"}, --Original "0.9"
            {"OffsetYPhase_1",            "0"}, --Original "1.5"
            {"OffsetYPhase_2",            "0"}, --Original "5.5"
            {"OffsetYStartBias",          "0"}, --Original "3.5"
            {"OffsetYBias",               "0"}, --Original "0"
            {"OffsetYRange",              "0"}, --Original "0.75"
            {"OffsetXFrequency",          "0"}, --Original "0.25"
            {"OffsetXPhase",              "0"}, --Original "0"
            {"OffsetXRange",              "0"}, --Original "3.5"
            {"RollRange",                 "0"}, --Original "1"
            {"YawnRange",                 "0"}, --Original "600"
        }
    })
end

if m_WarpSettingsFPos then
table.insert(TableData,
    {
        SKW = {"FreighterWarpSettings", "GcCameraWarpSettings"},
        REPLACE_TYPE = "ALL",
        VCT = {
            {"FocusPointDist",       "100000"}, --Original "100000"
            {"OffsetZFrequency_1",        "0"}, --Original "0.25"
            {"OffsetZFrequency_2",        "0"}, --Original "0.35"
            {"OffsetZPhase_1",            "0"}, --Original "2.5"
            {"OffsetZPhase_2",            "0"}, --Original "6.5"
            {"OffsetZStartBias",        "-20"}, --Original "50"
            {"OffsetZBias",             "-20"}, --Original "-11"
            {"OffsetZRange",           "-200"}, --Original "200"
            {"OffsetYFrequency_1",        "0"}, --Original "0.2"
            {"OffsetYFrequency_2",        "0"}, --Original "0.3"
            {"OffsetYPhase_1",            "0"}, --Original "1.5"
            {"OffsetYPhase_2",            "0"}, --Original "5.5"
            {"OffsetYStartBias",          "0"}, --Original "3.5"
            {"OffsetYBias",               "0"}, --Original "0"
            {"OffsetYRange",            "150"}, --Original "150"
            {"OffsetXFrequency",          "0"}, --Original "0.15"
            {"OffsetXPhase",              "0"}, --Original "0"
            {"OffsetXRange",            "350"}, --Original "350"
            {"RollRange",                 "0"}, --Original "0.6"
            {"YawnRange",                 "0"}, --Original "400"
        }
    })
end

if m_WarpSettingsFPos then
table.insert(TableData,
    {
        SKW = {"PirateFreighterWarpSettings", "GcCameraWarpSettings"},
        REPLACE_TYPE = "ALL",
        VCT = {
            {"FocusPointDist",       "100000"}, --Original "100000"
            {"OffsetZFrequency_1",        "0"}, --Original "0.25"
            {"OffsetZFrequency_2",        "0"}, --Original "0.35"
            {"OffsetZPhase_1",            "0"}, --Original "2.5"
            {"OffsetZPhase_2",            "0"}, --Original "6.5"
            {"OffsetZStartBias",        "-20"}, --Original "50"
            {"OffsetZBias",             "-20"}, --Original "-11"
            {"OffsetZRange",           "-700"}, --Original "700"
            {"OffsetYFrequency_1",        "0"}, --Original "0.2"
            {"OffsetYFrequency_2",        "0"}, --Original "0.3"
            {"OffsetYPhase_1",            "0"}, --Original "1.5"
            {"OffsetYPhase_2",            "0"}, --Original "5.5"
            {"OffsetYStartBias",          "0"}, --Original "2000"
            {"OffsetYBias",               "0"}, --Original "0"
            {"OffsetYRange",            "300"}, --Original "300"
            {"OffsetXFrequency",          "0"}, --Original "0.15"
            {"OffsetXPhase",              "0"}, --Original "0"
            {"OffsetXRange",            "350"}, --Original "350"
            {"RollRange",                 "0"}, --Original "0.6"
            {"YawnRange",                 "0"}, --Original "400"
        }
    })
else
table.insert(TableData,
    {
        SKW = {"PirateFreighterWarpSettings", "GcCameraWarpSettings"},
        REPLACE_TYPE = "ALL",
        VCT = {
            {"OffsetZRange",            "400"}, --Original "700"
        }
    })
end

--| No Character Camera Auto Center
--|=======================================================================================--
if m_CharNoCamAutoCen then
table.insert(TableData,
    {
        SKW = {
            {"CharacterUnarmedCam",                 "GcCameraFollowSettings", "Name", "CHARUNARMED"},
            {"CharacterRunCam",                     "GcCameraFollowSettings", "Name", "CHARRUN"},
            {"CharacterCombatCam",                  "GcCameraFollowSettings", "Name", "CHARCOMBAT"},
            {"CharacterMiningCam",                  "GcCameraFollowSettings", "Name", "CHARMINE"},
            {"CharacterFishingCam",                 "GcCameraFollowSettings", "Name", "CHARFISH"},
            {"CharacterIndoorCam",                  "GcCameraFollowSettings", "Name", "CHARINDOOR"},
            {"CharacterUndergroundCam",             "GcCameraFollowSettings", "Name", "CHARCAVE"},
            {"CharacterAbandCombatCam",             "GcCameraFollowSettings", "Name", "FREIGHTCOMBAT"},
            {"CharacterAbandCam",                   "GcCameraFollowSettings", "Name", "ABANDFREIGHT"},
            {"CharacterNexusCam",                   "GcCameraFollowSettings", "Name", "CHARNEXUS"},
            {"CharacterAirborneCam",                "GcCameraFollowSettings", "Name", "CHARJETPACK"},
            {"CharacterMeleeBoostCam",              "GcCameraFollowSettings", "Name", "CHARMELBOOST"},
            {"CharacterRocketBootsCam",             "GcCameraFollowSettings", "Name", "ROCKETBOOTS"},
            {"CharacterRocketBootsChargeCam",       "GcCameraFollowSettings", "Name", "ROCKETBOOTSCHRG"},
            {"CharacterFallingCam",                 "GcCameraFollowSettings", "Name", "CHARFALL"},
            {"CharacterAirborneCombatCam",          "GcCameraFollowSettings", "Name", "CHARJETCOMBAT"},
            {"CharacterSpaceCam",                   "GcCameraFollowSettings", "Name", "CHARSPACE"},
            {"CharacterSteepSlopeCam",              "GcCameraFollowSettings", "Name", "CHARSLOPE"},
            {"CharacterSurfaceWaterCam",            "GcCameraFollowSettings", "Name", "CHARWATER"},
            {"CharacterUnderwaterCam",              "GcCameraFollowSettings", "Name", "CHARUNDERWATER"},
            {"CharacterUnderwaterCombatCam",        "GcCameraFollowSettings", "Name", "WETCOMBAT"},
            {"CharacterUnderwaterJetpackCam",       "GcCameraFollowSettings", "Name", "WETJETPACK"},
            {"CharacterUnderwaterJetpackAscentCam", "GcCameraFollowSettings", "Name", "WATERASCENT"},
            {"CharacterGrabbedCam",                 "GcCameraFollowSettings", "Name", "GRABBED"},
            {"CharacterSitCam",                     "GcCameraFollowSettings", "Name", "CHARSIT"},
            {"CharacterRideCam",                    "GcCameraFollowSettings", "Name", "CHARRIDEMED"},
            {"CharacterRideCamMedium",              "GcCameraFollowSettings", "Name", "CHARRIDEMED"},
            {"CharacterRideCamLarge",               "GcCameraFollowSettings", "Name", "CHARRIDELRG"},
            {"CharacterRideCamHuge",                "GcCameraFollowSettings", "Name", "CHARRIDEHUGE"}
        },
        REPLACE_TYPE = "ALLINSIDESECTION",
        VCT =
        {
            {"VertRotationMin",       "-85"},
            {"VertRotationMax",        "85"},
            {"SpringSpeed",             "0"},
            {"LockToObjectOnIdle",  "false"},
            {"CenterStartTime",         "0"},
            {"CenterBlendTime",         "0"},
            {"CenterMaxSpring",         "0"},
            {"CenterMaxSpeed",          "0"},
            {"CenterStartSpeed",        "0"},
            {"UseSpeedBasedSpring", "false"},
        },
    })
end

--| SpaceShip Camera Adjustments
--|=======================================================================================--
if m_ShipsCamSettings then
table.insert(TableData,
    {
        SKW = {
            {"SpaceshipFollowCam",   "GcCameraFollowSettings", "Name", "SPACESHIP"},
            {"DropshipFollowCam",    "GcCameraFollowSettings", "Name", "DROPSHIP"},
            {"ShuttleFollowCam",     "GcCameraFollowSettings", "Name", "SHUTTLE"},
            {"RoyalShipFollowCam",   "GcCameraFollowSettings", "Name", "ROYAL"},
            {"SailShipFollowCam",    "GcCameraFollowSettings", "Name", "SAILSHIP"},
            {"ScienceShipFollowCam", "GcCameraFollowSettings", "Name", "SCIENCE"},
            {"AlienShipFollowCam",   "GcCameraFollowSettings", "Name", "ALIENSHIP"},
            {"RobotShipFollowCam",   "GcCameraFollowSettings", "Name", "ROBOTSHIP"},
        },
        REPLACE_TYPE = "ALLINSIDESECTION",
        VCT =
        {
            {"VertRotationMin",       "-90"},
            {"VertRotationMax",        "90"},
            {"SpringSpeed",             "0"},
            {"LockToObjectOnIdle",   "true"},
            {"CenterStartTime",       "0.2"},
            {"CenterBlendTime",       "0.5"},
            {"CenterMaxSpring",         "5"},
            {"CenterMaxSpeed",          "8"},
            {"CenterStartSpeed",      "0.2"},
            {"UseSpeedBasedSpring",  "true"},
        },
    })
end

--|=======================================================================================--

NMS_MOD_DEFINITION_CONTAINER =
{
    MOD_FILENAME    = table.concat({modfilename, ".v", lua_version}),
    LUA_AUTHOR      = lua_author,
    MOD_AUTHOR      = mod_author,
    NMS_VERSION     = nms_version,
    MOD_DESCRIPTION = description,
    MOD_MAINTENANCE = maintenance,
    EXML_CREATE     = exmlcreate,
    MODIFICATIONS   =
    {
        {
            MBIN_CT =
            {
                {
                    MBIN_FS = [[GCCAMERAGLOBALS.GLOBAL.MBIN]],
                    MXML_CT = TableData,
                },
            },
        },
        {
            MBIN_CT =
            {
                {
                    MBIN_FS = [[GCCAMERAGLOBALS.GLOBAL.MBIN]],
                    MXML_CT =
                    {
                        {
                            SKW = {"BuildingOutdoorsCam","GcCameraFollowSettings"},
                            VCT =
                            {
                                {"MinSpeed",              "2.000000"},
                                {"SpeedRange",           "50.000000"},
                                {"UpMaxDistance",   "1000000.000000"},
                                {"LeftMaxDistance", "1000000.000000"},
                            }
                        },
                        {
                            SKW = {
                                {"FocusBuildingModePitchControlSettings",    "GcCameraFocusBuildingControlSettings"},
                                {"FocusBuildingModeYawControlSettings",      "GcCameraFocusBuildingControlSettings"},
                                {"FocusBuildingModeDistanceControlSettings", "GcCameraFocusBuildingControlSettings"},
                                {"FocusBuildingModePlanarControlSettings",   "GcCameraFocusBuildingControlSettings"},
                                {"FocusBuildingModeVerticalControlSettings", "GcCameraFocusBuildingControlSettings"}
                            },
                            VCT =
                            {
                                {"SmoothTime", "0.150000"}, --Original "0.250000"
                            }
                        },
                        {
                            VCT =
                            {
                                {"PhotoModeMaxDistance",            "1000000.00000"},
                                {"PhotoModeMaxDistanceSpace",       "1000000.00000"},
                                {"PhotoModeCollisionRadius",                    "0"},
						                    {"PhotoModeVelocitySmoothTime", m_PhotoModeVeloTime}, --0.5
						                    {"PhotoModeMoveSpeed",          m_PhotoModeMovSpeed}, --11
                                {"BuildingModeMaxDistance",         "1000000.00000"},
                                {"BinocularFlashTime",                          "0"},
                                {"BinocularFlashStrength",                      "0"},
                                {"ModelViewMouseRotateSpeed",                   "7"},
                            }
                        },
                    }
                },
            }
        },
    }
}
