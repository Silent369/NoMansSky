local modfilename = "UnifiedWarps"
local lua_author  = "Silent"
local lua_version = "3.8"
local mod_author  = "Silent369"
local nms_version = "5.12"
local maintenance = mod_author
local description = [[

Unifies Blackhole/Portal/Ship/Teleporter Warps

]]

--|----------------------------------------------------------------------------------------
--MODIFIES:
--GCSIMULATIONGLOBALS.GLOBAL.MBIN
--MODELS\EFFECTS\WARP\WARPTUNNEL\ENTITIES\ANIMATEDLIGHTS.ENTITY.MBIN
--MODELS\EFFECTS\WARP\WARPTUNNEL\LIGHTARMSMAT.MATERIAL.MBIN
--MODELS\EFFECTS\WARP\WARPTUNNEL\TUNNELALT2MAT.MATERIAL.MBIN
--MODELS\EFFECTS\WARP\WARPTUNNEL\TUNNELALTMAT.MATERIAL.MBIN
--MODELS\EFFECTS\WARP\WARPTUNNEL\TUNNELMAT1.MATERIAL.MBIN
--MODELS\EFFECTS\WARP\WARPTUNNEL.SCENE.MBIN
--|----------------------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER =
{
    MOD_FILENAME    = string.format("_%s%s.pak", modfilename, "v"..lua_version),
    LUA_AUTHOR      = lua_author,
    MOD_AUTHOR      = mod_author,
    NMS_VERSION     = nms_version,
    MOD_DESCRIPTION = description,
    MOD_MAINTENANCE = maintenance,
    MODIFICATIONS   =
    {
        {
            MBIN_CT =
            {
                {
                    MBIN_FS = [[MODELS\EFFECTS\WARP\WARPTUNNEL.SCENE.MBIN]],
                    EXML_CT = {
                        {
                            SKW = {
                                {"Name", "scrollingwave9"},
                                {"Name", "scrollingwaveALT"},
                                {"Name", "scrollingwaveALT1"},
                                {"Name", "gradientCloud"},
                                {"Name", "gradientCloudAlt"},
                                {"Name", "EndGlowCaps"},
                                {"Name", "LightStreaks"},
                                {"Name", "LightStreaksSmall"},
                                {"Name", "LightStreaks1"},
                                {"Name", "LightStreaksSmall1"},
                                {"Name", "LightLargeStreaks"},
                            },
                            REMOVE = "SECTION",
                        },

                        -- Animated Lights

                        {
                            ITF = "FORCE",
                            SKW = {"Name", "AnimatedLights", "Type", "LIGHT", "Name", "FALLOFF_RATE"},
                            REPLACE_TYPE = "ALL",
                            VCT = {
                                {"Value",   "1.000000"}, --Original "2.000000"
                            }
                        },
                        {
                            ITF = "FORCE",
                            SKW = {"Name", "AnimatedLights", "Type", "LIGHT", "Name", "INTENSITY"},
                            REPLACE_TYPE = "ALL",
                            VCT = {
                                {"Value",   "500000.000000"}, --Original "100000.000000"
                            }
                        },

                        -- Exit Warp Early Fade

                        {
                            ITF = "FORCE",
                            SKW = {"Name", "WarpCylinder1", "Transform", "TkTransformData.xml"},
                            VCT = {
                                {"ScaleZ", "0.01"}, --Original "1.02175"
                            }
                        },

                        -- Stars (Lines)

                        {
                            ITF = "FORCE",
                            SKW = {"Name", "stars", "Transform", "TkTransformData.xml"},
                            VCT = {{"RotZ", "90"},} --Original "0"
                        },

                        -- Stars 1

                        {
                            ITF = "FORCE",
                            SKW = {"Name", "stars1", "Transform", "TkTransformData.xml"},
                            VCT = {{"RotZ", "45"},} --Original "0"
                        },

                        -- Stars 2

                        {
                            ITF = "FORCE",
                            SKW = {"Name", "stars2", "Transform", "TkTransformData.xml"},
                            VCT = {{"RotZ", "15"},} --Original "0"
                        },

                        -- LightArms Position / Scale

                        {
                            SKW = {"Name", "LightArms", "Transform", "TkTransformData.xml"},
                            ITF = "FORCE",
                            VCT = {
                                {"TransZ", "-150"}, --Original "0"
                                {"ScaleX",    "1.65"}, --Original "1"
                                {"ScaleY",    "1.65"}, --Original "1"
                                {"ScaleZ",    "1.65"}, --Original "1"
                            }
                        },
                    }
                },

                -- Animated Lights

                {
                    MBIN_FS = [[MODELS\EFFECTS\WARP\WARPTUNNEL\ENTITIES\ANIMATEDLIGHTS.ENTITY.MBIN]],
                    EXML_CT = {
                        {
                            SKW = {"Template", "TkAnimationComponentData.xml", "Idle", "TkAnimationData.xml"},
                            ITF = "FORCE",
                            VCT = {{"Speed", "0.4"},} --Original "1"
                        },
                    }
                },

                -- Light Arms

                {
                    MBIN_FS = [[MODELS\EFFECTS\WARP\WARPTUNNEL\LIGHTARMSMAT.MATERIAL.MBIN]],
                    EXML_CT = {
                        {
                            SKW = {"Name", "gCustomParams01Vec4"},
                            ITF = "FORCE",
                            VCT = {
                                {"x",  "0.5"}, --Original "1"
                                {"y", "0.65"}, --Original "1.3"
                                {"t", "0.05"}, --Original "0.04"
                            }
                        },
                    }
                },

                -- Stars / Lines

                {
                    MBIN_FS = [[MODELS\EFFECTS\WARP\WARPTUNNEL\TUNNELMAT1.MATERIAL.MBIN]],
                    EXML_CT = {
                        {
                            SKW = {"Name", "gUVScrollStepVec4"},
                            ITF = "FORCE",
                            VCT = {{"y",  "0.3"},} --Original "0.6"
                        },
                        {
                            SKW = {"Name", "gDiffuseMap"},
                            VCT = {{"Map", "TEXTURES/EFFECTS/WARP/LINES.DDS"},}
                        },
                    }
                },

                -- Stars 1

                {
                    MBIN_FS = [[MODELS\EFFECTS\WARP\WARPTUNNEL\TUNNELALTMAT.MATERIAL.MBIN]],
                    EXML_CT = {
                        {
                            SKW = {"Name", "gUVScrollStepVec4"},
                            ITF = "FORCE",
                            VCT = {{"y",  "0.5"},} --Original "3"
                        },
                    }
                },

                -- Stars 2

                {
                    MBIN_FS = [[MODELS\EFFECTS\WARP\WARPTUNNEL\TUNNELALT2MAT.MATERIAL.MBIN]],
                    EXML_CT = {
                        {
                            SKW = {"Name", "gUVScrollStepVec4"},
                            ITF = "FORCE",
                            VCT = {{"y",  "0.05"},} --Original "0.3"
                        },
                    }
                },

                -- Simulation

                {
                    MBIN_FS = [[GCSIMULATIONGLOBALS.GLOBAL.MBIN]],
                    EXML_CT = {
                        {
                            REPLACE_TYPE = "ALL",
                            VCT = {
                                {"BlackHoleTunnelFile",   "MODELS/EFFECTS/WARP/WARPTUNNEL.SCENE.MBIN"}, --Original "MODELS/EFFECTS/WARP/WARPTUNNELBLACKHOLE.SCENE.MBIN"
                                {"TeleportTunnelFile",    "MODELS/EFFECTS/WARP/WARPTUNNEL.SCENE.MBIN"}, --Original "MODELS/EFFECTS/WARP/WARPPORTAL.SCENE.MBIN"
                                {"PortalTunnelFile",      "MODELS/EFFECTS/WARP/WARPTUNNEL.SCENE.MBIN"}, --Original "MODELS/EFFECTS/WARP/WARPLARGEPORTAL.SCENE.MBIN""
                                {"PortalStoryTunnelFile", "MODELS/EFFECTS/WARP/WARPTUNNEL.SCENE.MBIN"}, --Original "MODELS/EFFECTS/WARP/WARPLARGEPORTAL.SCENE.MBIN"
                            }
                        }
                    }
                }
            }
        },
    }
}
