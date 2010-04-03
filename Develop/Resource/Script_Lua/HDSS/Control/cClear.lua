LTable_PlayerWinLoseChat	=	
{				
	{0,	"�s��ͨ�ꡢ��ِ�E���ä���衣",	"����ϥ����ˤʤ�ʤ���͡�"},
	{0,	"�⤦�K��ꣿ�󤷤����Ȥ���ʤ��ä�����",	"�⡢�⤦һ�؄�ؓ����"},
	{0,	"���¤�аħ���ʤ��Ǥ���룿",	"����Ϥޤ������ä��͡�"},
	{0,	"�Ĥޤ�ʤ���Τ�ؤäƤ��ޤä���",	"�ޤ��ޤ����Фβ������"},
	{0,	"����ӛ�¤ˤʤꤽ������",	"���������դΤȤ��펢�뤷���ʤ��ʡ�"},
	{0,	"���ޤ��ä��衣",	"����顢�����顫��"},
	{0,	"���Ǥ��Ӥ줿����",	"�褯���ͤ���줿�͡�"},
	{0,	"����졢���ݤ�����ʤ��Ƥ�٤Ƥ�͡�",	"ѣ�������롣�Lа���ʡ�"},
	{0,	"��ä�ӻ�äƤ��줷���䡣",	"���򤺤餷�����ʡ�"},
	{0,	"�B�θ��ʤ�Ҋ�ʤ��Ǥ��졣",	"ؓ���Ƥ�ƽ�ݤ���󡫡�"},
	{0,	"���ʤ���S�����ä�����",	"���������٤��r�g�򤯤졣"},
	{0,	"�侲�ˤʤ��ؓ����Ϥ����ʤ���",	"�侲�ˤʤꤹ���ƥߥ��򤷤���"},
	{0,	"�ƃ����ߤä�֪�äƤ룿",	"�Ҥɡ�����"},
	{0,	"��äѤꜺ�_�λ����ä���",	"����ݤ餻���Ĥ��S���ʤ���"},
	{0,	"Ŀ�Ȥ��ä��r��Ǥ⤦�W���ä��衣",	"�⤦���ͤ��Ƥ���衣"},
	{0,	"�Τ��|�����뤫���飿",	"�����줿�"},
	{0,	"���ʤ�������Ǥ���",	"�^�����������ޤ���"},
	{0,	"�򤳤��ޤ��ͤäƤ�����衣",	"�ޤ��ޤ�δ��������ΤǤϣ�"},
	{0,	"ҹ����ʤ��Ƥ�̫ꖤ��ʤ��ޤ���Ѫ��ϟo��������",	"�����ߤ��ʤäƤ�����������"},
	{0,	"�s��ͨ�ꡢ��ِ�E���å���衣",	"����Ϥ����˥ʥ�ʥ���͡�"},
	{0,	"�⥦�K��ꣿ�󥷥����ȥ���ʥ��å�����",	"�⡢�⥦һ�؄�ؓ����"},
	{0,	"������Ф��ʤ���Ĥ����󤸤㤨�Ф����Τˡ�",	"�դ�����"},
	{0,	"˽�Ϥ��ĤⱾ�ݤǤ���",	"ؓ���Ƥ��ޤ��ޤ�����"},
	{0,	"����Υͥ���ؓ���ʤ��衣",	"���������������Τ�����ʤΤ衣"},
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