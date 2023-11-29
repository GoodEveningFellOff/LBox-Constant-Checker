ALL_CONSTANT_TABLE_NAMES = ALL_CONSTANT_TABLE_NAMES or {};

function _DEFINE_GLOBAL_CONSTANT_TABLE(sName, tbl)
	for _, v in pairs(ALL_CONSTANT_TABLE_NAMES) do
		if v == sName then
			return;
		end
	end

	rawset(_G, sName, tbl);

	setmetatable(_G[sName], {__newindex = function(self, k, v) end;});

	ALL_CONSTANT_TABLE_NAMES[#ALL_CONSTANT_TABLE_NAMES + 1] = sName;
end

setmetatable(_G, {
	__index = function(self, k)
		local pACTN = rawget(_G, "ALL_CONSTANT_TABLE_NAMES");

		if not pACTN or type(pACTN) ~= "table" then
			return rawget(self, k);
		end

		for i, sName in pairs(pACTN) do
			-- Make sure this global constant table still exists due to our issue
			local tbl = rawget(_G, sName);
			if tbl and type(tbl) == "table" then
				local v = rawget(tbl, k);

				if v then
					return v;
				end
			end
		end
		
		return rawget(self, k);
	end;

	__newindex = function(self, k, v)
		local pACTN = rawget(_G, "ALL_CONSTANT_TABLE_NAMES");

		if not pACTN or type(pACTN) ~= "table" then
			rawset(self, k, v);
			return;
		end

		for i, sName in pairs(pACTN) do

			-- This condition is NOT ever met unless we are overriding a global table in the same script
			-- This means that we can override global constant tables making them invalid!!!
			-- LOOK INTO THIS!!!
			if sName == k then
				error(("Cannot override global table %s!"):format(k));
				return;
			end

			-- Make sure this global constant table still exists due to our issue above
			local tbl = rawget(_G, sName);
			if tbl and type(tbl) == "table" then
				local _v = rawget(tbl, k);

				if _v then
					error(("Cannot override global constant %s!"):format(k));
					return;
				end
			end
		end
		
		rawset(self, k, v);
	end;
})

_DEFINE_GLOBAL_CONSTANT_TABLE("E_BoneMask", {
	BONE_USED_BY_VERTEX_LOD2 = 4096;
	BONE_USED_BY_VERTEX_LOD1 = 2048;
	BONE_USED_BY_HITBOX      = 256;
	BONE_USED_BY_ANYTHING    = 524032;
	BONE_USED_BY_ATTACHMENT  = 512;
	BONE_USED_BY_BONE_MERGE  = 262144;
	BONE_USED_BY_VERTEX_LOD6 = 65536;
	BONE_USED_BY_VERTEX_LOD7 = 131072;
	BONE_USED_BY_VERTEX_LOD3 = 8192;
	BONE_USED_BY_VERTEX_MASK = 261120;
	BONE_USED_BY_VERTEX_LOD0 = 1024;
	BONE_USED_BY_VERTEX_LOD5 = 32768;
	BONE_USED_BY_VERTEX_LOD4 = 16384;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_ProjectileType", {
	TF_PROJECTILE_ENERGY_RING          = 13;
	TF_PROJECTILE_ARROW                = 8;
	TF_PROJECTILE_FLAME_ROCKET         = 9;
	TF_PROJECTILE_PIPEBOMB_REMOTE      = 4;
	TF_PROJECTILE_JAR_MILK             = 10;
	TF_PROJECTILE_BREADMONSTER_MADMILK = 25;
	TF_PROJECTILE_BREADMONSTER_JARATE  = 24;
	TF_PROJECTILE_FLARE                = 6;
	TF_PROJECTILE_GRAPPLINGHOOK        = 26;
	TF_PROJECTILE_SENTRY_ROCKET        = 27;
	TF_PROJECTILE_HEALING_BOLT         = 11;
	TF_PROJECTILE_BREAD_MONSTER        = 28;
	TF_PROJECTILE_BUILDING_REPAIR_BOLT = 18;
	TF_PROJECTILE_PIPEBOMB_PRACTICE    = 14;
	TF_PROJECTILE_ENERGY_BALL          = 12;
	TF_PROJECTILE_SYRINGE              = 5;
	TF_PROJECTILE_FESTIVE_JAR          = 22;
	TF_PROJECTILE_NONE                 = 0;
	TF_PROJECTILE_JAR                  = 7;
	TF_PROJECTILE_BULLET               = 1;
	TF_PROJECTILE_CLEAVER              = 15;
	TF_PROJECTILE_ROCKET               = 2;
	TF_PROJECTILE_SPELL                = 21;
	TF_PROJECTILE_FESTIVE_ARROW        = 19;
	TF_PROJECTILE_CANNONBALL           = 17;
	TF_PROJECTILE_THROWABLE            = 20;
	TF_PROJECTILE_FESTIVE_HEALING_BOLT = 23;
	TF_PROJECTILE_PIPEBOMB             = 3;
	TF_PROJECTILE_STICKY_BALL          = 16;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_TFCOND", {
	TFCond_CritOnFirstBlood        = 37;
	TFCond_RunePrecision           = 96;
	TFCond_NoHealingDamageBuff     = 31;
	TFCond_SmallFireResist         = 63;
	TFCond_NoTaunting_DEPRECATED   = 118;
	TFCond_HalloweenKartNoTurn     = 87;
	TFCond_UberFireResist          = 60;
	TFCond_HalloweenCritCandy      = 33;
	TFCond_FocusBuff               = 46;
	TFCond_DefenseBuffed           = 26;
	TFCond_TeleportedGlow          = 6;
	TFCond_HalloweenKartDash       = 83;
	TFCond_CritOnDamage            = 56;
	TFCond_BulletImmune            = 67;
	TFCond_Dazed                   = 15;
	TFCond_GrapplingHookSafeFall   = 99;
	TFCond_KingAura                = 113;
	TFCond_Slowed                  = 0;
	TFCond_HealingDebuff           = 118;
	TFCond_BurningPyro             = 124;
	TFCond_CritCanteen             = 34;
	TFCond_Ubercharged             = 5;
	TFCond_RegenBuffed             = 29;
	TFCond_DemoBuff                = 18;
	TFCond_CritDemoCharge          = 35;
	TFCond_EyeaductUnderworld      = 108;
	TFCond_CloakFlicker            = 9;
	TFCond_Cloaked                 = 4;
	TFCond_Sapped                  = 50;
	TFCond_SmallBulletResist       = 61;
	TFCond_Jarated                 = 24;
	TFCond_HalloweenInHell         = 76;
	TFCond_DisguiseRemoved         = 47;
	TFCond_DeadRingered            = 13;
	TFCond_RuneHaste               = 91;
	TFCond_Disguising              = 2;
	TFCond_Parachute               = 80;
	TFCond_PreventDeath            = 70;
	TFCond_BalloonHead             = 84;
	TFCond_SupernovaRune           = 111;
	TFCond_DefenseBuffMmmph        = 45;
	TFCond_KnockedIntoAir          = 115;
	TFCond_HalloweenBombHead       = 53;
	TFCond_UberBlastResist         = 59;
	TFCond_SpawnOutline            = 114;
	TFCond_HalloweenSpeedBoost     = 72;
	TFCond_RuneImbalance           = 104;
	TFCond_DefenseBuffNoCritBlock  = 42;
	TFCond_DodgeChance             = 79;
	TFCond_Disguised               = 3;
	TFCond_HalloweenThriller       = 54;
	TFCond_FireImmune              = 69;
	TFCond_MedigunDebuff           = 65;
	TFCond_MarkedForDeath          = 30;
	TFCond_CritOnFlagCapture       = 39;
	TFCond_RuneStrength            = 90;
	TFCond_SpeedBuffAlly           = 32;
	TFCond_Gas                     = 123;
	TFCond_Reprogrammed            = 43;
	TFCond_RuneResist              = 93;
	TFCond_Taunting                = 7;
	TFCond_CritMmmph               = 44;
	TFCond_Plague                  = 112;
	TFCond_CritCola                = 19;
	TFCond_GrapplingHookLatched    = 100;
	TFCond_Stealthed               = 64;
	TFCond_CritOnWin               = 38;
	TFCond_RadiusHealOnDamage      = 55;
	TFCond_CritHype                = 36;
	TFCond_GrappledToPlayer        = 120;
	TFCond_Teleporting             = 10;
	TFCond_UberBulletResist        = 58;
	TFCond_OnFire                  = 22;
	TFCond_SmallBlastResist        = 62;
	TFCond_UberchargedCanteen      = 52;
	TFCond_BlastJumping            = 81;
	TFCond_TmpDamageBonus          = 12;
	TFCond_HalloweenKart           = 82;
	TFCond_Unknown1                = 9;
	TFCond_UberchargeFading        = 8;
	TFCond_PlagueRune              = 110;
	TFCond_RuneKnockout            = 103;
	TFCond_DisguisedAsDispenser    = 49;
	TFCond_RestrictToMelee         = 41;
	TFCond_Unknown2                = 12;
	TFCond_AirCurrent              = 127;
	TFCond_LostFooting             = 126;
	TFCond_RocketPack              = 125;
	TFCond_Bleeding                = 25;
	TFCond_BlastImmune             = 68;
	TFCond_StealthedUserBuffFade   = 66;
	TFCond_GrapplingHookBleeding   = 101;
	TFCond_ParachuteDeployed       = 122;
	TFCond_PasstimePenaltyDebuff   = 119;
	TFCond_Milked                  = 27;
	TFCond_GrappledByPlayer        = 121;
	TFCond_CompetitiveLoser        = 117;
	TFCond_HalloweenTiny           = 75;
	TFCond_KingRune                = 109;
	TFCond_Bonked                  = 14;
	TFCond_HasRune                 = 89;
	TFCond_SwimmingNoEffects       = 107;
	TFCond_PasstimeInterception    = 106;
	TFCond_UberchargedOnTakeDamage = 57;
	TFCond_CritRuneTemp            = 105;
	TFCond_RuneRegen               = 92;
	TFCond_Buffed                  = 16;
	TFCond_GrapplingHook           = 98;
	TFCond_RuneAgility             = 97;
	TFCond_FreezeInput             = 87;
	TFCond_RuneWarlock             = 95;
	TFCond_RuneVampire             = 94;
	TFCond_UberchargedHidden       = 51;
	TFCond_MegaHeal                = 28;
	TFCond_Kritzkrieged            = 11;
	TFCond_HalloweenGhostMode      = 77;
	TFCond_MarkedForDeathSilent    = 48;
	TFCond_AfterburnImmune         = 102;
	TFCond_HalloweenKartCage       = 88;
	TFCond_SwimmingCurse           = 86;
	TFCond_MeleeOnly               = 85;
	TFCond_ObscuredSmoke           = 79;
	TFCond_MiniCritOnKill          = 78;
	TFCond_CompetitiveWinner       = 116;
	TFCond_HalloweenGiant          = 74;
	TFCond_HalloweenQuickHeal      = 73;
	TFCond_MVMBotRadiowave         = 71;
	TFCond_CritOnKill              = 40;
	TFCond_Zoomed                  = 1;
	TFCond_Overhealed              = 23;
	TFCond_Healing                 = 21;
	TFCond_InHealRadius            = 20;
	TFCond_Charging                = 17;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_Hitbox", {
	HITBOX_HAND_L     = 8;
	HITBOX_KNEE_L     = 13;
	HITBOX_HEAD       = 0;
	HITBOX_FOOT_L     = 14;
	HITBOX_LOWERARM_L = 7;
	HITBOX_SPINE_2    = 4;
	HITBOX_UPPERARM_L = 6;
	HITBOX_SPINE_3    = 5;
	HITBOX_HIP_L      = 12;
	HITBOX_KNEE_R     = 16;
	HITBOX_UPPERARM_R = 9;
	HITBOX_FOOT_R     = 17;
	HITBOX_PELVIS     = 1;
	HITBOX_HIP_R      = 15;
	HITBOX_HAND_R     = 11;
	HITBOX_LOWERARM_R = 10;
	HITBOX_SPINE_0    = 2;
	HITBOX_SPINE_1    = 3;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("EGCResults", {
	k_EGCResultOK             = 0;
	k_EGCResultInvalidMessage = 4;
	k_EGCResultNoMessage      = 1;
	k_EGCResultNotLoggedOn    = 3;
	k_EGCResultBufferTooSmall = 2;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_RuneType", {
	RUNETYPE_TEMP_CRIT = 1;
	RUNETYPE_TEMP_UBER = 2;
	RUNETYPE_TEMP_NONE = 0;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_ButtonCode", {
	KEY_LBRACKET         = 53;
	BUTTON_CODE_INVALID  = -1;
	KEY_X                = 34;
	KEY_O                = 25;
	KEY_PAD_6            = 43;
	KEY_EQUAL            = 63;
	KEY_TAB              = 67;
	KEY_BACKQUOTE        = 57;
	KEY_UP               = 88;
	KEY_SEMICOLON        = 55;
	KEY_6                = 7;
	KEY_L                = 22;
	KEY_PAD_PLUS         = 50;
	KEY_3                = 4;
	KEY_INSERT           = 72;
	KEY_NONE             = 0;
	KEY_N                = 24;
	KEY_F1               = 92;
	KEY_SPACE            = 65;
	MOUSE_LEFT           = 107;
	KEY_M                = 23;
	KEY_LWIN             = 85;
	KEY_Z                = 36;
	KEY_F6               = 97;
	KEY_LCONTROL         = 83;
	KEY_Y                = 35;
	KEY_J                = 20;
	KEY_RIGHT            = 91;
	KEY_7                = 8;
	MOUSE_RIGHT          = 108;
	KEY_Q                = 27;
	KEY_ESCAPE           = 70;
	KEY_C                = 13;
	KEY_LALT             = 81;
	KEY_BREAK            = 78;
	KEY_F                = 16;
	KEY_FIRST            = 0;
	KEY_8                = 9;
	MOUSE_5              = 111;
	KEY_E                = 15;
	KEY_LSHIFT           = 79;
	KEY_PAD_DECIMAL      = 52;
	MOUSE_WHEEL_UP       = 112;
	KEY_PAD_1            = 38;
	KEY_V                = 32;
	KEY_F11              = 102;
	MOUSE_WHEEL_DOWN     = 113;
	KEY_APOSTROPHE       = 56;
	MOUSE_4              = 110;
	KEY_5                = 6;
	KEY_PAD_2            = 39;
	KEY_F2               = 93;
	MOUSE_MIDDLE         = 109;
	KEY_PAD_ENTER        = 51;
	BUTTON_CODE_NONE     = 0;
	KEY_PAD_MULTIPLY     = 48;
	MOUSE_FIRST          = 107;
	KEY_PAD_7            = 44;
	KEY_COUNT            = 107;
	KEY_PAD_0            = 37;
	KEY_2                = 3;
	KEY_LAST             = 106;
	KEY_CAPSLOCK         = 68;
	KEY_NUMLOCKTOGGLE    = 105;
	KEY_NUMLOCK          = 69;
	KEY_PAD_MINUS        = 49;
	KEY_PAD_8            = 45;
	KEY_PAD_5            = 42;
	KEY_F12              = 103;
	KEY_COMMA            = 58;
	KEY_F10              = 101;
	KEY_F9               = 100;
	KEY_CAPSLOCKTOGGLE   = 104;
	KEY_PAD_9            = 46;
	KEY_B                = 12;
	KEY_9                = 10;
	KEY_F7               = 98;
	KEY_F5               = 96;
	KEY_F4               = 95;
	KEY_SCROLLLOCK       = 71;
	KEY_F3               = 94;
	KEY_1                = 2;
	KEY_DOWN             = 90;
	KEY_A                = 11;
	KEY_LEFT             = 89;
	KEY_APP              = 87;
	KEY_RALT             = 82;
	KEY_0                = 1;
	KEY_H                = 18;
	KEY_R                = 28;
	KEY_U                = 31;
	KEY_D                = 14;
	KEY_RCONTROL         = 84;
	KEY_RSHIFT           = 80;
	KEY_4                = 5;
	KEY_PAGEDOWN         = 77;
	KEY_P                = 26;
	KEY_W                = 33;
	KEY_PAD_4            = 41;
	KEY_K                = 21;
	KEY_I                = 19;
	KEY_END              = 75;
	KEY_HOME             = 74;
	KEY_S                = 29;
	KEY_DELETE           = 73;
	KEY_SCROLLLOCKTOGGLE = 106;
	KEY_SLASH            = 60;
	KEY_BACKSPACE        = 66;
	KEY_ENTER            = 64;
	KEY_RBRACKET         = 54;
	KEY_MINUS            = 62;
	KEY_T                = 30;
	KEY_PAD_3            = 40;
	KEY_PAD_DIVIDE       = 47;
	KEY_F8               = 99;
	KEY_PERIOD           = 59;
	KEY_BACKSLASH        = 61;
	KEY_PAGEUP           = 76;
	KEY_G                = 17;
	KEY_RWIN             = 86;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_Flows", {
	FLOW_INCOMING = 1;
	MAX_FLOWS     = 2;
	FLOW_OUTGOING = 0;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_ClearFlags", {
	VIEW_CLEAR_STENCIL      = 32;
	VIEW_CLEAR_COLOR        = 1;
	VIEW_CLEAR_OBEY_STENCIL = 16;
	VIEW_NO_DRAW            = 8;
	VIEW_CLEAR_DEPTH        = 2;
	VIEW_CLEAR_FULL_TARGET  = 4;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_MoveType", {
	MOVETYPE_PUSH       = 7;
	MOVETYPE_FLY        = 4;
	MOVETYPE_STEP       = 3;
	MOVETYPE_VPHYSICS   = 6;
	MOVETYPE_OBSERVER   = 10;
	MOVETYPE_CUSTOM     = 11;
	MOVETYPE_WALK       = 2;
	MOVETYPE_NONE       = 0;
	MOVETYPE_LADDER     = 9;
	MOVETYPE_FLYGRAVITY = 5;
	MOVETYPE_NOCLIP     = 8;
	MOVETYPE_ISOMETRIC  = 1;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_TeamNumber", {
	TEAM_RED        = 3;
	TEAM_BLU        = 2;
	TEAM_SPECTATOR  = 1;
	TEAM_UNASSIGNED = 0;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_FileAttribute", {
	FILE_ATTRIBUTE_VIRTUAL               = 65536;
	FILE_ATTRIBUTE_TEMPORARY             = 256;
	FILE_ATTRIBUTE_HIDDEN                = 2;
	FILE_ATTRIBUTE_DEVICE                = 64;
	FILE_ATTRIBUTE_NOT_CONTENT_INDEXED   = 8192;
	FILE_ATTRIBUTE_DIRECTORY             = 16;
	FILE_ATTRIBUTE_RECALL_ON_OPEN        = 262144;
	FILE_ATTRIBUTE_COMPRESSED            = 2048;
	FILE_ATTRIBUTE_UNPINNED              = 1048576;
	FILE_ATTRIBUTE_SPARSE_FILE           = 512;
	FILE_ATTRIBUTE_ARCHIVE               = 32;
	INVALID_FILE_ATTRIBUTES              = 4294967295;
	FILE_ATTRIBUTE_REPARSE_POINT         = 1024;
	FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS = 4194304;
	FILE_ATTRIBUTE_PINNED                = 524288;
	FILE_ATTRIBUTE_NO_SCRUB_DATA         = 131072;
	FILE_ATTRIBUTE_READONLY              = 1;
	FILE_ATTRIBUTE_INTEGRITY_STREAM      = 32768;
	FILE_ATTRIBUTE_ENCRYPTED             = 16384;
	FILE_ATTRIBUTE_OFFLINE               = 4096;
	FILE_ATTRIBUTE_SYSTEM                = 4;
	FILE_ATTRIBUTE_NORMAL                = 128;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_MatchAbandonStatus", {
	MATCHABANDON_PENTALTY  = 2;
	MATCHABANDON_SAFE      = 0;
	MATCHABANDON_NOPENALTY = 1;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_FontFlag", {
	FONTFLAG_DROPSHADOW   = 128;
	FONTFLAG_OUTLINE      = 512;
	FONTFLAG_CUSTOM       = 1024;
	FONTFLAG_ROTARY       = 64;
	FONTFLAG_BITMAP       = 2048;
	FONTFLAG_GAUSSIANBLUR = 32;
	FONTFLAG_ADDITIVE     = 256;
	FONTFLAG_SYMBOL       = 8;
	FONTFLAG_UNDERLINE    = 2;
	FONTFLAG_NONE         = 0;
	FONTFLAG_STRIKEOUT    = 4;
	FONTFLAG_ANTIALIAS    = 16;
	FONTFLAG_ITALIC       = 1;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_PlayerFlag", {
	FL_WATERJUMP  = 4;
	FL_ONGROUND   = 1;
	FL_INWATER    = 512;
	FL_CLIENT     = 128;
	FL_FAKECLIENT = 256;
	FL_FROZEN     = 32;
	FL_ATCONTROLS = 64;
	FL_ONTRAIN    = 8;
	FL_DUCKING    = 2;
	FL_INRAIN     = 16;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_MaterialFlag", {
	MATERIAL_VAR_IGNOREZ                  = 32768;
	MATERIAL_VAR_VERTEXALPHA              = 32;
	MATERIAL_VAR_ADDITIVE                 = 128;
	MATERIAL_VAR_MODEL                    = 2048;
	MATERIAL_VAR_VERTEXCOLOR              = 16;
	MATERIAL_VAR_OPAQUETEXTURE            = 16777216;
	MATERIAL_VAR_VERTEXFOG                = 2147483648;
	MATERIAL_VAR_WIREFRAME                = 268435456;
	MATERIAL_VAR_ALPHATEST                = 256;
	MATERIAL_VAR_NOCULL                   = 8192;
	MATERIAL_VAR_FLAT                     = 4096;
	MATERIAL_VAR_DEBUG                    = 1;
	MATERIAL_VAR_ALLOWALPHATOCOVERAGE     = 536870912;
	MATERIAL_VAR_ALPHA_MODIFIED_BY_PROXY  = 1073741824;
	MATERIAL_VAR_NEEDS_SOFTWARE_SKINNING  = 8388608;
	MATERIAL_VAR_NORMALMAPALPHAENVMAPMASK = 4194304;
	MATERIAL_VAR_HALFLAMBERT              = 134217728;
	MATERIAL_VAR_SUPPRESS_DECALS          = 67108864;
	MATERIAL_VAR_ZNEARER                  = 1024;
	MATERIAL_VAR_ENVMAPCAMERASPACE        = 524288;
	MATERIAL_VAR_NOFOG                    = 16384;
	MATERIAL_VAR_USE_IN_FILLRATE_MODE     = 8;
	MATERIAL_VAR_TRANSLUCENT              = 2097152;
	MATERIAL_VAR_BASEALPHAENVMAPMASK      = 1048576;
	MATERIAL_VAR_ENVMAPMODE               = 33554432;
	MATERIAL_VAR_ENVMAPSPHERE             = 131072;
	MATERIAL_VAR_DECAL                    = 65536;
	MATERIAL_VAR_SELFILLUM                = 64;
	MATERIAL_VAR_NO_DEBUG_OVERRIDE        = 2;
	MATERIAL_VAR_NO_DRAW                  = 4;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_TraceLine", {
	CONTENTS_PLAYERCLIP           = 65536;
	CONTENTS_HITBOX               = 1073741824;
	MASK_NPCWORLDSTATIC_FLUID     = 131075;
	SURF_SKY2D                    = 2;
	CONTENTS_AREAPORTAL           = 32768;
	MASK_NPCSOLID_BRUSHONLY       = 147467;
	MASK_NPCFLUID                 = 33701891;
	MASK_SOLID_BRUSHONLY          = 16395;
	CONTENTS_SOLID                = 1;
	SURF_BUMPLIGHT                = 2048;
	MASK_SHOT_PORTAL              = 33570819;
	MASK_CURRENT                  = 16515072;
	CONTENTS_LADDER               = 536870912;
	CONTENTS_DEBRIS               = 67108864;
	MASK_OPAQUE_AND_NPCS          = 33570945;
	MASK_VISIBLE_AND_NPCS         = 33579137;
	CONTENTS_TESTFOGVOLUME        = 256;
	CONTENTS_GRATE                = 8;
	MASK_WATER                    = 16432;
	SURF_WARP                     = 8;
	CONTENTS_SLIME                = 16;
	CONTENTS_TEAM2                = 4096;
	SURF_NOPAINT                  = 8192;
	SURF_TRIGGER                  = 64;
	CONTENTS_BLOCKLIGHT           = 1024;
	SURF_HITBOX                   = 32768;
	CONTENTS_WATER                = 32;
	SURF_NOLIGHT                  = 1024;
	CONTENTS_CURRENT_DOWN         = 8388608;
	CONTENTS_IGNORE_NODRAW_OPAQUE = 8192;
	SURF_NOPORTAL                 = 32;
	MAX_TRACE_LENGTH              = 56755.840862421;
	CONTENTS_MONSTERCLIP          = 131072;
	MASK_NPCWORLDSTATIC           = 131083;
	CONTENTS_CURRENT_180          = 1048576;
	CONTENTS_MONSTER              = 33554432;
	SURF_NOCHOP                   = 16384;
	MASK_PLAYERSOLID              = 33636363;
	SURF_NOSHADOWS                = 4096;
	MASK_PLAYERSOLID_BRUSHONLY    = 81931;
	CONTENTS_EMPTY                = 0;
	CONTENTS_CURRENT_0            = 262144;
	CONTENTS_WINDOW               = 2;
	MASK_VISIBLE                  = 24705;
	CONTENTS_BLOCKLOS             = 64;
	SURF_NODRAW                   = 128;
	CONTENTS_CURRENT_UP           = 4194304;
	CONTENTS_DETAIL               = 134217728;
	SURF_SKIP                     = 512;
	CONTENTS_TRANSLUCENT          = 268435456;
	MASK_DEADSOLID                = 65547;
	CONTENTS_TEAM1                = 2048;
	COORD_EXTENT                  = 32768;
	SURF_LIGHT                    = 1;
	MAX_COORD_INTEGER             = 16384;
	SURF_HINT                     = 256;
	SURF_SKY                      = 4;
	CONTENTS_UNUSED               = 512;
	MASK_SHOT_HULL                = 100679691;
	CONTENTS_CURRENT_90           = 524288;
	SURF_NODECALS                 = 8192;
	MASK_SHOT_BRUSHONLY           = 67125251;
	MASK_SHOT                     = 1174421507;
	MASK_BLOCKLOS_AND_NPCS        = 33570881;
	MASK_NPCSOLID                 = 33701899;
	MASK_BLOCKLOS                 = 16449;
	CONTENTS_AUX                  = 4;
	MASK_OPAQUE                   = 16513;
	CONTENTS_OPAQUE               = 128;
	MASK_SOLID                    = 33570827;
	MASK_ALL                      = 4294967295;
	CONTENTS_ORIGIN               = 16777216;
	CONTENTS_MOVEABLE             = 16384;
	SURF_TRANS                    = 16;
	MASK_SPLITAREAPORTAL          = 48;
	CONTENTS_CURRENT_270          = 2097152;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_Character", {
	TF2_Scout    = 1;
	TF2_Soldier  = 3;
	TF2_Pyro     = 7;
	TF2_Engineer = 9;
	TF2_Sniper   = 2;
	TF2_Demoman  = 4;
	TF2_Medic    = 5;
	TF2_Heavy    = 6;
	TF2_Spy      = 8;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_SignonState", {
	SIGNONSTATE_SPAWN       = 5;
	SIGNONSTATE_FULL        = 6;
	SIGNONSTATE_NONE        = 0;
	SIGNONSTATE_PRESPAWN    = 4;
	SIGNONSTATE_CHANGELEVEL = 7;
	SIGNONSTATE_CHALLENGE   = 1;
	SIGNONSTATE_CONNECTED   = 2;
	SIGNONSTATE_NEW         = 3;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_WeaponBaseID", {
	TF_WEAPON_FLAMETHROWER            = 25;
	TF_WEAPON_MEDIGUN                 = 50;
	TF_WEAPON_PUMPKIN_BOMB            = 63;
	TF_WEAPON_REVOLVER                = 43;
	TF_WEAPON_PASSTIME_GUN            = 102;
	TF_WEAPON_CROWBAR                 = 6;
	TF_WEAPON_GRENADE_JAR_GAS         = 108;
	TF_WEAPON_BOTTLE                  = 3;
	TF_WEAPON_SNIPERRIFLE_DECAP       = 77;
	TF_WEAPON_PARACHUTE               = 100;
	TF_WEAPON_FIREAXE                 = 4;
	TF_WEAPON_HANDGUN_SCOUT_SEC       = 75;
	TF_WEAPON_GRENADE_MIRV_DEMOMAN    = 30;
	TF_WEAPON_BUFF_ITEM               = 62;
	TF_WEAPON_BONESAW                 = 11;
	TF_WEAPON_SYRINGEGUN_MEDIC        = 20;
	TF_WEAPON_SNIPERRIFLE_CLASSIC     = 99;
	TF_WEAPON_SCATTERGUN              = 16;
	TF_WEAPON_HANDGUN_SCOUT_PRIMARY   = 71;
	TF_WEAPON_PDA                     = 45;
	TF_WEAPON_INVIS                   = 57;
	TF_WEAPON_PISTOL                  = 41;
	TF_WEAPON_LASER_POINTER           = 67;
	TF_WEAPON_BUILDER                 = 49;
	TF_WEAPON_JAR                     = 60;
	TF_WEAPON_GRENADE_GAS             = 32;
	TF_WEAPON_GRAPPLINGHOOK           = 101;
	TF_WEAPON_SPELLBOOK               = 97;
	TF_WEAPON_BAT                     = 1;
	TF_WEAPON_JAR_GAS                 = 107;
	TF_WEAPON_SLAP                    = 106;
	TF_WEAPON_ROCKETPACK              = 105;
	TF_WEAPON_FISTS                   = 8;
	TF_WEAPON_SHOVEL                  = 9;
	TF_WEAPON_PDA_ENGINEER_DESTROY    = 47;
	TF_WEAPON_DISPENSER               = 56;
	TF_WEAPON_PDA_ENGINEER_BUILD      = 46;
	TF_WEAPON_LIFELINE                = 66;
	TF_WEAPON_BREAKABLE_SIGN          = 104;
	TF_WEAPON_ROCKETLAUNCHER          = 22;
	TF_WEAPON_GRENADE_CALTROP         = 34;
	TF_WEAPON_PIPEBOMBLAUNCHER        = 24;
	TF_WEAPON_CHARGED_SMG             = 103;
	TF_WEAPON_SHOTGUN_HWG             = 14;
	TF_WEAPON_SPELLBOOK_PROJECTILE    = 98;
	TF_WEAPON_SHOTGUN_PYRO            = 15;
	TF_WEAPON_SHOTGUN_BUILDING_RESCUE = 90;
	TF_WEAPON_CLUB                    = 5;
	TF_WEAPON_GRENADE_ORNAMENT        = 83;
	TF_WEAPON_FLAME_BALL              = 109;
	TF_WEAPON_JAR_MILK                = 70;
	TF_WEAPON_HARVESTER_SAW           = 96;
	TF_WEAPON_GRENADE_WATERBALLOON    = 95;
	TF_WEAPON_PDA_SPY_BUILD           = 94;
	TF_WEAPON_THROWABLE               = 92;
	TF_WEAPON_WRENCH                  = 10;
	TF_WEAPON_GRENADE_CLEAVER         = 87;
	TF_WEAPON_SHOTGUN_SOLDIER         = 13;
	TF_WEAPON_GRENADE_THROWABLE       = 93;
	TF_WEAPON_SMG                     = 19;
	TF_WEAPON_MECHANICAL_ARM          = 80;
	TF_WEAPON_RAYGUN_REVENGE          = 84;
	TF_WEAPON_GRENADE_STICKY_BALL     = 89;
	TF_WEAPON_GRENADE_EMP             = 33;
	TF_WEAPON_STICKY_BALL_LAUNCHER    = 88;
	TF_WEAPON_CLEAVER                 = 86;
	TF_WEAPON_GRENADE_DEMOMAN         = 53;
	TF_WEAPON_PEP_BRAWLER_BLASTER     = 85;
	TF_WEAPON_CANNON                  = 91;
	TF_WEAPON_BAT_GIFTWRAP            = 82;
	TF_WEAPON_SWORD                   = 64;
	TF_WEAPON_DIRECTHIT               = 65;
	TF_WEAPON_PARTICLE_CANNON         = 79;
	TF_WEAPON_FLAMETHROWER_ROCKET     = 52;
	TF_WEAPON_RAYGUN                  = 78;
	TF_WEAPON_SODA_POPPER             = 76;
	TF_WEAPON_STICKBOMB               = 74;
	TF_WEAPON_FLAREGUN                = 58;
	TF_WEAPON_LUNCHBOX                = 59;
	TF_WEAPON_BAT_FISH                = 72;
	TF_WEAPON_TRANQ                   = 21;
	TF_WEAPON_SENTRY_REVENGE          = 69;
	TF_WEAPON_KNIFE                   = 7;
	TF_WEAPON_BAT_WOOD                = 2;
	TF_WEAPON_GRENADE_PIPEBOMB        = 35;
	TF_WEAPON_DISPENSER_GUN           = 68;
	TF_WEAPON_DRG_POMSON              = 81;
	TF_WEAPON_GRENADE_JAR_MILK        = 40;
	TF_WEAPON_COMPOUND_BOW            = 61;
	TF_WEAPON_CROSSBOW                = 73;
	TF_WEAPON_SENTRY_ROCKET           = 55;
	TF_WEAPON_SENTRY_BULLET           = 54;
	TF_WEAPON_GRENADE_NORMAL          = 26;
	TF_WEAPON_GRENADE_MIRVBOMB        = 51;
	TF_WEAPON_GRENADE_MIRV            = 29;
	TF_WEAPON_PDA_SPY                 = 48;
	TF_WEAPON_NONE                    = 0;
	TF_WEAPON_NAILGUN                 = 44;
	TF_WEAPON_MINIGUN                 = 18;
	TF_WEAPON_GRENADE_NAIL            = 28;
	TF_WEAPON_GRENADE_JAR             = 39;
	TF_WEAPON_PISTOL_SCOUT            = 42;
	TF_WEAPON_GRENADE_STUNBALL        = 38;
	TF_WEAPON_GRENADE_SMOKE_BOMB      = 36;
	TF_WEAPON_GRENADE_HEAL            = 37;
	TF_WEAPON_GRENADE_NAPALM          = 31;
	TF_WEAPON_GRENADE_CONCUSSION      = 27;
	TF_WEAPON_GRENADELAUNCHER         = 23;
	TF_WEAPON_SNIPERRIFLE             = 17;
	TF_WEAPON_SHOTGUN_PRIMARY         = 12;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_UserMessage", {
	MVMLocalPlayerUpgradesClear     = 63;
	Geiger                          = 0;
	DamageDodged                    = 36;
	TrainingObjective               = 35;
	HudNotifyCustom                 = 27;
	SPHapWeapEvent                  = 77;
	Rumble                          = 13;
	MVMWaveFailed                   = 58;
	Shake                           = 10;
	PlayerTauntSoundLoopStart       = 70;
	AchievementEvent                = 23;
	HapSetDrag                      = 80;
	PlayerTeleportHomeEffect        = 54;
	HudText                         = 2;
	Train                           = 1;
	SendAudio                       = 15;
	BreakModelRocketDud             = 44;
	VoiceSubtitle                   = 25;
	SayText2                        = 4;
	VoteSetup                       = 49;
	MVMAnnouncement                 = 59;
	MVMVictory                      = 61;
	EOTLDuckEvent                   = 74;
	CallVoteFailed                  = 45;
	CloseCaption                    = 14;
	SayText                         = 3;
	VGUIMenu                        = 12;
	CheapBreakModel                 = 42;
	RequestState                    = 17;
	PlayerIgnitedInv                = 31;
	TrainingMsg                     = 34;
	HudArenaNotify                  = 32;
	ResetHUD                        = 6;
	HapMeleeContact                 = 82;
	MVMStatsReset                   = 55;
	PlayerJarated                   = 37;
	HudNotify                       = 26;
	PlayerTauntSoundLoopEnd         = 71;
	BreakModel                      = 41;
	PlayerExtinguished              = 38;
	BonusDucks                      = 73;
	PlayerShieldBlocked             = 40;
	ForcePlayerViewAngles           = 72;
	ItemPickup                      = 8;
	MVMResetPlayerUpgradeSpending   = 67;
	MVMPlayerEvent                  = 56;
	VoiceMask                       = 16;
	MVMPlayerUpgradedEvent          = 60;
	QuestObjectiveCompleted         = 76;
	HapSetConst                     = 81;
	HapPunch                        = 79;
	HapDmg                          = 78;
	AmmoDenied                      = 22;
	PlayerPickupWeapon              = 75;
	MVMResetPlayerStats             = 57;
	PlayerLoadoutUpdated            = 69;
	MVMServerKickTimeUpdate         = 68;
	MVMLocalPlayerWaveSpendingValue = 66;
	SpawnFlyingBird                 = 52;
	MVMResetPlayerWaveSpendingStats = 65;
	MVMLocalPlayerUpgradesValue     = 64;
	PlayerBonusPoints               = 50;
	PlayerGodRayEffect              = 53;
	VoteFailed                      = 48;
	UpdateRadar                     = 24;
	PlayerStatsUpdate               = 28;
	GameTitle                       = 7;
	MVMWaveChange                   = 62;
	RDTeamPointsChanged             = 51;
	HudMsg                          = 21;
	Damage                          = 18;
	PlayerIgnited                   = 30;
	VoteStart                       = 46;
	TextMsg                         = 5;
	UpdateAchievement               = 33;
	PlayerJaratedFade               = 39;
	BreakModel_Pumpkin              = 43;
	VotePass                        = 47;
	MapStatsUpdate                  = 29;
	KeyHintText                     = 20;
	Fade                            = 11;
	HintText                        = 19;
	ShowMenu                        = 9;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_LifeState", {
	LIFE_ALIVE           = 0;
	LIFE_RESPAWNABLE     = 3;
	LIFE_DEAD            = 2;
	LIFE_DISCARDAIM_BODY = 4;
	LIFE_DYING           = 1;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_UserCmd", {
	IN_FORWARD   = 8;
	IN_SCORE     = 65536;
	IN_ATTACK    = 1;
	IN_MOVERIGHT = 1024;
	IN_LEFT      = 128;
	IN_JUMP      = 2;
	IN_MOVELEFT  = 512;
	IN_RUN       = 4096;
	IN_CANCEL    = 64;
	IN_WALK      = 262144;
	IN_ZOOM      = 524288;
	IN_USE       = 32;
	IN_DUCK      = 4;
	IN_ATTACK3   = 33554432;
	IN_GRENADE2  = 16777216;
	IN_BULLRUSH  = 4194304;
	IN_ATTACK2   = 2048;
	IN_BACK      = 16;
	IN_RIGHT     = 256;
	IN_SPEED     = 131072;
	IN_RELOAD    = 8192;
	IN_ALT2      = 32768;
	IN_ALT1      = 16384;
	IN_WEAPON2   = 2097152;
	IN_WEAPON1   = 1048576;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_GCResults", {
	k_EGCResultOK             = 0;
	k_EGCResultInvalidMessage = 4;
	k_EGCResultNoMessage      = 1;
	k_EGCResultNotLoggedOn    = 3;
	k_EGCResultBufferTooSmall = 2;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_RoundState", {
	ROUND_PREROUND       = 3;
	ROUND_BONUS          = 9;
	ROUND_RUNNING        = 4;
	ROUND_STARTGAME      = 2;
	ROUND_RESTART        = 6;
	ROUND_INIT           = 0;
	ROUND_GAMEOVER       = 8;
	ROUND_PREGAME        = 1;
	ROUND_TEAMWIN        = 5;
	ROUND_STALEMATE      = 7;
	ROUND_BETWEEN_ROUNDS = 10;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_LoadoutSlot", {
	LOADOUT_POSITION_TAUNT     = 11;
	LOADOUT_POSITION_ACTION    = 9;
	LOADOUT_POSITION_TAUNT8    = 18;
	LOADOUT_POSITION_MELEE     = 2;
	LOADOUT_POSITION_TAUNT2    = 12;
	LOADOUT_POSITION_PDA       = 5;
	LOADOUT_POSITION_PRIMARY   = 0;
	LOADOUT_POSITION_TAUNT4    = 14;
	LOADOUT_POSITION_MISC      = 8;
	LOADOUT_POSITION_TAUNT6    = 16;
	LOADOUT_POSITION_MISC2     = 10;
	LOADOUT_POSITION_TAUNT5    = 15;
	LOADOUT_POSITION_TAUNT7    = 17;
	LOADOUT_POSITION_UTILITY   = 3;
	LOADOUT_POSITION_SECONDARY = 1;
	LOADOUT_POSITION_TAUNT3    = 13;
	LOADOUT_POSITION_HEAD      = 7;
	LOADOUT_POSITION_PDA2      = 6;
	LOADOUT_POSITION_BUILDING  = 4;
});

_DEFINE_GLOBAL_CONSTANT_TABLE("E_KillEffect", {
	TF_CUSTOM_PLASMA                    = 46;
	TF_CUSTOM_BACKSTAB                  = 2;
	TF_CUSTOM_TAUNT_GRAND_SLAM          = 10;
	TF_CUSTOM_TAUNT_ENGINEER_ARM        = 38;
	TF_CUSTOM_TAUNT_HADOUKEN            = 7;
	TF_CUSTOM_BURNING_ARROW             = 17;
	TF_CUSTOM_AEGIS_ROUND               = 43;
	TF_CUSTOM_TELEFRAG                  = 16;
	TF_CUSTOM_CANNONBALL_PUSH           = 61;
	TF_CUSTOM_TAUNT_HIGH_NOON           = 9;
	TF_CUSTOM_DEFENSIVE_STICKY          = 26;
	TF_CUSTOM_MERASMUS_DECAPITATION     = 60;
	TF_CUSTOM_DECAPITATION              = 20;
	TF_CUSTOM_PENETRATE_ALL_PLAYERS     = 12;
	TF_CUSTOM_PLAYER_SENTRY             = 30;
	TF_CUSTOM_MERASMUS_ZAP              = 59;
	TF_CUSTOM_MERASMUS_GRENADE          = 58;
	TF_CUSTOM_PENETRATE_AIM_HEADSHOT    = 14;
	TF_CUSTOM_BLEEDING                  = 34;
	TF_CUSTOM_PLASMA_GIB                = 48;
	TF_CUSTOM_SAPPER_RECORDER_DEATH     = 56;
	TF_CUSTOM_CLEAVER_CRIT              = 55;
	TF_CUSTOM_TRIGGER_HURT              = 40;
	TF_CUSTOM_CHARGE_IMPACT             = 23;
	TF_CUSTOM_CLEAVER                   = 54;
	TF_CUSTOM_BASEBALL                  = 22;
	TF_CUSTOM_AIM_HEADSHOT              = 1;
	TF_CUSTOM_FLARE_PELLET              = 53;
	TF_CUSTOM_TAUNT_UBERSLICE           = 29;
	TF_CUSTOM_STICKBOMB_EXPLOSION       = 42;
	TF_CUSTOM_AIM_HEADSHOT_DECAPITATION = 51;
	TF_CUSTOM_EYEBALL_ROCKET            = 50;
	TF_CUSTOM_TAUNT_ENGINEER_SMASH      = 33;
	TF_CUSTOM_FLARE_EXPLOSION           = 44;
	TF_CUSTOM_PICKAXE                   = 27;
	TF_CUSTOM_PLASMA_CHARGED            = 47;
	TF_CUSTOM_MERASMUS_PLAYER_BOMB      = 57;
	TF_CUSTOM_MINIGUN                   = 5;
	TF_CUSTOM_PUMPKIN_BOMB              = 19;
	TF_CUSTOM_COMBO_PUNCH               = 37;
	TF_CUSTOM_SHOTGUN_REVENGE_CRIT      = 32;
	TF_CUSTOM_BOOTS_STOMP               = 45;
	TF_CUSTOM_TAUNT_ARMAGEDDON          = 52;
	TF_CUSTOM_DECAPITATION_BOSS         = 41;
	TF_CUSTOM_FISH_KILL                 = 39;
	TF_CUSTOM_PRACTICE_STICKY           = 49;
	TF_CUSTOM_GOLD_WRENCH               = 35;
	TF_CUSTOM_FLYINGBURN                = 18;
	TF_CUSTOM_TAUNT_ARROW_STAB          = 15;
	TF_CUSTOM_ROCKET_DIRECTHIT          = 28;
	TF_CUSTOM_CARRIED_BUILDING          = 36;
	TF_CUSTOM_AIR_STICKY_BURST          = 25;
	TF_CUSTOM_BURNING                   = 3;
	TF_CUSTOM_TAUNT_BARBARIAN_SWING     = 24;
	TF_CUSTOM_TAUNT_GRENADE             = 21;
	TF_CUSTOM_STANDARD_STICKY           = 31;
	TF_CUSTOM_TAUNT_FENCING             = 13;
	TF_CUSTOM_PENETRATE_MY_TEAM         = 11;
	TF_CUSTOM_SUICIDE                   = 6;
	TF_CUSTOM_BURNING_FLARE             = 8;
	TF_CUSTOM_WRENCH_FIX                = 4;
});
