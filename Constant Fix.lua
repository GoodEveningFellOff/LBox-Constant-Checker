E_ALL_CONSTANT_TABLE_NAMES = E_ALL_CONSTANT_TABLE_NAMES or {};
E_ALL_CONSTANTS = E_ALL_CONSTANTS or {};

function DefineGlobalConstants(sName, tbl)
	for _, v in pairs(E_ALL_CONSTANT_TABLE_NAMES) do
		if v == sName then
			return;
		end
	end

	_G[sName] = {};

	setmetatable(_G[sName], {
		__index = tbl;
		__newindex = function()
			error("Cannot change global constant table values!!!");
		end;
	});

	E_ALL_CONSTANT_TABLE_NAMES[#E_ALL_CONSTANT_TABLE_NAMES + 1] = sName;
	
	for k, v in pairs(tbl) do
		if E_ALL_CONSTANTS[k] and E_ALL_CONSTANTS[k] ~= v then
			error(("GLOBAL CONSTANT TABLE CONFLICT ERROR WITH %s (new: %s, old: %s)"):format(k, E_ALL_CONSTANTS[k], v));
		
		else
			E_ALL_CONSTANTS[k] = v;
		end
	end
end

setmetatable(_G, {
	__index = E_ALL_CONSTANTS;
	__newindex = function(self, k, v)
		if E_ALL_CONSTANTS[k] then
			error("Cannot change global constant values!!!");
			return;
		end

		rawset(self, k, v);
	end;
});

DefineGlobalConstants("E_GCResults", {
	k_EGCResultNotLoggedOn = 3;                       -- number
	k_EGCResultBufferTooSmall = 2;                    -- number
	k_EGCResultOK = 0;                                -- number
	k_EGCResultNoMessage = 1;                         -- number
	k_EGCResultInvalidMessage = 4;                    -- number
});
