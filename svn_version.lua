require("Script/Language")
local svn="12345"
function getsvn()
return svn
end

function getresversion()
	return LanguageLocalization:GetLocalization("M_RESOURS")..svn
end