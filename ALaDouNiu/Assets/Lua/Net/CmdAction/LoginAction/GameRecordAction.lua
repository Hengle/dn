--玩家游戏详细记录请求返回
module("NetWork.Action.GameRecordAction", package.seeall)
local UIWinMgr = require("UI.UIWinMgr").UIWinMgr
local NetCmdActionBase = require("NetWork.Action").NetCmdActionBase

GameRecordAction = NetCmdActionBase:new()

function GameRecordAction:Action(bytes)
    local UIWinMgr = require("UI.UIWinMgr").UIWinMgr
    local GameRecordSm = require("Protol.loginMessage_pb").GameRecordSm()
    GameRecordSm:ParseFromString(bytes)
    Debug.log(stringify(GameRecordSm))
    if GameRecordSm.code ~= 1 then
        Debug.log("没有成功" .. GameRecordSm.code)
        UIWinMgr:OpenErrorNotice(GameRecordSm.code)
        return
    else
        local ClubModule = require("Module.ClubModule").ClubModule
        local ClubRecordWin = UIWinMgr:GetWindow("ClubRecordWin")
        local GameRecordWin = UIWinMgr:GetWindow("GameRecordWin")
        local MainUserData = require("DynamicData.MainUserData").MainUserData
        if ClubModule.isInClubLobby == true then
            if ClubRecordWin.myRecord and #ClubRecordWin.myRecord > 0 then
                Debug.log("xxxxxxxxxxxxxxxxxxxxxxxx")
                Debug.log(ClubRecordWin.myRecord[1].index .. "xxxxx")
                Debug.log(GameRecordSm.index .. "xxxxx")
                for i = 1, #ClubRecordWin.myRecord do
                    if GameRecordSm.index == ClubRecordWin.myRecord[i].index then
                        ClubRecordWin:GameRecordSm(GameRecordSm)
                        break
                    end
                end
            end
        elseif ClubModule.isInClubLobby == false then
            if MainUserData.BattleRecord and #MainUserData.BattleRecord > 0 then
                Debug.log("xxxxxxxxxxxxxxxxxxxxxxxx")
                Debug.log(MainUserData.BattleRecord[1].index .. "xxxxx")
                Debug.log(GameRecordSm.index .. "xxxxx")
                for i = 1, #MainUserData.BattleRecord do
                    Debug.log("xxxxxxxxxxxxxxxxxxxxxxxx")
                    if GameRecordSm.index == MainUserData.BattleRecord[i].index then
                        GameRecordWin:GameRecordSm(GameRecordSm)
                        break
                    end
                end
            end
        end
    end
end

require("NetWork.NetCmdSet").CmdSet[10] = GameRecordAction --注册处理对象
