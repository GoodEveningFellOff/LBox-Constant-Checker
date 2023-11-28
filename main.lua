local function CheckConstants(bIncludeUnknownTables, bLogInfo)
	local LOG = bLogInfo and printc or function(...) end;

	local aKnownConstantTables = {};
	local aUnknownConstantTables = {};

	for _, k in pairs({
		"E_UserCmd", "E_ButtonCode", "E_LifeState", "E_UserMessage", "E_WeaponBaseID", 
		"E_TFCOND", "E_SignonState", "E_KillEffect", "E_Character", "E_TraceLine", 
		"E_MaterialFlag", "E_LoadoutSlot", "E_RoundState", "E_PlayerFlag", "E_FontFlag", 
		"E_MatchAbandonStatus", "E_FileAttribute", "E_TeamNumber", "E_RuneType", "E_ProjectileType",
		"E_MoveType", "E_Hitbox", "E_BoneMask", "E_GCResults", "E_ClearFlags"
	}) do
		aKnownConstantTables[k] = false;
	end

	LOG(55, 255, 255, 255, [[
/-----------------------------------------------------------\
|                 Starting constant check!                  |
|-----------------------------------------------------------|
|                                                           |]]);

	for G_key, G_tbl in pairs(_G) do
		if G_key:find("E_") == 1 and type(G_tbl) == "table" then
			if aKnownConstantTables[G_key] ~= nil or bIncludeUnknownTables then
				if aKnownConstantTables[G_key] ~= nil then
					aKnownConstantTables[G_key] = true;

				else
					aUnknownConstantTables[#aUnknownConstantTables + 1] = G_key;
				end


				local iSize = 0;
				local iMissing = 0;
		
				for k, v in pairs(G_tbl) do
					iSize = iSize + 1;

					if not _G[k] then
						iMissing = iMissing + 1;	
						_G[k] = v;
					end
				end
				
				local sText = ("%s (%i / %i missing)"):format(G_key, iMissing, iSize);
				local iFiller = 57 - sText:len();

				for i = 1, math.ceil(iFiller / 2) do
					sText = ' ' .. sText;
				end

				for i = 1, math.floor(iFiller / 2) do
					sText = sText .. ' ';
				end

				LOG((iMissing ~= 0) and 255 or 55, (iMissing ~= 0) and 55 or 255, 55, 255, "|>" .. sText .. "<|");
			end
		end
	end

	LOG(55, 255, 255, 255, [[
|                                                           |
|-----------------------------------------------------------|
|               Missing known constant tables               |
|-----------------------------------------------------------|
|                                                           |]]);

	for k, v in pairs(aKnownConstantTables) do
		if not v then
			local sText = tostring(k);
			local iFiller = 57 - sText:len();

			for i = 1, math.ceil(iFiller / 2) do
				sText = " " .. sText;
			end

			for i = 1, math.floor(iFiller / 2) do
				sText = sText .. " ";
			end

			LOG(255, 55, 55, 255, "|>" .. sText .. "<|");
		end
	end

	if bIncludeUnknownTables then

		LOG(55, 255, 255, 255, [[
|                                                           |
|-----------------------------------------------------------|
|             Refreshed unknown constant tables             |
|-----------------------------------------------------------|
|                                                           |]]);

		for _, k in pairs(aUnknownConstantTables) do
			local sText = tostring(k);
			local iFiller = 57 - sText:len();

			for i = 1, math.ceil(iFiller / 2) do
				sText = " " .. sText;
			end

			for i = 1, math.floor(iFiller / 2) do
				sText = sText .. " ";
			end

			LOG(255, 100, 55, 255, "|>" .. sText .. "<|");
		end
	end

	LOG(55, 255, 255, 255, [[
|                                                           |
|-----------------------------------------------------------|
|                   Constants refreshed!                    |
\-----------------------------------------------------------/]]);
end

CheckConstants(true, true)
