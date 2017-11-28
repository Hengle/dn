--游戏界面
module("UI.Windows.GameWin", package.seeall)
local UIWinMgr = require("UI.UIWinMgr").UIWinMgr
local UIWindow = require("UI.UIWindow").UIWindow
local UIUtility = require("UI.Utility")
local GameObject = UnityEngine.GameObject
local NetMgr = require("NetWork").NetMgr

local IosPendingTool = require("IosPendingTool").IosPendingTool
local isIosPending = IosPendingTool.IsPending()
local isIOS = IosPendingTool.IsIos()

GameWin = UIWindow:new()
GameWin.name = "GameWin"

--初始化界面
function GameWin:Init()
    local t = self.Container.transform
    self.SpriteTime = UIUtility.FindContorl("UISprite","SpriteTime",t)
    self.QiangZhuang = UIUtility.GetChildTransform("QiangZhuang",t,true)
    self.Setting = UIUtility.GetChildTransform("Setting",t,true)
    self.l_moshi = UIUtility.FindContorl('UISprite',"l_moshi",t)
    self.PinNiu = UIUtility.GetChildTransform("PinNiu",t,true)
    self.Player = UIUtility.GetChildTransform("Player",t,true)
    self.UnStart = UIUtility.GetChildTransform("UnStart",t,true)
    self.b_Qian = UIUtility.GetChildTransform("b_Qian",t,true)
    self.b_BuQiang = UIUtility.GetChildTransform("b_BuQiang",t,true)
    self.L_QZInfo = UIUtility.FindContorl('UILabel',"L_QZInfo",t)
    self.b_setting = UIUtility.GetChildTransform("b_setting",t,true)
    self.b_dissolve = UIUtility.GetChildTransform("b_dissolve",t,true)
    self.b_Break = UIUtility.GetChildTransform("b_Break",t,true)
    self.b_exitGame = UIUtility.GetChildTransform("b_exitGame",t,true)
    self.L_nowTime = UIUtility.FindContorl('UILabel',"l_Time",t)
    self.l_RoomNum = UIUtility.FindContorl('UILabel',"l_RoomNum",t)
    self.l_MoShi = UIUtility.FindContorl('UILabel',"l_MoShi",t)
    self.l_JuShu = UIUtility.FindContorl('UILabel',"l_JuShu",t)
    self.b_youniu = UIUtility.GetChildTransform("b_youniu",t,true)
    self.b_meiniu = UIUtility.GetChildTransform("b_meiniu",t,true)
    self.b_specialNiu = UIUtility.GetChildTransform("b_specialNiu",t,true)
    self.spcialNiu = UIUtility.FindContorl('UISprite',"b_specialNiu",t)
    self.L_PinNiuInfo = UIUtility.FindContorl('UILabel',"L_PinNiuInfo",t)
    self.L_suanpai1 = UIUtility.FindContorl('UILabel',"L_suanpai1",t)
    self.L_suanpai2 = UIUtility.FindContorl('UILabel',"L_suanpai2",t)
    self.L_suanpai3 = UIUtility.FindContorl('UILabel',"L_suanpai3",t)
    self.L_suanpai4 = UIUtility.FindContorl('UILabel',"L_suanpai4",t)
    self.l_pinniuCount = UIUtility.FindContorl('UILabel',"l_pinniuCount",t)
    self.b_CopyNum = UIUtility.GetChildTransform("b_CopyNum",t,true)
    self.b_ZhunBei = UIUtility.GetChildTransform("b_ZhunBei",t,true)
    self.b_Invite = UIUtility.GetChildTransform("b_Invite",t,true)
    self.b_help = UIUtility.GetChildTransform("b_help",t,true)
    self.b_Down = UIUtility.GetChildTransform("b_Down",t,true)
    self.b_Up = UIUtility.GetChildTransform("b_Up",t,true)
    self.b_Chat_y = UIUtility.GetChildTransform("b_Chat_y",t,true)
    self.b_Chat_w = UIUtility.GetChildTransform("b_Chat_w",t,true)

    self.XiaZhu = UIUtility.GetChildTransform("XiaZhu",t,true)
    self.b_xiaZhu1 = UIUtility.GetChildTransform("b_xiaZhu1",t,true)
    self.b_xiaZhu2 = UIUtility.GetChildTransform("b_xiaZhu2",t,true)
    self.b_xiaZhu3 = UIUtility.GetChildTransform("b_xiaZhu3",t,true)
    self.L_xiazhuInfo = UIUtility.FindContorl('UILabel',"L_xiazhuInfo",t)

    self.b_test = UIUtility.GetChildTransform("b_test",t,true)
    self.BeginAni = UIUtility.FindContorl('SpineCtrl',"BeginAni",t)

    self.timeCount = 0
    if isIosPending then
        self.b_Break.gameObject:SetActive(false)
    end
    self.UIClosed = false
    local UIPlayerGameInfo = require("UI.Com.UIPlayerGameInfo").UIPlayerGameInfo
    self.UIPLayers = {}
    local count = self.Player.childCount - 1
    for i = 0, count do
        local t = self.Player:GetChild(i)
        local uiplayer = UIPlayerGameInfo:new()
        uiplayer:Init(t)
        Debug.log("gameWin init:" .. i)
        self.UIPLayers[i + 1] = uiplayer
    end

    self:BindEvents()
    self:BindHander()
end

function GameWin:GetUIPlayerTable()
    return self.UIPLayers
end

function GameWin:ClearUIPlayers()
    for i = 1, #self.UIPLayers do
        self.UIPLayers[i]:Clear()
    end
end

function GameWin:BindEvents()
    function UnStartReady()
        local Msg = require("Protol.roomMessage_pb").PrepareRoomCm()
        NetMgr:SendMsg(211,Msg)

        self.b_ZhunBei.gameObject:SetActive(false)
        self.b_Break.gameObject:SetActive(false)
    end
    UIHelper.BindUIEvnet("Click", UnStartReady, self.b_ZhunBei.gameObject)

    function XiaZhu(obj)
        local objName = obj.name
        local beilv = string.sub(objName,-1,-1)
        Debug.log("beilv:"..beilv)
        beilv = tonumber(beilv)
        local Msg = require("Protol.bullMessage_pb").BetOnCm()
        Msg.betTimes = beilv
        NetMgr:SendMsg(508,Msg)

        self:BetEnd()
    end
    UIHelper.BindUIEvnet("Click", XiaZhu, self.b_xiaZhu1.gameObject)
    UIHelper.BindUIEvnet("Click", XiaZhu, self.b_xiaZhu2.gameObject)
    UIHelper.BindUIEvnet("Click", XiaZhu, self.b_xiaZhu3.gameObject)

    function QiangZhuang()
        local Msg = require("Protol.bullMessage_pb").QiangZhuangCm()
        Msg.qiang = true
        NetMgr:SendMsg(504,Msg)
        self:QZEnd()
    end
    UIHelper.BindUIEvnet("Click", QiangZhuang, self.b_Qian.gameObject)

    function BuQiangZhuang()
        local Msg = require("Protol.bullMessage_pb").QiangZhuangCm()
        Msg.qiang = false
        NetMgr:SendMsg(504,Msg)
        self:QZEnd()
    end
    UIHelper.BindUIEvnet("Click", BuQiangZhuang, self.b_BuQiang.gameObject)

    function FinishPinNiu()
        local Msg = require("Protol.bullMessage_pb").FinishPukeCm()
        NetMgr:SendMsg(512,Msg)

        self:EndPinNiu()
    end

    function YouNiu()
        if self.isYouNiu then
            FinishPinNiu()
        else
            self:NiuNoticeInfo()
        end
    end

    function MeiNiu()
        if self.isYouNiu then
            self:NiuNoticeInfo()
        else
            FinishPinNiu()
        end
    end

    UIHelper.BindUIEvnet("Click", YouNiu, self.b_youniu.gameObject)
    UIHelper.BindUIEvnet("Click", MeiNiu, self.b_meiniu.gameObject)
    UIHelper.BindUIEvnet("Click", FinishPinNiu, self.b_specialNiu.gameObject)

    function SettingDown()
        if self.SettingUp then
            self.SettingUp = false
            self.b_Up.gameObject:SetActive(true)
            self.b_Down.gameObject:SetActive(false)
            self.Setting.gameObject:SetActive(true)
        else
            self.SettingUp = true
            self.b_Up.gameObject:SetActive(false)
            self.b_Down.gameObject:SetActive(true)
            self.Setting.gameObject:SetActive(false)
        end
    end
    UIHelper.BindUIEvnet("Click", SettingDown, self.b_Down.gameObject)
    UIHelper.BindUIEvnet("Click", SettingDown, self.b_Up.gameObject)

    function ExitRoom()
        local RoomModule = require("Module.RoomModule").RoomModule
        RoomModule.LeaveRoomCm()
    end
    UIHelper.BindUIEvnet("Click", ExitRoom, self.b_exitGame.gameObject)

    function DissolveRoom()
        function callBack()
            local RoomModule = require("Module.RoomModule").RoomModule
            RoomModule.DissolveRoomCm()
        end
        
        UIWinMgr:OpenNotice("您确定要解散房间吗",callBack)
    end
    UIHelper.BindUIEvnet("Click", DissolveRoom, self.b_dissolve.gameObject)

    function BackToLobby()
        self:Close()
        local MainWin = UIWinMgr:GetWindow("MainWin")
        MainWin.m_BackRoom.gameObject:SetActive(true)
        MainWin.CrBtn.gameObject:SetActive(false)
        MainWin:Show()
    end
    UIHelper.BindUIEvnet("Click", BackToLobby, self.b_Break.gameObject)

    function Test()
        local NetMgr = require("NetWork").NetMgr
        NetMgr:CloseConnection()
        NetMgr.loseHeartBeatRtn = 0
        Event.Brocast(EventDefine.OnConnectClose)
    end
    UIHelper.BindUIEvnet("Click", Test, self.b_test.gameObject)

     function FunChat()
        UIWinMgr:OpenWindow("ChatWin")
    end
    UIHelper.BindUIEvnet("Click", FunChat, self.b_Chat_w.gameObject)

    function Pause(pause)
        local GameHost = require("Module.GameModule.GameHost").GameHost
        if self.UIClosed == false and not GameHost.isGameOver then
            if pause then
                local NetMgr = require("NetWork").NetMgr
                NetMgr:CloseConnection()
                NetMgr.loseHeartBeatRtn = 0
            else
                function Delay()
                    local PaiWin = UIWinMgr:GetWindow("PaiWin")
                    PaiWin:ClearPai()
                    self:ClearUIPlayers()
                    UIWinMgr:CloseWindow("XiaoJieSuanWin")
                    Event.Brocast(EventDefine.OnConnectClose)
                end
                CountDownMgr.Instance:CreateCountDown(0.1,0.1,Delay)
            end
        end
    end

    local BehaviourEvent = require("BehaviourEvent").BehaviourEvent
    BehaviourEvent:Bind("OnApplicationPause", self.Container.gameObject, Pause)

    function OpenHelpWin()
        UIWinMgr:OpenWindow("HelpWin")
    end
    UIHelper.BindUIEvnet("Click", OpenHelpWin, self.b_help.gameObject)

    function OpenSettingWin()
        UIWinMgr:OpenWindow("SettingWin")
    end
    UIHelper.BindUIEvnet("Click", OpenSettingWin, self.b_setting.gameObject)

    function VoiceChat(g, isPressed)
        if isPressed then
            UIWinMgr:OpenWindow("VoiceChatWin")
        else
            UIWinMgr:CloseWindow("VoiceChatWin")
        end
    end
    UIHelper.BindUIEvnet("Press", VoiceChat, self.b_Chat_y.gameObject)

    function InviteFriend()
        local RoomModule = require("Module.RoomModule").RoomModule
        RoomModule.InviteFriend()
    end
    UIHelper.BindUIEvnet("Click", InviteFriend, self.b_Invite.gameObject)

-- 复制房间号

    function clickCopyNumButtAction()
        Debug.log("------复制房间信息----")
        local GameHost = require("Module.GameModule.GameHost").GameHost
        local playType = {}
        playType.PlayType = GameHost.PlayType
        playType.RoomId = GameHost.RoomId
        local RoomModule = require("Module.RoomModule").RoomModule
        RoomModule.CopyTextToClipBoard(playType)
    end
    UIHelper.BindUIEvnet("Click", clickCopyNumButtAction, self.b_CopyNum.gameObject)
end


function GameWin:FreshBattery()
    function Fresh()
        local date = os.date("%H:%M")
        self.L_nowTime.text = tostring(date)
    end
    function End()
    end
    self.countTimeID = CountDownMgr.Instance:CreateCountDown(999999999, 30, Fresh, End)
end

function GameWin:NiuNoticeInfo()
    if self.isYouNiu then
        self.L_PinNiuInfo.text = "有牛哦~再仔细看看~"
    else
        self.L_PinNiuInfo.text = "没牛哦~再仔细看看~"
    end

    if self.NiuNoticeInfoCountID ~= nil then
        CountDownMgr.Instance:RemoveCountDown(self.NiuNoticeInfoCountID, false)
        self.NiuNoticeInfoCountID = nil
    end
    self.L_PinNiuInfo.gameObject:SetActive(true)

    function NiuNotice()
        self.L_PinNiuInfo.gameObject:SetActive(false)
        self.NiuNoticeInfoCountID = nil
    end

    self.NiuNoticeInfoCountID = CountDownMgr.Instance:CreateCountDown(2,2,NiuNotice)
end

function GameWin:OnShow()

    if isIosPending then
    self.b_Break.gameObject:SetActive(false)
    end
    
    self.UIClosed = false
    self:FreshBattery()

end

function GameWin:OnClose()
    self.UIClosed = true
    if self.countTimeID ~= nil then
        CountDownMgr.Instance:RemoveCountDown(self.countTimeID, false)
        self.countTimeID = nil
    end
end

function GameWin:InitInfo()
    UIWinMgr:OpenWindow("PaiWin")
    --[[local GameHost = require("Module.GameModule.GameHost").GameHost
    local allRounds = 10
    if GameHost.PlayType.round == 1 then
        allRounds = 10
    elseif GameHost.PlayType.round == 2 then
        allRounds = 20
    end
    self.l_JuShu.text = "局数：0/"..allRounds

    self.l_RoomNum.text = "房号："..GameHost.RoomId]]--
    
    local GameHost = require("Module.GameModule.GameHost").GameHost
    if GameHost.clubName ~= nil then
        self.l_RoomNum.text = tostring(GameHost.clubName) .. "-" .. GameHost.clubDeskNum .. "桌"
    else
        self.l_RoomNum.text = "房号："..GameHost.RoomId
    end
    if GameHost.PlayType.bankerMode == 1 then
        self.l_MoShi.text = "模式：抢庄"
    elseif GameHost.PlayType.bankerMode == 2 then
        self.l_MoShi.text = "模式：轮庄"
    elseif GameHost.PlayType.bankerMode == 3 then
        self.l_MoShi.text = "模式：固定庄"
    end

    if GameHost.PlayType.pType == 1 then
        self.l_moshi.spriteName = "s02"
    elseif GameHost.PlayType.pType == 2 then
        self.l_moshi.spriteName = "s01"
    end

    self.QiangZhuang.gameObject:SetActive(false)
    self.Setting.gameObject:SetActive(false)
    self.PinNiu.gameObject:SetActive(false)
    self.L_PinNiuInfo.gameObject:SetActive(false)
    self.UnStart.gameObject:SetActive(false)
    self.b_ZhunBei.gameObject:SetActive(true)

    if isIosPending then
        self.b_Break.gameObject:SetActive(false)
    else    
        self.b_Break.gameObject:SetActive(true)
    end
    self.XiaZhu.gameObject:SetActive(false)
    self.BeginAni.gameObject:SetActive(false)

    Debug.log("重置重置重置重置重置重置重置")
end

function GameWin:BindHander()
    local GameHost = require("Module.GameModule.GameHost").GameHost
    function GameStartHander(isStart)
        self.isGameStart = isStart
        if isStart then
            self.SettingUp = true
            self.UnStart.gameObject:SetActive(false)
            self.b_Up.gameObject:SetActive(false)
            self.b_Down.gameObject:SetActive(true)
            self.Setting.gameObject:SetActive(false)
            self.b_dissolve.gameObject:SetActive(false)
            self.b_Break.gameObject:SetActive(false)
            self.b_exitGame.gameObject:SetActive(false)
        else
            self.SettingUp = false
            self.UnStart.gameObject:SetActive(true)
            self.b_Up.gameObject:SetActive(true)
            self.b_Down.gameObject:SetActive(false)
            self.Setting.gameObject:SetActive(true)

            local myPlayer = GameHost:GetSelfPlayer()
            if myPlayer.userInfo.isMaster then
                self.b_dissolve.gameObject:SetActive(true)
                self.b_Break.gameObject:SetActive(true)
                self.b_exitGame.gameObject:SetActive(false)
            else
                self.b_dissolve.gameObject:SetActive(false)
                self.b_Break.gameObject:SetActive(true)
                self.b_exitGame.gameObject:SetActive(true)
            end
        end
    end
    self.MyGameStartHander = GameStartHander
    Event.AddListener(EventDefine.OnGameStart, self.MyGameStartHander)

    function GameRoundHander(round)
        --更新局数
        local GameHost = require("Module.GameModule.GameHost").GameHost
        local allRounds = 10
        if GameHost.PlayType.round == 1 then
            allRounds = 10
        elseif GameHost.PlayType.round == 2 then
            allRounds = 20
        end
        self.l_JuShu.text = "局数："..round.."/"..allRounds
    end
    self.MyGameRoundHander = GameRoundHander
    Event.AddListener(EventDefine.OnGameRoundChange, self.MyGameRoundHander)
end

function GameWin:FaPaiAni()
    self.BeginAni.gameObject:SetActive(true)
    self.BeginAni:DoAni("kaishi", false, false)

    function Close()
        self.BeginAni.gameObject:SetActive(false)
    end
    CountDownMgr.Instance:CreateCountDown(1.7,1.7,Close)
end

function GameWin:QzBeginCast()
    self.QiangZhuang.gameObject:SetActive(true)

    function QZCountDown(countTime)
        self.L_QZInfo.text = countTime
    end

    function QZEnd()
        self.QZCountTimeID = nil
        self.QiangZhuang.gameObject:SetActive(false)
    end

    self.QZCountTimeID = CountDownMgr.Instance:CreateCountDown(6,1,QZCountDown,QZEnd)
end

--抢庄返回，或者倒计时走完，自动不抢庄
function GameWin:QZEnd()
    self.QiangZhuang.gameObject:SetActive(false)
    if self.QZCountTimeID ~= nil then
        CountDownMgr.Instance:RemoveCountDown(self.QZCountTimeID, false)
        self.QZCountTimeID = nil
    end
end

function GameWin:BetOnBeginCast()
    self.XiaZhu.gameObject:SetActive(true)

    function BetCountDown(countTime)
        self.L_xiazhuInfo.text = countTime
    end

    function BetEnd()
        self.BetCountTimeID = nil
        self.XiaZhu.gameObject:SetActive(false)
    end

    self.BetCountTimeID = CountDownMgr.Instance:CreateCountDown(8,1,BetCountDown,BetEnd)
end

--下注结束
function GameWin:BetEnd()
    self.XiaZhu.gameObject:SetActive(false)

    if self.BetCountTimeID ~= nil then
        CountDownMgr.Instance:RemoveCountDown(self.BetCountTimeID, false)
        self.BetCountTimeID = nil
    end
end

function GameWin:BeginPinNiu(FaLastPukeCast)
    self.PinNiu.gameObject:SetActive(true)
    self.timeCount = 1
    function FillAmount()
        if self.timeCount > 0 then
            if isIOS then
                self.timeCount = self.timeCount-0.0039*2
            end
            self.timeCount = self.timeCount-0.0039
        end

            self.SpriteTime.fillAmount = self.timeCount

	 end

    function FillEnd()
        self.SpriteTime.fillAmount = 0
        self.fillAmountTime = nil
    end
   self.fillAmountTime = CountDownMgr.Instance:CreateCountDown(5,0.01,FillAmount,FillEnd)

    self.L_suanpai1.text = ""
    self.L_suanpai2.text = ""
    self.L_suanpai3.text = ""
    self.L_suanpai4.text = ""
    --牛信息更新
    if FaLastPukeCast.niu <= 10 then
        self.b_youniu.gameObject:SetActive(true)
        self.b_meiniu.gameObject:SetActive(true)
        self.b_specialNiu.gameObject:SetActive(false)
        if FaLastPukeCast.niu == 0 then
            self.isYouNiu = false
        else
            self.isYouNiu = true
            local num1 = FaLastPukeCast.puke[FaLastPukeCast.niuIndex[1]].num
            if num1 > 10 then
                num1 = 10
            end
            local num2 = FaLastPukeCast.puke[FaLastPukeCast.niuIndex[2]].num
            if num2 > 10 then
                num2 = 10
            end
            local num3 = FaLastPukeCast.puke[FaLastPukeCast.niuIndex[3]].num
            if num3 > 10 then
                num3 = 10
            end
            self.L_suanpai1.text = tostring(num1)
            self.L_suanpai2.text = tostring(num2)
            self.L_suanpai3.text = tostring(num3)
            self.L_suanpai4.text = tostring(num1+num2+num3)
        end
    else
        self.b_youniu.gameObject:SetActive(false)
        self.b_meiniu.gameObject:SetActive(false)
        self.spcialNiu.spriteName = "V2_Menu_DNF_4"..FaLastPukeCast.niu
        self.b_specialNiu.gameObject:SetActive(true)
    end

    function PinNiuCountDown(countTime)
        if countTime == "3" or  countTime == "2" or  countTime == "1" then
            local SoundModule = require("Module.SoundModule").SoundModule
            SoundModule:PlaySound("schtime1")
        end
        self.l_pinniuCount.text = countTime
    end

    function PinNiuEnd()
        self.PinNiuCountTimeID = nil
        self.PinNiu.gameObject:SetActive(false)
    end

    self.PinNiuCountTimeID = CountDownMgr.Instance:CreateCountDown(5,1,PinNiuCountDown,PinNiuEnd)

end

function GameWin:EndPinNiu()
    self.PinNiu.gameObject:SetActive(false)

    if self.fillAmountTime ~= nil then
        CountDownMgr.Instance:RemoveCountDown(self.fillAmountTime, false)
        self.fillAmountTime = nil
    end

    if self.PinNiuCountTimeID ~= nil then
        CountDownMgr.Instance:RemoveCountDown(self.PinNiuCountTimeID, false)
        self.PinNiuCountTimeID = nil
    end
end

function GameWin:OnDestroy()
    Event.RemoveListener(EventDefine.OnGameStart, self.MyGameStartHander)
    Event.RemoveListener(EventDefine.OnGameRoundChange, self.MyGameRoundHander)
end


