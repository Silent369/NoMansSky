local modfilename = "Biomes.MoreNaturalWater"
local lua_author  = "Silent"
local lua_version = "1.5"
local mod_author  = "Silent369"
local nms_version = "5.28"
local maintenance = mod_author
local description = [[

Improves (imho) the 'new' water effects within game.
The overly transparent water and fresnel abuse has
been adjusted to try and mitigate some of this, for
me at least, somewhat immersion breaking technology
as implemented by Hello Games.

]]

--Modifies:
--GCWATERGLOBALS.GLOBAL.MBIN
--MATERIALS\MESHWATER.MATERIAL.MBIN
--METADATA\EFFECTS\WATER\WATERDATA.MBIN
--MODELS\PLANETS\TERRAIN\WATER.MATERIAL.MBIN
--TEXTURES\EFFECTS\WATER\WATERALPHARAMP.DDS
--TEXTURES\EFFECTS\WATER\WATERCOLOURRAMP.DDS
--TEXTURES\TERRAIN\WATER\FRESNEL.DDS

-----------------------------------------------------------------------------------------------

local mbin_file_source_1 = [[GCWATERGLOBALS.GLOBAL.MBIN]]
local mbin_file_source_2 = [[METADATA\EFFECTS\WATER\WATERDATA.MBIN]]
local mbin_file_source_3 = [[MATERIALS\MESHWATER.MATERIAL.MBIN]]
local mbin_file_source_4 = [[MODELS\PLANETS\TERRAIN\WATER.MATERIAL.MBIN]]

-----------------------------------------------------------------------------------------------
-- Water Values
-----------------------------------------------------------------------------------------------
local waterValues = {
    WaveHeight            = -0.10, -- 1.5
    WaveFrequency         = 0.1,   -- 0.01
    WaveChoppiness        = 1,     -- 2
    WaveCutoff            = 0.25,  -- 0.5
    FresnelPow            = 0,     -- 4
    FresnelMul            = 0,   -- 0.3
    FresnelAlpha          = 0.7,   -- 0.5
    FresnelBelowPow       = 0,     -- 4
    FresnelBelowMul       = 0,   -- 0.5
    FresnelBelowAlpha     = 0.7,   -- 0.5
}

local waterAlpha = {
    WaterHeavyAirAlpha    = 0.1,   -- 0.2
}

local waterDataValues = {
    ColourIndex           = -1,    -- 0
    WaterStrength         = 0.05,  -- 0.01
    WaterColourStrength   = 0.001, -- 0.008
    WaterMultiplyStrength = 0.5,   -- 0.3
    WaterMultiplyMax      = 0.3,   -- 0.9
    WaterRoughness        = 0.01,  -- 0
    FresnelPower          = 0,     -- 4
    FresnelMin            = 0,   -- 1.4
    FresnelMax            = 0,   -- 0.7
}

local metaWaterValues = {
    MinimumWavelength     = 0.12,  -- 0.08
    DetailNormalsStrength = 0.002, -- 0.005-0.35
    WaveRTPCStrength      = 0.15,  -- audio volume(?)
}

local meshWaterVectors = {
    x = 0.15, -- 0.30
    y = 0.15, -- 0.30
    z = 0.3,  -- 0.6
}

local meshMaterialVec4 = {
    x = 0, -- 1
    y = 0, -- 1
    z = 0, -- 1
    t = 0, -- 1
}

local waterMaterial = {
    Class = "Opaque"
}

-----------------------------------------------------------------------------------------------

local function createValueChangeTable(waterValues)
    local result = {}
    for k, v in pairs(waterValues) do
        table.insert(result, {k, v})
    end
    return result
end

local function createChangeEntry(specialKeyWords, waterValues)
    local entry = {
        ITF = "FORCE",
        VCT = createValueChangeTable(waterValues),
        SKW = specialKeyWords or {}
    }
    return entry
end

local function createMetaChangeTable(metaWaterValues)
    local result = {}
    for k, v in pairs(metaWaterValues) do
        table.insert(result, {k, v})
    end
    return result
end

local function createMetaEntry(precedingKeyWords, metaWaterValues)
    local entry = {
        ITF = "FORCE",
        REPLACE_TYPE = "ALL",
        VALUE_MATCH = 0,
        VALUE_MATCH_OPTIONS = "~=",
        VCT = createMetaChangeTable(metaWaterValues),
    }
    if precedingKeyWords then
        entry.PKW = precedingKeyWords
    end
    return entry
end

-----------------------------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER =
{
    MOD_FILENAME    = string.format("_%s%s.pak", modfilename, "v" .. lua_version),
    LUA_AUTHOR      = lua_author,
    MOD_AUTHOR      = mod_author,
    NMS_VERSION     = nms_version,
    MOD_DESCRIPTION = description,
    MOD_MAINTENANCE = maintenance,
    MODIFICATIONS   =
    {
        {
            MBIN_CT = {
                {
                    MBIN_FS = {mbin_file_source_1},
                    EXML_CT = {
                        createChangeEntry(nil, waterValues),
                        createChangeEntry({"WaterHeavyAirColour", "Colour.xml"}, {A = waterAlpha.WaterHeavyAirAlpha}),
                        createChangeEntry({"WaterDataDay", "GcPlanetWaterData.xml"}, waterDataValues)
                    }
                },
                {
                    MBIN_FS = {mbin_file_source_2},
                    EXML_CT = {
                        createMetaEntry(nil, metaWaterValues)
                    }
                },
                {
                    MBIN_FS = {mbin_file_source_3},
                    EXML_CT = {
                        createChangeEntry({"Name", "gUnderwaterReflectedColour", "Values", "Vector4f.xml"}, meshWaterVectors),
                        createChangeEntry({"Name", "gMaterialColourVec4", "Values", "Vector4f.xml"}, meshMaterialVec4)
                    }
                },
                {
                    MBIN_FS = {mbin_file_source_4},
                    EXML_CT = {
                        createChangeEntry({"Name", "Water"}, waterMaterial)
                    }
                },
            }
        },
    }
}
