local modfilename = "AutoScannerPlus-FossilBones"
local lua_author  = "Silent"
local lua_version = "5.8"
local mod_author  = "Silent369"
local contributor = ""
local nms_version = "7.13"
local maintenance = mod_author
local exmlcreate  = true
local description = [[

Auto Scan Fossils / Bones.

Inspired by the Scan_Auto.cs script provided by cmkNMSModBuilder
https://github.com/cmkushnir/NMSModBuilder

]]

------------------------------------------------------------------------------------------

local m_ScanRange = 12500.000000
local m_ScanTime  = 30.000000
local m_RangeMult = 1.000000
local m_ShowRange = 12500.000000
local m_Override  = 0.000000

------------------------------------------------------------------------------------------
-- Create Scannable Component Data (with optional Wrapper)
------------------------------------------------------------------------------------------
function CreateScannableComponentData(ScanRange, ScanName, ScanTime, RangeMult, ShowRange, DisplayIcon, AllowMerge, Override, Wrapper)
    local Content = [[
			<Property name="GcScannableComponentData">
				<Property name="ScanRange" value="]]..ScanRange..[[" />
				<Property name="ScanName" value="]]..ScanName..[[" />
				<Property name="ScanTime" value="]]..ScanTime..[[" />
				<Property name="CompassRangeMultiplier" value="]]..RangeMult..[[" />
				<Property name="AlwaysShowRange" value="]]..ShowRange..[[" />
				<Property name="HideCompassInAlwaysShowRange" value="false" />
				<Property name="CanTagIcon" value="true" />
				<Property name="ClearTagOnArrival" value="true" />
				<Property name="DisableIfBuildingPart" value="true" />
				<Property name="DisableIfInBase" value="true" />
				<Property name="UseModelNode" value="true" />
				<Property name="Icon" value="GcScannerIconTypes">
					<Property name="ScanIconType" value="]]..DisplayIcon..[[" />
				</Property>
				<Property name="BinocsDiscoIconOverride" value="GcDiscoveryType">
					<Property name="DiscoveryType" value="Unknown" />
				</Property>
				<Property name="ScannableType" value="Binoculars" />
				<Property name="IsPlacedMarker" value="false" />
				<Property name="ShowInFreighterBranchRoom" value="false" />
				<Property name="TellPlayerIfFreighterObjectUsed" value="false" />
				<Property name="FreighterObjectAlreadyUsedLocID" value="UI_ABAND_LOG_READ" />
				<Property name="GetIconAndNameFromSettlementBuilding" value="false" />
				<Property name="AllowedToMerge" value="]]..AllowMerge..[[" />
				<Property name="MarkerActiveWithNodeInactive" value="true" />
				<Property name="ValidMissionSurveyIds" />
				<Property name="MinDisplayDistanceOverride" value="-1.000000" />
				<Property name="MarkerOffsetOverride" value="]]..Override..[[" />
				<Property name="ForceCompassMarkerOnForScannerIcon" value="true" />
			</Property>]]

    -- Rolling Plant has a specific GcScannableComponentData with an _index
    -- And needs to be wrapped with just the Content GcScannableComponentData.
    -- Everything else is wrapped with the full Component GcScannableComponentData

    if Wrapper then
        return [[
		<Property name="Components" value="GcScannableComponentData">]] .. Content .. [[
		</Property>]]
    else
        return Content
    end
end

-- Define the GcScannableComponentData for various entities.
-- If ANY are disabled (commented with --), check below to enable that section!

-- Wrapper 'true'  argument indicates the full wrapper should be used.
-- Wrapper 'false' argument indicates the solo wrapper should be used.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--BUILDING                                                  SIGNAL/SCAN TYPE              SCANTIME    RANGEMULT    SHOWRANGE    ICON                  MERGE    OVERRIDE    WRAP
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddBones       = CreateScannableComponentData(m_ScanRange, "UI_UNDERGROUND_BONES_NAME_L", m_ScanTime, m_RangeMult, m_ShowRange, "BuriedRare",         "true",  m_Override, true)
AddFossil      = CreateScannableComponentData(m_ScanRange, "UI_UNDERGROUND_BONES_NAME_L", m_ScanTime, m_RangeMult, m_ShowRange, "BuriedFossil",      "false",  m_Override, true)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER =
{
    MOD_FILENAME     = table.concat({modfilename, ".v", lua_version}),
    LUA_AUTHOR       = lua_author,
    MOD_AUTHOR       = mod_author,
    NMS_VERSION      = nms_version,
    MOD_CONTRIBUTORS = contributor,
    MOD_DESCRIPTION  = description,
    MOD_MAINTENANCE  = maintenance,
    EXML_CREATE      = exmlcreate,
    MODIFICATIONS    =
    {
        {
            MBIN_CT =
            {
                ----------------------------------------------------------------------------------------------
                --GCBUILDINGGLOBALS
                ----------------------------------------------------------------------------------------------
                {
                    MBIN_FS = [[GCBUILDINGGLOBALS.GLOBAL.MXML]],
                    MXML_CT =
                    {
                        {
                            VCT = {{"FadeDistance", m_ScanRange},}
                        },
                    }
                },
                ----------------------------------------------------------------------------------------------
                --RARE RESOURCE, Already has GcScannableComponentData, we're overriding for AllowMerge
                ----------------------------------------------------------------------------------------------
                {
                    MBIN_FS = [[MODELS\PLANETS\BIOMES\COMMON\RARERESOURCE\GROUND\BONEPILE\ENTITIES\BONEPILE.ENTITY.MXML]],
                    MXML_CT =
                    {
                          {
                             SKW = {"Components", "GcScannableComponentData"},
                             ADD_OPTION = "REPLACEwholeSECTION",
                             ADD = AddBones,
                          }
                    },
                },
                ----------------------------------------------------------------------------------------------
                --BURRIED FOSSIL, Already has GcScannableComponentData, we're overriding for AllowMerge
                ----------------------------------------------------------------------------------------------
                {
                    MBIN_FS = {
                      [[MODELS\PLANETS\BIOMES\COMMON\RARERESOURCE\GROUND\BONEPILE\ENTITIES\_FOSSIL_BODY.ENTITY.MXML]],
                      [[MODELS\PLANETS\BIOMES\COMMON\RARERESOURCE\GROUND\BONEPILE\ENTITIES\_FOSSIL_LIMBS.ENTITY.MXML]],
                      [[MODELS\PLANETS\BIOMES\COMMON\RARERESOURCE\GROUND\BONEPILE\ENTITIES\_FOSSIL_SKULL.ENTITY.MXML]],
                      [[MODELS\PLANETS\BIOMES\COMMON\RARERESOURCE\GROUND\BONEPILE\ENTITIES\_FOSSIL_TAIL.ENTITY.MXML]],
                    },
                    MXML_CT =
                    {
                          {
                             SKW = {"Components", "GcScannableComponentData"},
                             ADD_OPTION = "REPLACEwholeSECTION",
                             ADD = AddFossil,
                          }
                    },
                },
            }
        },
    }
}
