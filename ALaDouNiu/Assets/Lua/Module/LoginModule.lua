--登陆模块
module("Module.LoginModule", package.seeall)

LoginModule = {}

local UpdateConfig = Asset.Script.Update.UpdateConfig
LoginModule.Logining = false
-- LoginModule.SessionUrl = "http://192.168.0.42:8118/Login/functionServlet" --获取Session的地址
--LoginModule.SessionUrl = "http://119.23.104.30:8117/Login/functionServlet"
--LoginModule.SessionUrl = "http://192.168.0.219:8116/Login/functionServlet" --内网地址
--LoginModule.SessionUrl = "http://120.78.174.39:8118/Login/functionServlet" -- 外网服务器地址 -- 打包链接
LoginModule.SessionUrl = "http://192.168.0.111:8118/Login/functionServlet"

local json = require("cjson")
local NetMgr = require("NetWork").NetMgr
local UIWinMgr = require("UI.UIWinMgr").UIWinMgr

--获取登陆数据
function LoginModule:GetLoginData(token, callBack, isOldSeesion)
    if self.LockGetLoginData then
        Debug.log("正在获取登陆数据中")
        return
    end
    self.LockGetLoginData = true
    function LoginDataCallBack(ok, strData)
        self.LockGetLoginData = false
        if not ok then
            --UIWinMgr:OpenNotice("获取登陆数据失败")
            callBack(nil)
            return
        end
        Debug.log("登陆数据：" .. strData)
        local jsondata = json.decode(strData)
        if 1 == jsondata.code then
            UnityEngine.PlayerPrefs.SetString("lastSession", jsondata.sessionCode) --缓存Session
        end
        callBack(jsondata)
    end

    function GetMWRoomCallBack(roomID)
        wwwfrom = UnityEngine.WWWForm()
        wwwfrom:AddField("type", "login")
        if isOldSeesion then
            Debug.log("isOldSeesion~~~~~~~~~~~~~~~~~~~~~~~" .. token)
            wwwfrom:AddField("sessionCode", token)
        else
            wwwfrom:AddField("code", token)
        end
        local IosPendingTool = require("IosPendingTool").IosPendingTool
        local isIosPending = IosPendingTool.IsPending()
        if isIosPending then
            --ios审核游客登陆类型
            wwwfrom:AddField("platformId", 4)
            wwwfrom:AddField("deviceId", UnityEngine.SystemInfo.deviceUniqueIdentifier)
        else
            wwwfrom:AddField("platformId", PlatformTool.Instance:GetPlatformID())
            --wwwfrom:AddField("platformId",3)
            wwwfrom:AddField("deviceId", UnityEngine.SystemInfo.deviceUniqueIdentifier)
            wwwfrom:AddField("roomId", roomID)
        end
        --地区1
        local area = 1
        wwwfrom:AddField("district", area)

        local ConfigModule = require("Module.ConfigModule").ConfigModule
        --self.SessionUrl = ConfigModule.SessionUrl  --连接远程服务器
        require("NetWork.NetHttp").SendRequest(self.SessionUrl, LoginDataCallBack, wwwfrom)
        Debug.log("开始获取登陆数据")
    end

    Debug.log("GetLoginData~~~~~~~~~~~~~~~~~")
    --先获取是否有魔窗房间id
    --PlatformTool.Instance:GetMWRoom("GetRoomNumber", GetMWRoomCallBack)
    GetMWRoomCallBack("")
end

--获取微信Seesion
function LoginModule:GetWXSession(callBack) --
    --[[if self.LockGetWXSession then
        Debug.log("正在获取微信Session中")
        return
    end
    self.LockGetWXSession = true]] local isRecRtn =
        false
    function getAuthCallBack(rtn)
        --self.LockGetWXSession = false
        isRecRtn = true
        Debug.log("getAuthCallBack:" .. rtn)
        local rtnJson = json.decode(rtn)
        if rtnJson.errCode == 0 then
            callBack(rtnJson.code)
        else
            callBack(nil)
            Debug.log("获取微信Seesion失败 errCode：" .. rtnJson.errCode)
        end
    end
    PlatformTool.Instance:DoAuth("sendLoginRequest", "wx1463fc544854bfd0", "login", getAuthCallBack)

    function CheckRecRtn()
        if not isRecRtn then
            function Delay()
                if not isRecRtn then
                    PlatformTool.Instance:DoAuth("sendLoginRequest", "wx1463fc544854bfd0", "login", getAuthCallBack)
                end
            end
            CountDownMgr.Instance:CreateCountDown(0.1, 0.1, Delay)
        end
    end
    CountDownMgr.Instance:CreateCountDown(2, 2, CheckRecRtn)
end

--登陆游戏
function LoginModule:Login(uid, sessionCode, loginTime, serverIp, port)
    if self.LockLogin then
        Debug.log("正在登陆游戏中")
        return
    end
    self.LockLogin = true
    function AsyncCallBack(isOk)
        self.LockLogin = false
        if isOk then
            UnityEngine.PlayerPrefs.SetString("LastAccount", uid)
            local FightOfflineModule = require("Module.FightOfflineModule").FightOfflineModule
            FightOfflineModule.UnRegisterOffLine()
            FightOfflineModule.RegisterOffLine()
            Debug.log("uid:" .. uid)
            local Msg = require("Protol.loginMessage_pb").LoginCm()
            Msg.uid = uid
            Msg.sessionCode = sessionCode
            Msg.loginTime = loginTime
            NetMgr:SendMsg(1, Msg) --发送登陆消息
            local MainUserData = require("DynamicData.MainUserData").MainUserData
            MainUserData.uid = uid
        else
            function Recoonect()
                --self:CreateConnectAndLogin(jsondata)
                self:Login(uid, sessionCode, loginTime, serverIp, port)
            end
            UIWinMgr:OpenNotice("无法连接服务器,是否重新连接", Recoonect)
        end
    end
    NetMgr:CreateConnectionByAsync(serverIp, port, AsyncCallBack) --发起异步建立连接
    Debug.log("Biu~Biu~Biu")
end

--切服登陆
function LoginModule:SwLogin(uid, swCode, sId, type, serverIp, port, roomid, playType)
    if self.LockSwLogin then
        Debug.log("正在切服游戏中")
        return
    end
    if type == 1 then
        UIWinMgr:OpenMask("加入房间中...")
    else
        UIWinMgr:OpenMask("创建房间中...")
    end
    self.LockSwLogin = true
    function AsyncCallBack(isOk)
        if isOk then
            function OnSWLogin(SwLoginSm)
                UIWinMgr:CloseMask()
                self.LockSwLogin = false
                if 1 == SwLoginSm.code then
                    local LoginSm = SwLoginSm.loginSm
                    if 1 == LoginSm.state then
                        if type == 1 then
                            local RoomModule = require("Module.RoomModule").RoomModule
                            RoomModule.JoinRoom(roomid)
                            Debug.log("切服加入房间：" .. LoginSm.roomId)
                        elseif type == 2 then
                            local RoomModule = require("Module.RoomModule").RoomModule
                            RoomModule.CreateRoom(playType)
                        elseif type == 3 then
                            local RoomModule = require("Module.RoomModule").RoomModule
                            RoomModule.ProxyCreateRoom(playType)
                        end
                    else
                        UIWinMgr:OpenErrorNotice(LoginSm.state)
                    end
                else
                    UIWinMgr:OpenErrorNotice(SwLoginSm.code)
                end
                Event.RemoveListener(EventDefine.SWLogin, OnSWLogin)
            end

            Event.AddListener(EventDefine.SWLogin, OnSWLogin)

            local Msg = require("Protol.loginMessage_pb").SwLoginCm()
            Msg.uid = uid
            Msg.swCode = swCode
            Msg.sId = sId
            Msg.type = type
            NetMgr:SendMsg(4, Msg) --发送切服登陆消息
        else
            Debug.log("切服务建立新连接失败")
            UIWinMgr:OpenNotice("连接失败")
            self.LockSwLogin = false
            UIWinMgr:CloseMask()
        end
    end
    NetMgr:CreateConnectionByAsync(serverIp, port, AsyncCallBack) --发起异步建立连接
    Debug.log("切服开始建立连接")
end
