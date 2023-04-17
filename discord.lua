-- Tested on Debian LTS 10 x64 - ET:Legacy 2.81.1
-- Last updated on 04-17-23

-- This script requires cURL--

description = "Discord"
version = "0.9.2"

require "io"

-- Monitor variables
serverip = ""						-- IP or domain name to show
port = ""						-- Port to show
web_mapshots = "https://healthesquad.com/ET/png/" 	-- URL of map png map screenshots (ex: "https://myserver.com/png/")

-- Announces variables
webhook_announces = ""	-- Webhook URL channel for announces (ex: "https://discord.com/api/webhooks/blablablabla/1234567894564545")
webhook_monitor = ""	-- Webhook URL channel for monitoring (ex: "https://discord.com/api/webhooks/blablablabla/1234567894564545")

-- Discord AntiSpamm
mention = ""			-- Role to mention (ex: "<@&1042049815611983104>")

-- ET countries --
countries = {
[0]=	"Unknown",
[1]=	"Asia/Pacific Region", 
[2]=	"Europe", 
[3]=	"Andorra", 
[4]=	"United Arab Emirates",
[5]=	"Afghanistan", 
[6]=	"Antigua and Barbuda", 
[7]=	"Anguilla", 
[8]=	"Albania", 
[9]=	"Armenia",
[10]=	"Netherlands Antilles", 
[11]=	"Angola", 
[12]=	"Antarctica", 
[13]=	"Argentina", 
[14]=	"American Samoa",
[15]=	"Austria", 
[16]=	"Australia", 
[17]=	"Aruba", 
[18]=	"Azerbaijan", 
[19]=	"Bosnia and Herzegovina",
[20]=	"Barbados", 
[21]=	"Bangladesh", 
[22]=	"Belgium", 
[23]=	"Burkina Faso", 
[24]=	"Bulgaria", 
[25]=	"Bahrain",
[26]=	"Burundi", 
[27]=	"Benin", 
[28]=	"Bermuda", 
[29]=	"Brunei Darussalam", 
[30]=	"Bolivia", 
[31]=	"Brazil",
[32]=	"Bahamas", 
[33]=	"Bhutan", 
[34]=	"Bouvet Island", 
[35]=	"Botswana", 
[36]=	"Belarus", 
[37]=	"Belize",
[38]=	"Canada", 
[39]=	"Cocos (Keeling) Islands", 
[40]=	"Congo-Kinshasa",
[41]=	"Central African Republic", 
[42]=	"Congo-Brazzaville", 
[43]=	"Switzerland", 
[44]=	"Cote D'Ivoire", 
[45]=	"Cook Islands",
[46]=	"Chile", 
[47]=	"Cameroon", 
[48]=	"China", 
[49]=	"Colombia", 
[50]=	"Costa Rica", 
[51]=	"Cuba", 
[52]=	"Cape Verde",
[53]=	"Christmas Island", 
[54]=	"Cyprus", 
[55]=	"Czech Republic", 
[56]=	"Germany", 
[57]=	"Djibouti",
[58]=	"Denmark", 
[59]=	"Dominica", 
[60]=	"Dominican Republic", 
[61]=	"Algeria", 
[62]=	"Ecuador", 
[63]=	"Estonia",
[64]=	"Egypt", 
[65]=	"Western Sahara", 
[66]=	"Eritrea", 
[67]=	"Spain", 
[68]=	"Ethiopia", 
[69]=	"Finland", 
[70]=	"Fiji",
[71]=	"Falkland Islands (Malvinas)", 
[72]=	"Micronesia", 
[73]=	"Faroe Islands",
[74]=	"France", 
[75]=	"France, Metropolitan", 
[76]=	"Gabon", 
[77]=	"United Kingdom",
[78]=	"Grenada", 
[79]=	"Georgia", 
[80]=	"French Guiana", 
[81]=	"Ghana", 
[82]=	"Gibraltar", 
[83]=	"Greenland",
[84]=	"Gambia", 
[85]=	"Guinea", 
[86]=	"Guadeloupe", 
[87]=	"Equatorial Guinea", 
[88]=	"Greece", 
[89]=	"South Georgia and the South Sandwich Islands",
[90]=	"Guatemala", 
[91]=	"Guam", 
[92]=	"Guinea-Bissau",
[93]=	"Guyana", 
[94]=	"Hong Kong", 
[95]=	"Heard Island and McDonald Islands", 
[96]=	"Honduras",
[97]=	"Croatia", 
[98]=	"Haiti", 
[99]=	"Hungary", 
[100]=	"Indonesia", 
[101]=	"Ireland", 
[102]=	"Israel", 
[103]=	"India",
[104]=	"British Indian Ocean Territory", 
[105]=	"Iraq", 
[106]=	"Iran",
[107]=	"Iceland", 
[108]=	"Italy", 
[109]=	"Jamaica", 
[110]=	"Jordan", 
[111]=	"Japan", 
[112]=	"Kenya", 
[113]=	"Kyrgyzstan",
[114]=	"Cambodia", 
[115]=	"Kiribati", 
[116]=	"Comoros", 
[117]=	"Saint Kitts and Nevis", 
[118]=	"North Korea",
[119]=	"South Korea", 
[120]=	"Kuwait", 
[121]=	"Cayman Islands",
[122]=	"Kazakhstan", 
[123]=	"Laos", 
[124]=	"Lebanon", 
[125]=	"Saint Lucia",
[126]=	"Liechtenstein", 
[127]=	"Sri Lanka", 
[128]=	"Liberia", 
[129]=	"Lesotho", 
[130]=	"Lithuania", 
[131]=	"Luxembourg",
[132]=	"Latvia", 
[133]=	"Libya", 
[134]=	"Morocco", 
[135]=	"Monaco", 
[136]=	"Moldova",
[137]=	"Madagascar", 
[138]=	"Marshall Islands", 
[139]=	"Macedonia",
[140]=	"Mali", 
[141]=	"Burma", 
[142]=	"Mongolia", 
[143]=	"Macau", 
[144]=	"Northern Mariana Islands",
[145]=	"Martinique", 
[146]=	"Mauritania", 
[147]=	"Montserrat", 
[148]=	"Malta", 
[149]=	"Mauritius", 
[150]=	"Maldives",
[151]=	"Malawi", 
[152]=	"Mexico", 
[153]=	"Malaysia", 
[154]=	"Mozambique", 
[155]=	"Namibia", 
[156]=	"New Caledonia",
[157]=	"Niger", 
[158]=	"Norfolk Island", 
[159]=	"Nigeria", 
[160]=	"Nicaragua", 
[161]=	"Netherlands", 
[162]=	"Norway",
[163]=	"Nepal", 
[164]=	"Nauru", 
[165]=	"Niue", 
[166]=	"New Zealand", 
[167]=	"Oman", 
[168]=	"Panama", 
[169]=	"Peru", 
[170]=	"French Polynesia",
[171]=	"Papua New Guinea", 
[172]=	"Philippines", 
[173]=	"Pakistan", 
[174]=	"Poland", 
[175]=	"Saint Pierre and Miquelon",
[176]=	"Pitcairn Islands", 
[177]=	"Puerto Rico", 
[178]=	"Palestinian Territory",
[179]=	"Portugal", 
[180]=	"Palau", 
[181]=	"Paraguay", 
[182]=	"Qatar", 
[183]=	"Reunion", 
[184]=	"Romania",
[185]=	"Russian Federation", 
[186]=	"Rwanda", 
[187]=	"Saudi Arabia", 
[188]=	"Solomon Islands",
[189]=	"Seychelles", 
[190]=	"Sudan", 
[191]=	"Sweden", 
[192]=	"Singapore", 
[193]=	"Saint Helena", 
[194]=	"Slovenia",
[195]=	"Svalbard and Jan Mayen", 
[196]=	"Slovakia", 
[197]=	"Sierra Leone", 
[198]=	"San Marino", 
[199]=	"Senegal",
[200]=	"Somalia", 
[201]=	"Suriname", 
[202]=	"Sao Tome and Principe", 
[203]=	"El Salvador", 
[204]=	"Syria",
[205]=	"Swaziland", 
[206]=	"Turks and Caicos Islands", 
[207]=	"Chad", 
[208]=	"French Southern Territories",
[209]=	"Togo", 
[210]=	"Thailand", 
[211]=	"Tajikistan", 
[212]=	"Tokelau", 
[213]=	"Turkmenistan",
[214]=	"Tunisia", 
[215]=	"Tonga", 
[216]=	"Timor-Leste", 
[217]=	"Turkey", 
[218]=	"Trinidad and Tobago", 
[219]=	"Tuvalu",
[220]=	"Taiwan", 
[221]=	"Tanzania", 
[222]=	"Ukraine",
[223]=	"Uganda", 
[224]=	"United States Minor Outlying Islands", 
[225]=	"United States", 
[226]=	"Uruguay",
[227]=	"Uzbekistan", 
[228]=	"Holy See (Vatican City State)", 
[229]=	"Saint Vincent and the Grenadines",
[230]=	"Venezuela", 
[231]=	"Virgin Islands, British", 
[232]=	"Virgin Islands, U.S.",
[233]=	"Vietnam", 
[234]=	"Vanuatu", 
[235]=	"Wallis and Futuna", 
[236]=	"Samoa", 
[237]=	"Yemen", 
[238]=	"Mayotte",
[239]=	"Serbia", 
[240]=	"South Africa", 
[241]=	"Zambia", 
[242]=	"Montenegro", 
[243]=	"Zimbabwe",
[244]=	"Anonymous Proxy",
[245]=	"Satellite Provider",
[246]=	"Other",
[247]=	"Aland Islands",
[248]=	"Guernsey",
[249]=	"Isle of Man",
[250]=	"Jersey",
[251]=	"Saint Barthelemy",
[252]=	"Saint Martin",
[255]=	"Localhost",
}

-- Discord flags -- 
flags = {
[0]	=":united_nations:",
[1]	=":united_nations:",
[2]	=":flag_eu:",
[3]	=":flag_ad:",
[4]	=":flag_ae:",
[5]	=":flag-af:",
[6]	=":flag_ag:",
[7]	=":flag_ai:",
[8]	=":flag_al:",
[9]	=":flag_am:",
[10]	=":flag_bq:",
[11]	=":flag_ao:",
[12]	=":flag_aq:",
[13]	=":flag_ar:",
[14]	=":flag_as:",
[15]	=":flag_at:",
[16]	=":flag_au:",
[17]	=":flag_aw:",
[18]	=":flag_az:",
[19]	=":flag_ba:",
[20]	=":flag_bb:",
[21]	=":flag_bd:",
[22]	=":flag_be:",
[23]	=":flag_bf:",
[24]	=":flag_bg:",
[25]	=":flag_bh:",
[26]	=":flag_bi:",
[27]	=":flag_bj:",
[28]	=":flag_bm:",
[29]	=":flag_bn:",
[30]	=":flag_bo:",
[31]	=":flag_br:",
[32]	=":flag_bs:",
[33]	=":flag_bt:",
[34]	=":flag_bv:",
[35]	=":flag_bw:",
[36]	=":flag_by:",
[37]	=":flag_bz:",
[38]	=":flag_ca:",
[39]	=":flag_cc:",
[40]	=":flag_cd:",
[41]	=":flag_cf:",
[42]	=":flag_cg:",
[43]	=":flag_ch:",
[44]	=":flag_ci:",
[45]	=":flag_ck:",
[46]	=":flag_cl:",
[47]	=":flag_cm:",
[48]	=":flag_cn:",
[49]	=":flag_co:",
[50]	=":flag_cr:",
[51]	=":flag_cu:",
[52]	=":flag_cv:",
[53]	=":flag_cx:",
[54]	=":flag_cy:",
[55]	=":flag_cz:",
[56]	=":flag_de:",
[57]	=":flag_dj:",
[58]	=":flag_dk:",
[59]	=":flag_dm:",
[60]	=":flag_do:",
[61]	=":flag_dz:",
[62]	=":flag_ec:",
[63]	=":flag_ee:",
[64]	=":flag_eg:",
[65]	=":flag_eh:",
[66]	=":flag_er:",
[67]	=":flag_es:",
[68]	=":flag_et:",
[69]	=":flag_fi:",
[70]	=":flag_fj:",
[71]	=":flag_fk:",
[72]	=":flag_fm:",
[73]	=":flag_fo:",
[74]	=":flag_fr:",
[75]	=":flag_fr:",
[76]	=":flag_ga:",
[77]	=":flag_gb:",
[78]	=":flag_gd:",
[79]	=":flag_ge:",
[80]	=":flag_fr:",
[81]	=":flag_gh:",
[82]	=":flag_gi:",
[83]	=":flag_gl:",
[84]	=":flag_gm:",
[85]	=":flag_gn:",
[86]	=":flag_gp:",
[87]	=":flag_gq:",
[88]	=":flag_gr:",
[89]	=":flag_gs:",
[90]	=":flag_gt:",
[91]	=":flag_gu:",
[92]	=":flag_gn:",
[93]	=":flag_gy:",
[94]	=":flag_hk:",
[95]	=":flag_hm:",
[96]	=":flag_hn:",
[97]	=":flag_hr:",
[98]	=":flag_ht:",
[99]	=":flag_hu:",
[100]	=":flag_id:",
[101]	=":flag_ie:",
[102]	=":flag_il:",
[103]	=":flag_in:",
[104]	=":flag_in:",
[105]	=":flag_iq:",
[106]	=":flag_ir:",
[107]	=":flag_is:",
[108]	=":flag_it:",
[109]	=":flag_jm:",
[110]	=":flag_jo:",
[111]	=":flag_jp:",
[112]	=":flag_ke:",
[113]	=":flag_kg:",
[114]	=":flag_kh:",
[115]	=":flag_ki:",
[116]	=":flag_km:",
[117]	=":flag_kn:",
[118]	=":flag_kp:",
[119]	=":flag_kr:",
[120]	=":flag_kw:",
[121]	=":flag_ky:",
[122]	=":flag_kz:",
[123]	=":flag_la:",
[124]	=":flag_lb:",
[125]	=":flag_lc:",
[126]	=":flag_li:",
[127]	=":flag_lk:",
[128]	=":flag_lr:",
[129]	=":flag_ls:",
[130]	=":flag_lt:",
[131]	=":flag_lu:",
[132]	=":flag_lv:",
[133]	=":flag_ly:",
[134]	=":flag_ma:",
[135]	=":flag_mc:",
[136]	=":flag_md:",
[137]	=":flag_mg:",
[138]	=":flag_mh:",
[139]	=":flag_mk:",
[140]	=":flag_ml:",
[141]	=":flag_mm:",
[142]	=":flag_mn:",
[143]	=":flag_mo:",
[144]	=":flag_mp:",
[145]	=":flag_mq:",
[146]	=":flag_mr:",
[147]	=":flag_ms:",
[148]	=":flag_mt:",
[149]	=":flag_mu:",
[150]	=":flag_mv:",
[151]	=":flag_mw:",
[152]	=":flag_mx:",
[153]	=":flag_my:",
[154]	=":flag_mz:",
[155]	=":flag_na:",
[156]	=":flag_nc:",
[157]	=":flag_ne:",
[158]	=":flag_nf:",
[159]	=":flag_ng:",
[160]	=":flag_ni:",
[161]	=":flag_nl:",
[162]	=":flag_no:",
[163]	=":flag_np:",
[164]	=":flag_nr:",
[165]	=":flag_nu:",
[166]	=":flag_nz:",
[167]	=":flag_om:",
[168]	=":flag_pa:",
[169]	=":flag_pe:",
[170]	=":flag_pf:",
[171]	=":flag_pg:",
[172]	=":flag_ph:",
[173]	=":flag_pk:",
[174]	=":flag_pl:",
[175]	=":flag_pm:",
[176]	=":flag_pn:",
[177]	=":flag_pr:",
[178]	=":flag_ps:",
[179]	=":flag_pt:",
[180]	=":flag_pw:",
[181]	=":flag_py:",
[182]	=":flag_qa:",
[183]	=":flag_re:",
[184]	=":flag_ro:",
[185]	=":flag_ru:",
[186]	=":flag_rw:",
[187]	=":flag_sa:",
[188]	=":flag_sb:",
[189]	=":flag_sc:",
[190]	=":flag_sd:",
[191]	=":flag_se:",
[192]	=":flag_sg:",
[193]	=":flag_sh:",
[194]	=":flag_si:",
[195]	=":flag_sj:",
[196]	=":flag_sk:",
[197]	=":flag_sl:",
[198]	=":flag_sm:",
[199]	=":flag_sn:",
[200]	=":flag_so:",
[201]	=":flag_sr:",
[202]	=":flag_st:",
[203]	=":flag_sv:",
[204]	=":flag_sy:",
[205]	=":flag_sz:",
[206]	=":flag_tc:",
[207]	=":flag_td:",
[208]	=":flag_tf:",
[209]	=":flag_tg:",
[210]	=":flag_th:",
[211]	=":flag_tj:",
[212]	=":flag_tk:",
[213]	=":flag_tm:",
[214]	=":flag_tn:",
[215]	=":flag_to:",
[216]	=":flag_tl:",
[217]	=":flag_tr:",
[218]	=":flag_tt:",
[219]	=":flag_tv:",
[220]	=":flag_tw:",
[221]	=":flag_tz:",
[222]	=":flag_ua:",
[223]	=":flag_ug:",
[224]	=":flag_um:",
[225]	=":flag_us:",
[226]	=":flag_uy:",
[227]	=":flag_uz:",
[228]	=":flag_va:",
[229]	=":flag_vc:",
[230]	=":flag_ve:",
[231]	=":flag_vg:",
[232]	=":flag_vi:",
[233]	=":flag_vn:",
[234]	=":flag_vu:",
[235]	=":flag_wf:",
[236]	=":flag_ws:",
[237]	=":flag_ye:",
[238]	=":flag_yt:",
[239]	=":flag_cz:",
[240]	=":flag_za:",
[241]	=":flag_zm:",
[242]	=":flag_me:",
[243]	=":flag_zw:",
[244]	=":pirate_flag:",
[245]	=":satellite:",
[246]	=":question:",
[247]	=":flag_ax:",
[248]	=":flag_gg:",
[249]	=":flag_im:",
[250]	=":flag_je:",
[251]	=":flag_bl:",
[252]	=":flag_mf:",
[255]	=":computer:",
}

-- ET Monitor --	
function et_InitGame()
    et.RegisterModname(description .. " " .. version)
	
	local mapname 		= et.trap_Cvar_Get( "mapname" )
	local mapName 		= mapname:gsub("^%l", string.upper)
	local servername 	= et.Q_CleanStr(et.trap_Cvar_Get( "sv_hostname" ))
	
	if et.GS_WARMUP_COUNTDOWN ~= 1 then
		return 0
	else
	
		tbl = {}
		count = 0
		bot_count=0
	
		for i=0, et.trap_Cvar_Get("sv_maxclients") - 1 do
			if isOmnibot(i) == 1 then bot_count = bot_count+1 end
			local cs = et.trap_GetConfigstring(et.CS_PLAYERS + i)
			local name = et.Q_CleanStr(et.Info_ValueForKey(cs, "n"))
			-- local name 		= et.Q_CleanStr(et.Info_ValueForKey(et.trap_GetUserinfo(i), "name"))
				if name 	~= "" and isOmnibot(i) == 0 then
				count 		= count+1
				table.insert(tbl, count, name)
			end
		end
	
		local maxclients 	= et.trap_Cvar_Get("sv_maxclients")
		local names 		= table.concat(tbl, "\\n")
		local players 		= tablelength(tbl)
		local total 		= players + bot_count
		if total 			== bot_count then return end
	
----------------------------------------------- cURL COMMAND --------------------------------------------
		io.popen('curl -H \"Content-Type: application/json\" -d \' \z
		{ \z 
		\"username\": \"MAP UPDATE\", \z
		\"content\": \"'..mention..'\", \z
		\"allowed_mentions\": {\"roles\": [\"1042049815611183104\"]}, \z
		\"embeds\": \z
		[ { \z
		\"description\": \":flag_fr: **'..servername..' - '..total..'/'..maxclients..'**\", \z
		\"image\":{ \"url\": \"'..web_mapshots..''..mapname..'.png\"}, \z
		\"color\": 65280, \z
		\"footer\": { \"text\": \"'..players..' human(s) - '..bot_count..' bot(s)\"}, \z
		\"fields\": \z 
		[ { \z
		\"name\": \"IP Address\", \z
		\"value\": \"'..serverip..'\", \z
		\"inline\": \"true\" \z 
		}, \z
		{ \z
		\"name\": \"Port\", \z 
		\"value\": \"'..port..'\", \z 
		\"inline\": \"true\" \z 
		}, \z	
		{ \z
		\"name\": \"Online Players\", \z 
		\"value\": \"'..names..'\\n + '..bot_count..' bot(s)\", \z 
		\"inline\": \"false\" \z 
		}, \z	
		{ \z
		\"name\": \"Current Map\", \z 
		\"value\": \"'..mapName..'\", \z 
		\"inline\": \"false\" \z 
		} \z
		] }] }\' \z 
		\"'..webhook_monitor..'\"')
----------------------------------------------- cURL COMMAND --------------------------------------------
		tbl = {}
	end
end

-- Announce connections --
function et_ClientConnect(_clientNum, firstTime)
	local clientname 			= et.Q_CleanStr(et.Info_ValueForKey(et.trap_GetUserinfo(_clientNum), "name"))
	if isOmnibot(_clientNum) 	== 1 or firstTime == 0 then return
	else
		local countryCode 		= et.gentity_get(_clientNum, "sess.uci" )
		local countryName 		= countries[countryCode]
		local flag 				= flags[countryCode]
		
		local msg        		= "Connected to server from "..countryName.." "..flag..""
		
		io.popen('curl -H \"Content-Type: application/json\" -d \'\z 
		{\"username\": \"'..clientname..'\", \z
		\"content\": \"'..msg..'\"}\' \z
		\"'..webhook_announces..'\"')		
	end
end

-- Announce disconnections --
function et_ClientDisconnect(_clientNum)
	local clientname 			= et.Q_CleanStr(et.gentity_get(_clientNum ,"pers.netname"))							
	if isOmnibot(_clientNum) 	== 1 then return
		else
			local msg        		= "Disconnected from server"
	
			io.popen('curl -H \"Content-Type: application/json\" -d \'\z
			{\z
			\"username\": \"'..clientname..'\", \z
			\"content\": \"'..msg..'\"\z
			}\' \z
			\"'..webhook_announces..'\"')
		end
	et.trap_SendConsoleCommand( et.EXEC_APPEND, "unset "..clientname.."" )			-- Clean cvars set by line 669
end

-- Announce Team changes--
function et_ClientSpawn(_clientNum, revived, teamChange)
	if isOmnibot(_clientNum) 	== 1 then return
	else
		local clientname = et.Q_CleanStr(et.gentity_get(_clientNum ,"pers.netname"))
		local team = et.gentity_get(_clientNum,"sess.sessionTeam")
		local test = tonumber(et.trap_Cvar_Get(clientname))
		local class = et.gentity_get(_clientNum,"sess.latchPlayerType")
		
		if team 	==	test then return end					--Check if already announced or not
		
		if class 	== 	0 then class = "a Soldier" end
		if class 	== 	1 then class = "a Medic" end
		if class 	== 	2 then class = "an Engineer" end
		if class 	== 	3 then class = "a Field Ops" end
		if class 	== 	4 then class = "a Covert Ops" end
		
		if team 	== 	1 then msg = "Has joined the Axis team as "..class.."" end
		if team 	== 	2 then msg = "Has joined the Allies team as "..class.."" end
		if team 	== 	3 then return end
		
		io.popen('curl -H \"Content-Type: application/json\" -d \'\z
		{\z
		\"username\": \"'..clientname..'\", \z
		\"content\": \"'..msg..'\"\z
		}\' \z
		\"'..webhook_announces..'\"')
--		et.trap_Cvar_Set(clientname, team)						---#Fixme--- Using et.trap_SendConsoleCommand
		et.trap_SendConsoleCommand( et.EXEC_APPEND, "set "..clientname.." "..team.."" )	---#Fixme--- because lua cvar can't be unset.
	end
end

-- Send Global chat to Discord--
function et_ClientCommand( num, cmd )
if cmd == "say" then

   local msg 	= ""
   local name 	= et.Q_CleanStr(et.gentity_get(num, "pers.netname"))
   for i 		= 1, et.trap_Argc() - 1 do
        msg  	= string.format("%s %s", msg, et.Q_CleanStr(et.trap_Argv( i )))
		msg 	= string.gsub(msg,[[\u{(%d+)}]],utf8.char)
		msg 	= string.gsub(msg, "'", "\u{2019}")
		msg 	= string.gsub(msg, "\\", ".")
   end
  io.popen('curl \z
  -H \"Content-Type: application/json\" \z
  -d \'\z
  {\z
  \"username\": \"'..name..'\", \z
  \"content\": \"'..msg..'\", \z
  \"allowed_mentions\": {\"roles\": [\"1042049815611183104\"]}\z
  }\' \z
  \"'..webhook_announces..'\"')
  end
 end

--Discord chat prefix--
function et_ConsoleCommand(command,message)
	if et.trap_Argv(0) 	== "disc" then
		local message 	= et.trap_Argv(1)
		for _, line in ipairs(split(message, 60)) do
            et.trap_SendServerCommand(-1, "chat \"^3Discord -^w "..line.."")
		end
		return 0
	end

	if et.trap_Argv(0) 	== "nopref" then
		local message 	= et.trap_Argv(1)
		for _, line in ipairs(split(message, 60)) do
            et.trap_SendServerCommand(-1, "chat \""..line.."\"")
		end
		return 0
	end
end

--Extra Functions--
function split(str, max_line_length)
   lines = {}
   local line
   str:gsub('(%s*)(%S+)',
      function(spc, word)
         if not line or #line + #spc + #word > max_line_length then
            table.insert(lines, line)
            line = word
         else
            line = line..spc..word
         end
      end
   )
   table.insert(lines, line)
   return lines
end

function tablelength(T)
  local c = 0
  for _ in pairs(T) do c = c + 1 end
  return c
end

function isOmnibot(_clientNum)
local guid = et.Info_ValueForKey(et.trap_GetUserinfo(_clientNum), "cl_guid")
	if string.match(guid, "OMNIBOT")
	then return 1
	else return 0
	end
end
