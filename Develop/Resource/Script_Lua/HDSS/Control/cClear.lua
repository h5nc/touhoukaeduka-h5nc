LTable_PlayerWinLoseChat	=	
{				
	{0,	"約束通り、お賽銭もらったわよ。",	"これはシャレになれないわね。"},
	{0,	"もう終わり？大したことじゃなかったぜ。",	"も、もう一回勝負しろ！"},
	{0,	"仕事の邪魔しないでくれる？",	"これはまた、困ったね。"},
	{0,	"つまらないものを斬ってしまった。",	"まだまだ修行の不足だ。"},
	{0,	"いい記事になりそう～。",	"さぁ、今日のところ帰るしかないな。"},
	{0,	"うまかったよ。",	"あらら、ららららら～。"},
	{0,	"毒でしびれたか。",	"よくも耐えられたね。"},
	{0,	"やれやれ、本気を出さなくても勝てるね。",	"眩暈がくる。風邪かな。"},
	{0,	"歌って踊ってうれしいや。",	"音をずらしたかな。"},
	{0,	"鳥の歌を甘く見ないでくれ。",	"負けても平気だもん～。"},
	{0,	"あなたも楽しかったか。",	"ううぅ。少し時間をくれ。"},
	{0,	"冷静になれば負けるはずがない。",	"冷静になりすぎてミスをした。"},
	{0,	"狡兎三窟って知ってる？",	"ひど～い。"},
	{0,	"やっぱり満開の花が好き。",	"花を枯らせるやつは許さない。"},
	{0,	"目とあった時点でもう遅かったよ。",	"もう勘弁してくれよ。"},
	{0,	"何か質問あるかしら？",	"あきれたわ。"},
	{0,	"あなたは有罪です。",	"証拠不足で困ります。"},
	{0,	"向こうまで送ってあげるよ。",	"まだまだ未練があるのでは？"},
	{0,	"夜じゃなくても太陽がない限り吸血鬼は無敵だぞ。",	"急に眠くなってきた。帰ろう。"},
	{0,	"約束通リ、オ賽銭モラッタワヨ。",	"コレハしゃれニナレナイワネ。"},
	{0,	"モウ終ワリ？大シタコトジャナカッタゼ。",	"モ、モウ一回勝負シロ！"},
	{0,	"命を大切しないやつは死んじゃえばいいのに。",	"ふぅ～。"},
	{0,	"私はいつも本気です。",	"負けてしまいました。"},
	{0,	"捏造のネタに負けないよ。",	"これだから外を出るのがいやなのよ。"},
}

function CEClear_CloseUsed()
end

function CEClear_ExitState(tostate)
	CEClear_CloseUsed();
	hdssSETSTATE(tostate);
	hdssCLEARALL();
end

function ControlExecute_cClear(timer)
	
	local chati = hdss.Get(HDSS_CHATI);
	local winner = 0;
	local csbegin = CS_L;
	local csafter = CS_R;
	if hdss.Get(HDSS_PLIFE, 1) > 0 then
		winner = 1;
		csbegin = CS_R;
		csafter = CS_L;
	end
	
	if timer == 1 then
		
		--
		if _DEBUG_MatchAndLog > 0 then
			local filename = _DEBUG_GetSaveReplayName();
			hdssSAVEREPLAY(true, true, filename);
			local logstr = "SR :	"..filename;
			LOG(logstr);
			
			_DEBUG_NewRandomMatch();
			
			return true;
			
		end
		--
		
		for i=0, 1 do
			local siadd = 1;
			if i == winner then
				siadd = 0;
			end
			hdssBGVALUE(i, LConst_gamefg_infoid, SI_GameInfo_Winner+siadd, helper_GetCenterX(i), CenterY-100);
			hdssFRONTSPRITE(LConst_game_FrontSprite_WinLoseID_0+i, SI_GameInfo_GameSet, helper_GetCenterX(i), TotalCenterY-160);
			hdssFADEOUTFRONTSPRITE(LConst_game_FrontSprite_WinLoseID_0+i, 64);
		end
	end
		
	
	if chati == 0 then
		hdssCHATON(-1, -1, csbegin);
	elseif chati == 1 then
		hdssCHAT(-1, csbegin, 0);
	elseif chati == 2 then
		hdssCHAT(-1, csafter, 1);
	elseif chati == 3 then
		hdssCHATOFF();
		CEClear_ExitState(STATE_OVER);
	end
end