ALL_CONSTANT_TABLE_NAMES = ALL_CONSTANT_TABLE_NAMES or {};

function DefineGlobalConstants(sName, tbl)
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
		for _, tbl in pairs(rawget(_G, "ALL_CONSTANT_TABLE_NAMES")) do
			local v = rawget(rawget(_G, tbl) or {}, k);

			if v then
				return v;
			end
		end

		return rawget(_G, k);
	end;

	__newindex = function(self, k, v)
		for _, tbl in pairs(rawget(_G, "ALL_CONSTANT_TABLE_NAMES") or {}) do
			if rawget(rawget(_G, tbl) or {}, k) then

				error(("Cannot override global constant %s!"):format(k));
				return;

			end
		end
		
		rawset(self, k, v);
	end;
})

DefineGlobalConstants("E_GCResults", {
	k_EGCResultNotLoggedOn = 3;                       -- number
	k_EGCResultBufferTooSmall = 2;                    -- number
	k_EGCResultOK = 0;                                -- number
	k_EGCResultNoMessage = 1;                         -- number
	k_EGCResultInvalidMessage = 4;                    -- number
});

DefineGlobalConstants("E_ButtonCode", {
	KEY_F = 16;                                       -- number
	KEY_J = 20;                                       -- number
	KEY_7 = 8;                                        -- number
	KEY_PAD_0 = 37;                                   -- number
	KEY_F6 = 97;                                      -- number
	KEY_I = 19;                                       -- number
	KEY_PAD_MULTIPLY = 48;                            -- number
	KEY_Q = 27;                                       -- number
	KEY_2 = 3;                                        -- number
	KEY_PAD_1 = 38;                                   -- number
	KEY_RCONTROL = 84;                                -- number
	KEY_5 = 6;                                        -- number
	BUTTON_CODE_NONE = 0;                             -- number
	KEY_LSHIFT = 79;                                  -- number
	KEY_0 = 1;                                        -- number
	KEY_F3 = 94;                                      -- number
	KEY_PAD_4 = 41;                                   -- number
	KEY_8 = 9;                                        -- number
	KEY_3 = 4;                                        -- number
	KEY_PAD_7 = 44;                                   -- number
	KEY_F1 = 92;                                      -- number
	KEY_Y = 35;                                       -- number
	KEY_APP = 87;                                     -- number
	KEY_BREAK = 78;                                   -- number
	MOUSE_WHEEL_DOWN = 113;                           -- number
	KEY_F2 = 93;                                      -- number
	KEY_RALT = 82;                                    -- number
	KEY_X = 34;                                       -- number
	KEY_K = 21;                                       -- number
	MOUSE_5 = 111;                                    -- number
	KEY_C = 13;                                       -- number
	KEY_D = 14;                                       -- number
	KEY_APOSTROPHE = 56;                              -- number
	MOUSE_MIDDLE = 109;                               -- number
	KEY_BACKQUOTE = 57;                               -- number
	KEY_COMMA = 58;                                   -- number
	KEY_N = 24;                                       -- number
	KEY_O = 25;                                       -- number
	KEY_RWIN = 86;                                    -- number
	MOUSE_RIGHT = 108;                                -- number
	MOUSE_LEFT = 107;                                 -- number
	MOUSE_FIRST = 107;                                -- number
	KEY_COUNT = 107;                                  -- number
	KEY_SCROLLLOCK = 71;                              -- number
	KEY_F4 = 95;                                      -- number
	KEY_SCROLLLOCKTOGGLE = 106;                       -- number
	KEY_DOWN = 90;                                    -- number
	KEY_Z = 36;                                       -- number
	KEY_BACKSLASH = 61;                               -- number
	KEY_F10 = 101;                                    -- number
	KEY_F12 = 103;                                    -- number
	KEY_F11 = 102;                                    -- number
	KEY_4 = 5;                                        -- number
	KEY_F9 = 100;                                     -- number
	KEY_SEMICOLON = 55;                               -- number
	KEY_RIGHT = 91;                                   -- number
	KEY_V = 32;                                       -- number
	KEY_R = 28;                                       -- number
	KEY_1 = 2;                                        -- number
	KEY_F5 = 96;                                      -- number
	KEY_PAD_DIVIDE = 47;                              -- number
	KEY_PAD_9 = 46;                                   -- number
	MOUSE_WHEEL_UP = 112;                             -- number
	KEY_CAPSLOCK = 68;                                -- number
	KEY_S = 29;                                       -- number
	KEY_M = 23;                                       -- number
	KEY_NONE = 0;                                     -- number
	KEY_F7 = 98;                                      -- number
	KEY_T = 30;                                       -- number
	KEY_NUMLOCKTOGGLE = 105;                          -- number
	KEY_CAPSLOCKTOGGLE = 104;                         -- number
	KEY_UP = 88;                                      -- number
	KEY_SLASH = 60;                                   -- number
	KEY_LWIN = 85;                                    -- number
	KEY_P = 26;                                       -- number
	KEY_E = 15;                                       -- number
	KEY_LALT = 81;                                    -- number
	KEY_PAD_6 = 43;                                   -- number
	KEY_RSHIFT = 80;                                  -- number
	KEY_TAB = 67;                                     -- number
	KEY_END = 75;                                     -- number
	KEY_RBRACKET = 54;                                -- number
	KEY_PAGEUP = 76;                                  -- number
	KEY_DELETE = 73;                                  -- number
	KEY_A = 11;                                       -- number
	KEY_HOME = 74;                                    -- number
	KEY_PAD_DECIMAL = 52;                             -- number
	KEY_H = 18;                                       -- number
	KEY_PAD_5 = 42;                                   -- number
	KEY_LAST = 106;                                   -- number
	KEY_ESCAPE = 70;                                  -- number
	BUTTON_CODE_INVALID = -1;                         -- number
	KEY_EQUAL = 63;                                   -- number
	KEY_PAGEDOWN = 77;                                -- number
	KEY_BACKSPACE = 66;                               -- number
	KEY_9 = 10;                                       -- number
	KEY_G = 17;                                       -- number
	KEY_B = 12;                                       -- number
	KEY_PAD_MINUS = 49;                               -- number
	KEY_SPACE = 65;                                   -- number
	MOUSE_4 = 110;                                    -- number
	KEY_NUMLOCK = 69;                                 -- number
	KEY_MINUS = 62;                                   -- number
	KEY_PERIOD = 59;                                  -- number
	KEY_L = 22;                                       -- number
	KEY_LEFT = 89;                                    -- number
	KEY_F8 = 99;                                      -- number
	KEY_LBRACKET = 53;                                -- number
	KEY_PAD_ENTER = 51;                               -- number
	KEY_PAD_8 = 45;                                   -- number
	KEY_W = 33;                                       -- number
	KEY_PAD_PLUS = 50;                                -- number
	KEY_FIRST = 0;                                    -- number
	KEY_INSERT = 72;                                  -- number
	KEY_PAD_3 = 40;                                   -- number
	KEY_PAD_2 = 39;                                   -- number
	KEY_6 = 7;                                        -- number
	KEY_U = 31;                                       -- number
	KEY_LCONTROL = 83;                                -- number
	KEY_ENTER = 64;                                   -- number
});

DefineGlobalConstants("E_UserCmd", {
	IN_ALT2 = 32768;                                  -- number
	IN_RELOAD = 8192;                                 -- number
	IN_MOVERIGHT = 1024;                              -- number
	IN_RUN = 4096;                                    -- number
	IN_WEAPON1 = 1048576;                             -- number
	IN_WEAPON2 = 2097152;                             -- number
	IN_BULLRUSH = 4194304;                            -- number
	IN_GRENADE2 = 16777216;                           -- number
	IN_ATTACK3 = 33554432;                            -- number
	IN_FORWARD = 8;                                   -- number
	IN_ZOOM = 524288;                                 -- number
	IN_WALK = 262144;                                 -- number
	IN_DUCK = 4;                                      -- number
	IN_SCORE = 65536;                                 -- number
	IN_ATTACK2 = 2048;                                -- number
	IN_SPEED = 131072;                                -- number
	IN_ALT1 = 16384;                                  -- number
	IN_ATTACK = 1;                                    -- number
	IN_CANCEL = 64;                                   -- number
	IN_JUMP = 2;                                      -- number
	IN_MOVELEFT = 512;                                -- number
	IN_RIGHT = 256;                                   -- number
	IN_LEFT = 128;                                    -- number
	IN_USE = 32;                                      -- number
	IN_BACK = 16;                                     -- number
});

DefineGlobalConstants("E_MoveType", {
	MOVETYPE_STEP = 3;                                -- number
	MOVETYPE_WALK = 2;                                -- number
	MOVETYPE_FLYGRAVITY = 5;                          -- number
	MOVETYPE_FLY = 4;                                 -- number
	MOVETYPE_NONE = 0;                                -- number
	MOVETYPE_LADDER = 9;                              -- number
	MOVETYPE_ISOMETRIC = 1;                           -- number
	MOVETYPE_OBSERVER = 10;                           -- number
	MOVETYPE_VPHYSICS = 6;                            -- number
	MOVETYPE_CUSTOM = 11;                             -- number
	MOVETYPE_NOCLIP = 8;                              -- number
	MOVETYPE_PUSH = 7;                                -- number
});

DefineGlobalConstants("E_Flows", {
	MAX_FLOWS = 2;                                    -- number
	FLOW_INCOMING = 1;                                -- number
	FLOW_OUTGOING = 0;                                -- number
});

DefineGlobalConstants("E_RuneType", {
	RUNETYPE_TEMP_CRIT = 1;                           -- number
	RUNETYPE_TEMP_UBER = 2;                           -- number
	RUNETYPE_TEMP_NONE = 0;                           -- number
});

DefineGlobalConstants("EGCResults", {
	k_EGCResultNotLoggedOn = 3;                       -- number
	k_EGCResultBufferTooSmall = 2;                    -- number
	k_EGCResultOK = 0;                                -- number
	k_EGCResultNoMessage = 1;                         -- number
	k_EGCResultInvalidMessage = 4;                    -- number
});

DefineGlobalConstants("E_ClearFlags", {
	VIEW_CLEAR_DEPTH = 2;                             -- number
	VIEW_NO_DRAW = 8;                                 -- number
	VIEW_CLEAR_FULL_TARGET = 4;                       -- number
	VIEW_CLEAR_COLOR = 1;                             -- number
	VIEW_CLEAR_STENCIL = 32;                          -- number
	VIEW_CLEAR_OBEY_STENCIL = 16;                     -- number
});

DefineGlobalConstants("E_SignonState", {
	SIGNONSTATE_PRESPAWN = 4;                         -- number
	SIGNONSTATE_FULL = 6;                             -- number
	SIGNONSTATE_NONE = 0;                             -- number
	SIGNONSTATE_NEW = 3;                              -- number
	SIGNONSTATE_CHANGELEVEL = 7;                      -- number
	SIGNONSTATE_CHALLENGE = 1;                        -- number
	SIGNONSTATE_CONNECTED = 2;                        -- number
	SIGNONSTATE_SPAWN = 5;                            -- number
});

DefineGlobalConstants("E_TeamNumber", {
	TEAM_UNASSIGNED = 0;                              -- number
	TEAM_RED = 3;                                     -- number
	TEAM_SPECTATOR = 1;                               -- number
	TEAM_BLU = 2;                                     -- number
});

DefineGlobalConstants("E_FontFlag", {
	FONTFLAG_DROPSHADOW = 128;                        -- number
	FONTFLAG_ANTIALIAS = 16;                          -- number
	FONTFLAG_STRIKEOUT = 4;                           -- number
	FONTFLAG_ROTARY = 64;                             -- number
	FONTFLAG_UNDERLINE = 2;                           -- number
	FONTFLAG_CUSTOM = 1024;                           -- number
	FONTFLAG_NONE = 0;                                -- number
	FONTFLAG_BITMAP = 2048;                           -- number
	FONTFLAG_ITALIC = 1;                              -- number
	FONTFLAG_GAUSSIANBLUR = 32;                       -- number
	FONTFLAG_OUTLINE = 512;                           -- number
	FONTFLAG_ADDITIVE = 256;                          -- number
	FONTFLAG_SYMBOL = 8;                              -- number
});

DefineGlobalConstants("E_RoundState", {
	ROUND_STARTGAME = 2;                              -- number
	ROUND_RUNNING = 4;                                -- number
	ROUND_PREROUND = 3;                               -- number
	ROUND_BONUS = 9;                                  -- number
	ROUND_RESTART = 6;                                -- number
	ROUND_INIT = 0;                                   -- number
	ROUND_BETWEEN_ROUNDS = 10;                        -- number
	ROUND_GAMEOVER = 8;                               -- number
	ROUND_STALEMATE = 7;                              -- number
	ROUND_TEAMWIN = 5;                                -- number
	ROUND_PREGAME = 1;                                -- number
});

DefineGlobalConstants("E_LoadoutSlot", {
	LOADOUT_POSITION_PDA = 5;                         -- number
	LOADOUT_POSITION_TAUNT3 = 13;                     -- number
	LOADOUT_POSITION_MELEE = 2;                       -- number
	LOADOUT_POSITION_UTILITY = 3;                     -- number
	LOADOUT_POSITION_SECONDARY = 1;                   -- number
	LOADOUT_POSITION_ACTION = 9;                      -- number
	LOADOUT_POSITION_PRIMARY = 0;                     -- number
	LOADOUT_POSITION_TAUNT7 = 17;                     -- number
	LOADOUT_POSITION_MISC = 8;                        -- number
	LOADOUT_POSITION_HEAD = 7;                        -- number
	LOADOUT_POSITION_TAUNT8 = 18;                     -- number
	LOADOUT_POSITION_TAUNT5 = 15;                     -- number
	LOADOUT_POSITION_TAUNT4 = 14;                     -- number
	LOADOUT_POSITION_TAUNT6 = 16;                     -- number
	LOADOUT_POSITION_TAUNT2 = 12;                     -- number
	LOADOUT_POSITION_PDA2 = 6;                        -- number
	LOADOUT_POSITION_BUILDING = 4;                    -- number
	LOADOUT_POSITION_MISC2 = 10;                      -- number
	LOADOUT_POSITION_TAUNT = 11;                      -- number
});

DefineGlobalConstants("E_MaterialFlag", {
	MATERIAL_VAR_ENVMAPCAMERASPACE = 524288;          -- number
	MATERIAL_VAR_USE_IN_FILLRATE_MODE = 8;            -- number
	MATERIAL_VAR_MODEL = 2048;                        -- number
	MATERIAL_VAR_VERTEXALPHA = 32;                    -- number
	MATERIAL_VAR_ENVMAPMODE = 33554432;               -- number
	MATERIAL_VAR_FLAT = 4096;                         -- number
	MATERIAL_VAR_VERTEXFOG = 2147483648;              -- number
	MATERIAL_VAR_ALLOWALPHATOCOVERAGE = 536870912;    -- number
	MATERIAL_VAR_NO_DRAW = 4;                         -- number
	MATERIAL_VAR_WIREFRAME = 268435456;               -- number
	MATERIAL_VAR_DEBUG = 1;                           -- number
	MATERIAL_VAR_VERTEXCOLOR = 16;                    -- number
	MATERIAL_VAR_DECAL = 65536;                       -- number
	MATERIAL_VAR_NOFOG = 16384;                       -- number
	MATERIAL_VAR_HALFLAMBERT = 134217728;             -- number
	MATERIAL_VAR_NO_DEBUG_OVERRIDE = 2;               -- number
	MATERIAL_VAR_SUPPRESS_DECALS = 67108864;          -- number
	MATERIAL_VAR_ALPHATEST = 256;                     -- number
	MATERIAL_VAR_ALPHA_MODIFIED_BY_PROXY = 1073741824; -- number
	MATERIAL_VAR_SELFILLUM = 64;                      -- number
	MATERIAL_VAR_NOCULL = 8192;                       -- number
	MATERIAL_VAR_ENVMAPSPHERE = 131072;               -- number
	MATERIAL_VAR_OPAQUETEXTURE = 16777216;            -- number
	MATERIAL_VAR_NEEDS_SOFTWARE_SKINNING = 8388608;   -- number
	MATERIAL_VAR_NORMALMAPALPHAENVMAPMASK = 4194304;  -- number
	MATERIAL_VAR_TRANSLUCENT = 2097152;               -- number
	MATERIAL_VAR_BASEALPHAENVMAPMASK = 1048576;       -- number
	MATERIAL_VAR_IGNOREZ = 32768;                     -- number
	MATERIAL_VAR_ADDITIVE = 128;                      -- number
	MATERIAL_VAR_ZNEARER = 1024;                      -- number
});

DefineGlobalConstants("E_TraceLine", {
	CONTENTS_MONSTER = 33554432;                      -- number
	MASK_NPCFLUID = 33701891;                         -- number
	CONTENTS_CURRENT_DOWN = 8388608;                  -- number
	CONTENTS_OPAQUE = 128;                            -- number
	MASK_NPCSOLID_BRUSHONLY = 147467;                 -- number
	CONTENTS_CURRENT_UP = 4194304;                    -- number
	MAX_COORD_INTEGER = 16384;                        -- number
	MASK_SOLID = 33570827;                            -- number
	CONTENTS_WATER = 32;                              -- number
	MASK_SHOT_HULL = 100679691;                       -- number
	CONTENTS_PLAYERCLIP = 65536;                      -- number
	CONTENTS_GRATE = 8;                               -- number
	CONTENTS_AUX = 4;                                 -- number
	MASK_PLAYERSOLID = 33636363;                      -- number
	CONTENTS_CURRENT_270 = 2097152;                   -- number
	CONTENTS_CURRENT_90 = 524288;                     -- number
	CONTENTS_UNUSED = 512;                            -- number
	MASK_BLOCKLOS_AND_NPCS = 33570881;                -- number
	CONTENTS_CURRENT_180 = 1048576;                   -- number
	MASK_OPAQUE = 16513;                              -- number
	CONTENTS_HITBOX = 1073741824;                     -- number
	SURF_WARP = 8;                                    -- number
	SURF_SKY2D = 2;                                   -- number
	CONTENTS_IGNORE_NODRAW_OPAQUE = 8192;             -- number
	SURF_TRIGGER = 64;                                -- number
	MASK_VISIBLE = 24705;                             -- number
	CONTENTS_ORIGIN = 16777216;                       -- number
	SURF_NODRAW = 128;                                -- number
	MASK_SHOT_BRUSHONLY = 67125251;                   -- number
	CONTENTS_MOVEABLE = 16384;                        -- number
	CONTENTS_TEAM2 = 4096;                            -- number
	CONTENTS_MONSTERCLIP = 131072;                    -- number
	MASK_CURRENT = 16515072;                          -- number
	SURF_HINT = 256;                                  -- number
	CONTENTS_TESTFOGVOLUME = 256;                     -- number
	SURF_BUMPLIGHT = 2048;                            -- number
	CONTENTS_AREAPORTAL = 32768;                      -- number
	SURF_LIGHT = 1;                                   -- number
	CONTENTS_BLOCKLOS = 64;                           -- number
	MASK_PLAYERSOLID_BRUSHONLY = 81931;               -- number
	CONTENTS_SLIME = 16;                              -- number
	MASK_SHOT_PORTAL = 33570819;                      -- number
	CONTENTS_SOLID = 1;                               -- number
	MASK_ALL = 4294967295;                            -- number
	SURF_NODECALS = 8192;                             -- number
	CONTENTS_TRANSLUCENT = 268435456;                 -- number
	CONTENTS_EMPTY = 0;                               -- number
	CONTENTS_WINDOW = 2;                              -- number
	SURF_NOPORTAL = 32;                               -- number
	MAX_TRACE_LENGTH = 56755.840862421;               -- number
	SURF_TRANS = 16;                                  -- number
	SURF_NOSHADOWS = 4096;                            -- number
	MASK_NPCWORLDSTATIC_FLUID = 131075;               -- number
	CONTENTS_DETAIL = 134217728;                      -- number
	MASK_SOLID_BRUSHONLY = 16395;                     -- number
	MASK_NPCWORLDSTATIC = 131083;                     -- number
	MASK_SPLITAREAPORTAL = 48;                        -- number
	MASK_SHOT = 1174421507;                           -- number
	CONTENTS_DEBRIS = 67108864;                       -- number
	MASK_BLOCKLOS = 16449;                            -- number
	MASK_VISIBLE_AND_NPCS = 33579137;                 -- number
	MASK_OPAQUE_AND_NPCS = 33570945;                  -- number
	MASK_WATER = 16432;                               -- number
	MASK_NPCSOLID = 33701899;                         -- number
	SURF_HITBOX = 32768;                              -- number
	SURF_NOCHOP = 16384;                              -- number
	SURF_SKY = 4;                                     -- number
	COORD_EXTENT = 32768;                             -- number
	CONTENTS_TEAM1 = 2048;                            -- number
	SURF_NOLIGHT = 1024;                              -- number
	SURF_SKIP = 512;                                  -- number
	SURF_NOPAINT = 8192;                              -- number
	CONTENTS_CURRENT_0 = 262144;                      -- number
	MASK_DEADSOLID = 65547;                           -- number
	CONTENTS_LADDER = 536870912;                      -- number
	CONTENTS_BLOCKLIGHT = 1024;                       -- number
});

DefineGlobalConstants("E_TFCOND", {
	TFCond_LostFooting = 126;                         -- number
	TFCond_UberchargedHidden = 51;                    -- number
	TFCond_DefenseBuffed = 26;                        -- number
	TFCond_HalloweenKartCage = 88;                    -- number
	TFCond_Teleporting = 10;                          -- number
	TFCond_Buffed = 16;                               -- number
	TFCond_HalloweenBombHead = 53;                    -- number
	TFCond_HalloweenCritCandy = 33;                   -- number
	TFCond_MVMBotRadiowave = 71;                      -- number
	TFCond_FocusBuff = 46;                            -- number
	TFCond_HalloweenGhostMode = 77;                   -- number
	TFCond_ParachuteDeployed = 122;                   -- number
	TFCond_Overhealed = 23;                           -- number
	TFCond_HalloweenThriller = 54;                    -- number
	TFCond_MarkedForDeathSilent = 48;                 -- number
	TFCond_FreezeInput = 87;                          -- number
	TFCond_Zoomed = 1;                                -- number
	TFCond_HasRune = 89;                              -- number
	TFCond_MedigunDebuff = 65;                        -- number
	TFCond_DemoBuff = 18;                             -- number
	TFCond_DefenseBuffNoCritBlock = 42;               -- number
	TFCond_CloakFlicker = 9;                          -- number
	TFCond_CritOnFirstBlood = 37;                     -- number
	TFCond_TmpDamageBonus = 12;                       -- number
	TFCond_UberBulletResist = 58;                     -- number
	TFCond_DefenseBuffMmmph = 45;                     -- number
	TFCond_Bonked = 14;                               -- number
	TFCond_CritOnFlagCapture = 39;                    -- number
	TFCond_Sapped = 50;                               -- number
	TFCond_Stealthed = 64;                            -- number
	TFCond_SwimmingNoEffects = 107;                   -- number
	TFCond_CritMmmph = 44;                            -- number
	TFCond_GrapplingHook = 98;                        -- number
	TFCond_PasstimePenaltyDebuff = 119;               -- number
	TFCond_Milked = 27;                               -- number
	TFCond_Bleeding = 25;                             -- number
	TFCond_BulletImmune = 67;                         -- number
	TFCond_RuneStrength = 90;                         -- number
	TFCond_CompetitiveLoser = 117;                    -- number
	TFCond_Ubercharged = 5;                           -- number
	TFCond_PasstimeInterception = 106;                -- number
	TFCond_CritHype = 36;                             -- number
	TFCond_HalloweenSpeedBoost = 72;                  -- number
	TFCond_Jarated = 24;                              -- number
	TFCond_UberchargedCanteen = 52;                   -- number
	TFCond_CritDemoCharge = 35;                       -- number
	TFCond_Dazed = 15;                                -- number
	TFCond_Slowed = 0;                                -- number
	TFCond_CritOnWin = 38;                            -- number
	TFCond_BlastImmune = 68;                          -- number
	TFCond_CritRuneTemp = 105;                        -- number
	TFCond_Unknown1 = 9;                              -- number
	TFCond_SmallBulletResist = 61;                    -- number
	TFCond_GrapplingHookSafeFall = 99;                -- number
	TFCond_Gas = 123;                                 -- number
	TFCond_Charging = 17;                             -- number
	TFCond_Taunting = 7;                              -- number
	TFCond_Reprogrammed = 43;                         -- number
	TFCond_RunePrecision = 96;                        -- number
	TFCond_Disguising = 2;                            -- number
	TFCond_CritCola = 19;                             -- number
	TFCond_Healing = 21;                              -- number
	TFCond_BlastJumping = 81;                         -- number
	TFCond_HalloweenTiny = 75;                        -- number
	TFCond_HalloweenKartNoTurn = 87;                  -- number
	TFCond_UberchargeFading = 8;                      -- number
	TFCond_Unknown2 = 12;                             -- number
	TFCond_GrapplingHookLatched = 100;                -- number
	TFCond_CritOnDamage = 56;                         -- number
	TFCond_RocketPack = 125;                          -- number
	TFCond_HalloweenKart = 82;                        -- number
	TFCond_NoHealingDamageBuff = 31;                  -- number
	TFCond_RuneKnockout = 103;                        -- number
	TFCond_GrapplingHookBleeding = 101;               -- number
	TFCond_AirCurrent = 127;                          -- number
	TFCond_HalloweenGiant = 74;                       -- number
	TFCond_MiniCritOnKill = 78;                       -- number
	TFCond_DodgeChance = 79;                          -- number
	TFCond_RuneResist = 93;                           -- number
	TFCond_ObscuredSmoke = 79;                        -- number
	TFCond_HalloweenQuickHeal = 73;                   -- number
	TFCond_SmallBlastResist = 62;                     -- number
	TFCond_TeleportedGlow = 6;                        -- number
	TFCond_MegaHeal = 28;                             -- number
	TFCond_MarkedForDeath = 30;                       -- number
	TFCond_RestrictToMelee = 41;                      -- number
	TFCond_Cloaked = 4;                               -- number
	TFCond_Kritzkrieged = 11;                         -- number
	TFCond_AfterburnImmune = 102;                     -- number
	TFCond_UberchargedOnTakeDamage = 57;              -- number
	TFCond_OnFire = 22;                               -- number
	TFCond_BurningPyro = 124;                         -- number
	TFCond_GrappledByPlayer = 121;                    -- number
	TFCond_GrappledToPlayer = 120;                    -- number
	TFCond_HealingDebuff = 118;                       -- number
	TFCond_NoTaunting_DEPRECATED = 118;               -- number
	TFCond_Disguised = 3;                             -- number
	TFCond_SupernovaRune = 111;                       -- number
	TFCond_CompetitiveWinner = 116;                   -- number
	TFCond_RegenBuffed = 29;                          -- number
	TFCond_KnockedIntoAir = 115;                      -- number
	TFCond_SpawnOutline = 114;                        -- number
	TFCond_StealthedUserBuffFade = 66;                -- number
	TFCond_RuneImbalance = 104;                       -- number
	TFCond_KingAura = 113;                            -- number
	TFCond_InHealRadius = 20;                         -- number
	TFCond_PlagueRune = 110;                          -- number
	TFCond_KingRune = 109;                            -- number
	TFCond_HalloweenKartDash = 83;                    -- number
	TFCond_EyeaductUnderworld = 108;                  -- number
	TFCond_RuneAgility = 97;                          -- number
	TFCond_RuneWarlock = 95;                          -- number
	TFCond_RuneVampire = 94;                          -- number
	TFCond_HalloweenInHell = 76;                      -- number
	TFCond_RuneRegen = 92;                            -- number
	TFCond_SwimmingCurse = 86;                        -- number
	TFCond_RuneHaste = 91;                            -- number
	TFCond_MeleeOnly = 85;                            -- number
	TFCond_BalloonHead = 84;                          -- number
	TFCond_DisguisedAsDispenser = 49;                 -- number
	TFCond_Parachute = 80;                            -- number
	TFCond_PreventDeath = 70;                         -- number
	TFCond_FireImmune = 69;                           -- number
	TFCond_SmallFireResist = 63;                      -- number
	TFCond_CritCanteen = 34;                          -- number
	TFCond_UberFireResist = 60;                       -- number
	TFCond_UberBlastResist = 59;                      -- number
	TFCond_RadiusHealOnDamage = 55;                   -- number
	TFCond_DisguiseRemoved = 47;                      -- number
	TFCond_CritOnKill = 40;                           -- number
	TFCond_SpeedBuffAlly = 32;                        -- number
	TFCond_Plague = 112;                              -- number
	TFCond_DeadRingered = 13;                         -- number
});

DefineGlobalConstants("E_KillEffect", {
	TF_CUSTOM_BURNING_ARROW = 17;                     -- number
	TF_CUSTOM_MERASMUS_PLAYER_BOMB = 57;              -- number
	TF_CUSTOM_SAPPER_RECORDER_DEATH = 56;             -- number
	TF_CUSTOM_BACKSTAB = 2;                           -- number
	TF_CUSTOM_TAUNT_HADOUKEN = 7;                     -- number
	TF_CUSTOM_CARRIED_BUILDING = 36;                  -- number
	TF_CUSTOM_CLEAVER = 54;                           -- number
	TF_CUSTOM_MERASMUS_GRENADE = 58;                  -- number
	TF_CUSTOM_MERASMUS_DECAPITATION = 60;             -- number
	TF_CUSTOM_EYEBALL_ROCKET = 50;                    -- number
	TF_CUSTOM_PENETRATE_AIM_HEADSHOT = 14;            -- number
	TF_CUSTOM_SUICIDE = 6;                            -- number
	TF_CUSTOM_CLEAVER_CRIT = 55;                      -- number
	TF_CUSTOM_WRENCH_FIX = 4;                         -- number
	TF_CUSTOM_CANNONBALL_PUSH = 61;                   -- number
	TF_CUSTOM_PUMPKIN_BOMB = 19;                      -- number
	TF_CUSTOM_FLARE_PELLET = 53;                      -- number
	TF_CUSTOM_FLYINGBURN = 18;                        -- number
	TF_CUSTOM_DECAPITATION = 20;                      -- number
	TF_CUSTOM_TAUNT_GRENADE = 21;                     -- number
	TF_CUSTOM_AIM_HEADSHOT_DECAPITATION = 51;         -- number
	TF_CUSTOM_TAUNT_ARMAGEDDON = 52;                  -- number
	TF_CUSTOM_PLASMA_GIB = 48;                        -- number
	TF_CUSTOM_BLEEDING = 34;                          -- number
	TF_CUSTOM_AIR_STICKY_BURST = 25;                  -- number
	TF_CUSTOM_MERASMUS_ZAP = 59;                      -- number
	TF_CUSTOM_PLAYER_SENTRY = 30;                     -- number
	TF_CUSTOM_BOOTS_STOMP = 45;                       -- number
	TF_CUSTOM_PRACTICE_STICKY = 49;                   -- number
	TF_CUSTOM_TAUNT_FENCING = 13;                     -- number
	TF_CUSTOM_SHOTGUN_REVENGE_CRIT = 32;              -- number
	TF_CUSTOM_TAUNT_ENGINEER_ARM = 38;                -- number
	TF_CUSTOM_PLASMA_CHARGED = 47;                    -- number
	TF_CUSTOM_MINIGUN = 5;                            -- number
	TF_CUSTOM_AEGIS_ROUND = 43;                       -- number
	TF_CUSTOM_CHARGE_IMPACT = 23;                     -- number
	TF_CUSTOM_PLASMA = 46;                            -- number
	TF_CUSTOM_ROCKET_DIRECTHIT = 28;                  -- number
	TF_CUSTOM_TAUNT_GRAND_SLAM = 10;                  -- number
	TF_CUSTOM_DEFENSIVE_STICKY = 26;                  -- number
	TF_CUSTOM_TAUNT_ENGINEER_SMASH = 33;              -- number
	TF_CUSTOM_AIM_HEADSHOT = 1;                       -- number
	TF_CUSTOM_TRIGGER_HURT = 40;                      -- number
	TF_CUSTOM_PENETRATE_MY_TEAM = 11;                 -- number
	TF_CUSTOM_TAUNT_HIGH_NOON = 9;                    -- number
	TF_CUSTOM_DECAPITATION_BOSS = 41;                 -- number
	TF_CUSTOM_FLARE_EXPLOSION = 44;                   -- number
	TF_CUSTOM_TAUNT_ARROW_STAB = 15;                  -- number
	TF_CUSTOM_COMBO_PUNCH = 37;                       -- number
	TF_CUSTOM_TAUNT_BARBARIAN_SWING = 24;             -- number
	TF_CUSTOM_TELEFRAG = 16;                          -- number
	TF_CUSTOM_BASEBALL = 22;                          -- number
	TF_CUSTOM_GOLD_WRENCH = 35;                       -- number
	TF_CUSTOM_STANDARD_STICKY = 31;                   -- number
	TF_CUSTOM_TAUNT_UBERSLICE = 29;                   -- number
	TF_CUSTOM_BURNING_FLARE = 8;                      -- number
	TF_CUSTOM_PICKAXE = 27;                           -- number
	TF_CUSTOM_FISH_KILL = 39;                         -- number
	TF_CUSTOM_PENETRATE_ALL_PLAYERS = 12;             -- number
	TF_CUSTOM_BURNING = 3;                            -- number
	TF_CUSTOM_STICKBOMB_EXPLOSION = 42;               -- number
});

DefineGlobalConstants("E_UserMessage", {
	PlayerTauntSoundLoopStart = 70;                   -- number
	SendAudio = 15;                                   -- number
	TrainingMsg = 34;                                 -- number
	VoiceSubtitle = 25;                               -- number
	Rumble = 13;                                      -- number
	TextMsg = 5;                                      -- number
	MVMWaveChange = 62;                               -- number
	MVMAnnouncement = 59;                             -- number
	QuestObjectiveCompleted = 76;                     -- number
	PlayerJarated = 37;                               -- number
	HudNotify = 26;                                   -- number
	PlayerExtinguished = 38;                          -- number
	SayText = 3;                                      -- number
	HintText = 19;                                    -- number
	ResetHUD = 6;                                     -- number
	MVMPlayerUpgradedEvent = 60;                      -- number
	MVMResetPlayerUpgradeSpending = 67;               -- number
	Geiger = 0;                                       -- number
	HudMsg = 21;                                      -- number
	EOTLDuckEvent = 74;                               -- number
	HapPunch = 79;                                    -- number
	Fade = 11;                                        -- number
	HudText = 2;                                      -- number
	MVMResetPlayerStats = 57;                         -- number
	HudArenaNotify = 32;                              -- number
	Train = 1;                                        -- number
	BreakModelRocketDud = 44;                         -- number
	ShowMenu = 9;                                     -- number
	Damage = 18;                                      -- number
	MVMLocalPlayerWaveSpendingValue = 66;             -- number
	PlayerStatsUpdate = 28;                           -- number
	UpdateRadar = 24;                                 -- number
	PlayerLoadoutUpdated = 69;                        -- number
	HapSetDrag = 80;                                  -- number
	VGUIMenu = 12;                                    -- number
	DamageDodged = 36;                                -- number
	Shake = 10;                                       -- number
	PlayerShieldBlocked = 40;                         -- number
	VotePass = 47;                                    -- number
	UpdateAchievement = 33;                           -- number
	BreakModel = 41;                                  -- number
	MVMLocalPlayerUpgradesValue = 64;                 -- number
	ItemPickup = 8;                                   -- number
	MVMPlayerEvent = 56;                              -- number
	KeyHintText = 20;                                 -- number
	HapMeleeContact = 82;                             -- number
	MVMServerKickTimeUpdate = 68;                     -- number
	VoteFailed = 48;                                  -- number
	PlayerPickupWeapon = 75;                          -- number
	SPHapWeapEvent = 77;                              -- number
	SpawnFlyingBird = 52;                             -- number
	MVMWaveFailed = 58;                               -- number
	BonusDucks = 73;                                  -- number
	ForcePlayerViewAngles = 72;                       -- number
	PlayerTauntSoundLoopEnd = 71;                     -- number
	PlayerJaratedFade = 39;                           -- number
	AmmoDenied = 22;                                  -- number
	HapSetConst = 81;                                 -- number
	AchievementEvent = 23;                            -- number
	MVMResetPlayerWaveSpendingStats = 65;             -- number
	MVMLocalPlayerUpgradesClear = 63;                 -- number
	MVMVictory = 61;                                  -- number
	MVMStatsReset = 55;                               -- number
	SayText2 = 4;                                     -- number
	PlayerTeleportHomeEffect = 54;                    -- number
	PlayerBonusPoints = 50;                           -- number
	HapDmg = 78;                                      -- number
	GameTitle = 7;                                    -- number
	PlayerIgnitedInv = 31;                            -- number
	RDTeamPointsChanged = 51;                         -- number
	VoteSetup = 49;                                   -- number
	PlayerGodRayEffect = 53;                          -- number
	CloseCaption = 14;                                -- number
	RequestState = 17;                                -- number
	VoteStart = 46;                                   -- number
	TrainingObjective = 35;                           -- number
	CallVoteFailed = 45;                              -- number
	BreakModel_Pumpkin = 43;                          -- number
	CheapBreakModel = 42;                             -- number
	PlayerIgnited = 30;                               -- number
	MapStatsUpdate = 29;                              -- number
	HudNotifyCustom = 27;                             -- number
	VoiceMask = 16;                                   -- number
});

DefineGlobalConstants("E_LifeState", {
	LIFE_DISCARDAIM_BODY = 4;                         -- number
	LIFE_ALIVE = 0;                                   -- number
	LIFE_RESPAWNABLE = 3;                             -- number
	LIFE_DEAD = 2;                                    -- number
	LIFE_DYING = 1;                                   -- number
});

DefineGlobalConstants("E_BoneMask", {
	BONE_USED_BY_VERTEX_LOD0 = 1024;                  -- number
	BONE_USED_BY_VERTEX_LOD1 = 2048;                  -- number
	BONE_USED_BY_VERTEX_MASK = 261120;                -- number
	BONE_USED_BY_BONE_MERGE = 262144;                 -- number
	BONE_USED_BY_VERTEX_LOD7 = 131072;                -- number
	BONE_USED_BY_VERTEX_LOD5 = 32768;                 -- number
	BONE_USED_BY_VERTEX_LOD6 = 65536;                 -- number
	BONE_USED_BY_VERTEX_LOD2 = 4096;                  -- number
	BONE_USED_BY_HITBOX = 256;                        -- number
	BONE_USED_BY_VERTEX_LOD4 = 16384;                 -- number
	BONE_USED_BY_ANYTHING = 524032;                   -- number
	BONE_USED_BY_VERTEX_LOD3 = 8192;                  -- number
	BONE_USED_BY_ATTACHMENT = 512;                    -- number
});

DefineGlobalConstants("E_PlayerFlag", {
	FL_DUCKING = 2;                                   -- number
	FL_INRAIN = 16;                                   -- number
	FL_INWATER = 512;                                 -- number
	FL_ATCONTROLS = 64;                               -- number
	FL_FROZEN = 32;                                   -- number
	FL_WATERJUMP = 4;                                 -- number
	FL_FAKECLIENT = 256;                              -- number
	FL_ONGROUND = 1;                                  -- number
	FL_CLIENT = 128;                                  -- number
	FL_ONTRAIN = 8;                                   -- number
});

DefineGlobalConstants("E_ProjectileType", {
	TF_PROJECTILE_BREAD_MONSTER = 28;                 -- number
	TF_PROJECTILE_PIPEBOMB = 3;                       -- number
	TF_PROJECTILE_JAR_MILK = 10;                      -- number
	TF_PROJECTILE_SENTRY_ROCKET = 27;                 -- number
	TF_PROJECTILE_SPELL = 21;                         -- number
	TF_PROJECTILE_ENERGY_RING = 13;                   -- number
	TF_PROJECTILE_BULLET = 1;                         -- number
	TF_PROJECTILE_FESTIVE_HEALING_BOLT = 23;          -- number
	TF_PROJECTILE_SYRINGE = 5;                        -- number
	TF_PROJECTILE_STICKY_BALL = 16;                   -- number
	TF_PROJECTILE_ENERGY_BALL = 12;                   -- number
	TF_PROJECTILE_ARROW = 8;                          -- number
	TF_PROJECTILE_PIPEBOMB_PRACTICE = 14;             -- number
	TF_PROJECTILE_FLAME_ROCKET = 9;                   -- number
	TF_PROJECTILE_BREADMONSTER_MADMILK = 25;          -- number
	TF_PROJECTILE_HEALING_BOLT = 11;                  -- number
	TF_PROJECTILE_FESTIVE_JAR = 22;                   -- number
	TF_PROJECTILE_CLEAVER = 15;                       -- number
	TF_PROJECTILE_THROWABLE = 20;                     -- number
	TF_PROJECTILE_BUILDING_REPAIR_BOLT = 18;          -- number
	TF_PROJECTILE_NONE = 0;                           -- number
	TF_PROJECTILE_CANNONBALL = 17;                    -- number
	TF_PROJECTILE_FESTIVE_ARROW = 19;                 -- number
	TF_PROJECTILE_FLARE = 6;                          -- number
	TF_PROJECTILE_GRAPPLINGHOOK = 26;                 -- number
	TF_PROJECTILE_BREADMONSTER_JARATE = 24;           -- number
	TF_PROJECTILE_ROCKET = 2;                         -- number
	TF_PROJECTILE_PIPEBOMB_REMOTE = 4;                -- number
	TF_PROJECTILE_JAR = 7;                            -- number
});

DefineGlobalConstants("E_WeaponBaseID", {
	TF_WEAPON_GRENADE_STICKY_BALL = 89;               -- number
	TF_WEAPON_LUNCHBOX = 59;                          -- number
	TF_WEAPON_PISTOL = 41;                            -- number
	TF_WEAPON_RAYGUN = 78;                            -- number
	TF_WEAPON_BREAKABLE_SIGN = 104;                   -- number
	TF_WEAPON_GRAPPLINGHOOK = 101;                    -- number
	TF_WEAPON_GRENADE_ORNAMENT = 83;                  -- number
	TF_WEAPON_STICKBOMB = 74;                         -- number
	TF_WEAPON_DISPENSER_GUN = 68;                     -- number
	TF_WEAPON_BAT_FISH = 72;                          -- number
	TF_WEAPON_GRENADE_THROWABLE = 93;                 -- number
	TF_WEAPON_CLUB = 5;                               -- number
	TF_WEAPON_LASER_POINTER = 67;                     -- number
	TF_WEAPON_REVOLVER = 43;                          -- number
	TF_WEAPON_WRENCH = 10;                            -- number
	TF_WEAPON_SENTRY_ROCKET = 55;                     -- number
	TF_WEAPON_FISTS = 8;                              -- number
	TF_WEAPON_PDA_SPY_BUILD = 94;                     -- number
	TF_WEAPON_BAT = 1;                                -- number
	TF_WEAPON_FIREAXE = 4;                            -- number
	TF_WEAPON_HANDGUN_SCOUT_SEC = 75;                 -- number
	TF_WEAPON_SHOTGUN_HWG = 14;                       -- number
	TF_WEAPON_FLAME_BALL = 109;                       -- number
	TF_WEAPON_GRENADE_HEAL = 37;                      -- number
	TF_WEAPON_PIPEBOMBLAUNCHER = 24;                  -- number
	TF_WEAPON_SENTRY_BULLET = 54;                     -- number
	TF_WEAPON_GRENADE_MIRV_DEMOMAN = 30;              -- number
	TF_WEAPON_TRANQ = 21;                             -- number
	TF_WEAPON_SPELLBOOK_PROJECTILE = 98;              -- number
	TF_WEAPON_GRENADE_SMOKE_BOMB = 36;                -- number
	TF_WEAPON_GRENADE_JAR = 39;                       -- number
	TF_WEAPON_NONE = 0;                               -- number
	TF_WEAPON_NAILGUN = 44;                           -- number
	TF_WEAPON_STICKY_BALL_LAUNCHER = 88;              -- number
	TF_WEAPON_SHOTGUN_PYRO = 15;                      -- number
	TF_WEAPON_MEDIGUN = 50;                           -- number
	TF_WEAPON_CHARGED_SMG = 103;                      -- number
	TF_WEAPON_PASSTIME_GUN = 102;                     -- number
	TF_WEAPON_DRG_POMSON = 81;                        -- number
	TF_WEAPON_GRENADE_STUNBALL = 38;                  -- number
	TF_WEAPON_SPELLBOOK = 97;                         -- number
	TF_WEAPON_CLEAVER = 86;                           -- number
	TF_WEAPON_MECHANICAL_ARM = 80;                    -- number
	TF_WEAPON_HANDGUN_SCOUT_PRIMARY = 71;             -- number
	TF_WEAPON_ROCKETPACK = 105;                       -- number
	TF_WEAPON_CROWBAR = 6;                            -- number
	TF_WEAPON_CANNON = 91;                            -- number
	TF_WEAPON_KNIFE = 7;                              -- number
	TF_WEAPON_GRENADE_MIRVBOMB = 51;                  -- number
	TF_WEAPON_GRENADE_CLEAVER = 87;                   -- number
	TF_WEAPON_GRENADELAUNCHER = 23;                   -- number
	TF_WEAPON_FLAREGUN = 58;                          -- number
	TF_WEAPON_SLAP = 106;                             -- number
	TF_WEAPON_ROCKETLAUNCHER = 22;                    -- number
	TF_WEAPON_FLAMETHROWER = 25;                      -- number
	TF_WEAPON_HARVESTER_SAW = 96;                     -- number
	TF_WEAPON_BAT_GIFTWRAP = 82;                      -- number
	TF_WEAPON_MINIGUN = 18;                           -- number
	TF_WEAPON_GRENADE_GAS = 32;                       -- number
	TF_WEAPON_SHOVEL = 9;                             -- number
	TF_WEAPON_RAYGUN_REVENGE = 84;                    -- number
	TF_WEAPON_PEP_BRAWLER_BLASTER = 85;               -- number
	TF_WEAPON_COMPOUND_BOW = 61;                      -- number
	TF_WEAPON_PARACHUTE = 100;                        -- number
	TF_WEAPON_GRENADE_NAIL = 28;                      -- number
	TF_WEAPON_GRENADE_WATERBALLOON = 95;              -- number
	TF_WEAPON_PARTICLE_CANNON = 79;                   -- number
	TF_WEAPON_BOTTLE = 3;                             -- number
	TF_WEAPON_SCATTERGUN = 16;                        -- number
	TF_WEAPON_SNIPERRIFLE_DECAP = 77;                 -- number
	TF_WEAPON_SODA_POPPER = 76;                       -- number
	TF_WEAPON_BAT_WOOD = 2;                           -- number
	TF_WEAPON_GRENADE_MIRV = 29;                      -- number
	TF_WEAPON_GRENADE_CONCUSSION = 27;                -- number
	TF_WEAPON_SWORD = 64;                             -- number
	TF_WEAPON_JAR = 60;                               -- number
	TF_WEAPON_CROSSBOW = 73;                          -- number
	TF_WEAPON_BUFF_ITEM = 62;                         -- number
	TF_WEAPON_SMG = 19;                               -- number
	TF_WEAPON_JAR_MILK = 70;                          -- number
	TF_WEAPON_SENTRY_REVENGE = 69;                    -- number
	TF_WEAPON_PISTOL_SCOUT = 42;                      -- number
	TF_WEAPON_BONESAW = 11;                           -- number
	TF_WEAPON_LIFELINE = 66;                          -- number
	TF_WEAPON_GRENADE_DEMOMAN = 53;                   -- number
	TF_WEAPON_PUMPKIN_BOMB = 63;                      -- number
	TF_WEAPON_SHOTGUN_PRIMARY = 12;                   -- number
	TF_WEAPON_INVIS = 57;                             -- number
	TF_WEAPON_SHOTGUN_BUILDING_RESCUE = 90;           -- number
	TF_WEAPON_DISPENSER = 56;                         -- number
	TF_WEAPON_DIRECTHIT = 65;                         -- number
	TF_WEAPON_GRENADE_JAR_MILK = 40;                  -- number
	TF_WEAPON_FLAMETHROWER_ROCKET = 52;               -- number
	TF_WEAPON_THROWABLE = 92;                         -- number
	TF_WEAPON_BUILDER = 49;                           -- number
	TF_WEAPON_PDA_SPY = 48;                           -- number
	TF_WEAPON_PDA_ENGINEER_DESTROY = 47;              -- number
	TF_WEAPON_PDA_ENGINEER_BUILD = 46;                -- number
	TF_WEAPON_GRENADE_JAR_GAS = 108;                  -- number
	TF_WEAPON_JAR_GAS = 107;                          -- number
	TF_WEAPON_SNIPERRIFLE_CLASSIC = 99;               -- number
	TF_WEAPON_GRENADE_PIPEBOMB = 35;                  -- number
	TF_WEAPON_GRENADE_NORMAL = 26;                    -- number
	TF_WEAPON_GRENADE_EMP = 33;                       -- number
	TF_WEAPON_GRENADE_CALTROP = 34;                   -- number
	TF_WEAPON_GRENADE_NAPALM = 31;                    -- number
	TF_WEAPON_PDA = 45;                               -- number
	TF_WEAPON_SYRINGEGUN_MEDIC = 20;                  -- number
	TF_WEAPON_SNIPERRIFLE = 17;                       -- number
	TF_WEAPON_SHOTGUN_SOLDIER = 13;                   -- number
});

DefineGlobalConstants("E_FileAttribute", {
	FILE_ATTRIBUTE_DEVICE = 64;                       -- number
	FILE_ATTRIBUTE_READONLY = 1;                      -- number
	FILE_ATTRIBUTE_RECALL_ON_OPEN = 262144;           -- number
	FILE_ATTRIBUTE_SPARSE_FILE = 512;                 -- number
	FILE_ATTRIBUTE_REPARSE_POINT = 1024;              -- number
	FILE_ATTRIBUTE_ENCRYPTED = 16384;                 -- number
	FILE_ATTRIBUTE_TEMPORARY = 256;                   -- number
	FILE_ATTRIBUTE_UNPINNED = 1048576;                -- number
	FILE_ATTRIBUTE_SYSTEM = 4;                        -- number
	INVALID_FILE_ATTRIBUTES = 4294967295;             -- number
	FILE_ATTRIBUTE_OFFLINE = 4096;                    -- number
	FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS = 4194304;   -- number
	FILE_ATTRIBUTE_PINNED = 524288;                   -- number
	FILE_ATTRIBUTE_VIRTUAL = 65536;                   -- number
	FILE_ATTRIBUTE_NO_SCRUB_DATA = 131072;            -- number
	FILE_ATTRIBUTE_ARCHIVE = 32;                      -- number
	FILE_ATTRIBUTE_INTEGRITY_STREAM = 32768;          -- number
	FILE_ATTRIBUTE_DIRECTORY = 16;                    -- number
	FILE_ATTRIBUTE_HIDDEN = 2;                        -- number
	FILE_ATTRIBUTE_COMPRESSED = 2048;                 -- number
	FILE_ATTRIBUTE_NOT_CONTENT_INDEXED = 8192;        -- number
	FILE_ATTRIBUTE_NORMAL = 128;                      -- number
});

DefineGlobalConstants("E_Hitbox", {
	HITBOX_SPINE_0 = 2;                               -- number
	HITBOX_SPINE_3 = 5;                               -- number
	HITBOX_LOWERARM_L = 7;                            -- number
	HITBOX_UPPERARM_L = 6;                            -- number
	HITBOX_HEAD = 0;                                  -- number
	HITBOX_FOOT_L = 14;                               -- number
	HITBOX_UPPERARM_R = 9;                            -- number
	HITBOX_HAND_L = 8;                                -- number
	HITBOX_HAND_R = 11;                               -- number
	HITBOX_PELVIS = 1;                                -- number
	HITBOX_LOWERARM_R = 10;                           -- number
	HITBOX_FOOT_R = 17;                               -- number
	HITBOX_HIP_R = 15;                                -- number
	HITBOX_KNEE_R = 16;                               -- number
	HITBOX_KNEE_L = 13;                               -- number
	HITBOX_SPINE_2 = 4;                               -- number
	HITBOX_HIP_L = 12;                                -- number
	HITBOX_SPINE_1 = 3;                               -- number
});

DefineGlobalConstants("E_Character", {
	TF2_Pyro = 7;                                     -- number
	TF2_Soldier = 3;                                  -- number
	TF2_Scout = 1;                                    -- number
	TF2_Heavy = 6;                                    -- number
	TF2_Spy = 8;                                      -- number
	TF2_Sniper = 2;                                   -- number
	TF2_Medic = 5;                                    -- number
	TF2_Engineer = 9;                                 -- number
	TF2_Demoman = 4;                                  -- number
});

DefineGlobalConstants("E_MatchAbandonStatus", {
	MATCHABANDON_NOPENALTY = 1;                       -- number
	MATCHABANDON_SAFE = 0;                            -- number
	MATCHABANDON_PENTALTY = 2;                        -- number
});
