--
module("UI.Windows.JoinRoomWin",package.seeall)
local UIUtility = require("UI.Utility")
local UIWindow = require("UI.UIWindow").UIWindow
JoinRoomWin = UIWindow:new()
JoinRoomWin.name = "JoinRoomWin" --窗体名字
JoinRoomWin.MaxNumCount = 6

--初始化界面
function JoinRoomWin:Init()
    --初始化界面，保存引用控件
    self.keyNum=""
    local t = self.Container.transform
    --self.roomNum = UIUtility.FindContorl('UILabel',"RoomNum",t)
    self.Grid = UIUtility.GetChildTransform("Grid",t,true)
    self.ss = self.Grid:GetChild(4):GetComponent("UILabel")
    self.closeButton = UIUtility.GetChildTransform("Close",t,true)
    self.key1Button = UIUtility.GetChildTransform("Key1",t,true)
    self.key2Button = UIUtility.GetChildTransform("Key2",t,true)
    self.key3Button = UIUtility.GetChildTransform("Key3",t,true)
    self.key4Button = UIUtility.GetChildTransform("Key4",t,true)
    self.key5Button = UIUtility.GetChildTransform("Key5",t,true)
    self.key6Button = UIUtility.GetChildTransform("Key6",t,true)
    self.key7Button = UIUtility.GetChildTransform("Key7",t,true)
    self.key8Button = UIUtility.GetChildTransform("Key8",t,true)
    self.key9Button = UIUtility.GetChildTransform("Key9",t,true)
    self.key0Button = UIUtility.GetChildTransform("Key0",t,true)
    self.ShanChuButton = UIUtility.GetChildTransform("ShanChu",t,true)
    self.QingKongButton = UIUtility.GetChildTransform("QingKong",t,true)
    self.di = UIUtility.GetChildTransform("di",t,true)
    self.Copy_roomNumButton = UIUtility.GetChildTransform("Copy_roomNum",t,true)

    self:BindEvents()
end

function JoinRoomWin:OnShow()
    self.keyNum=""
    for i=1,self.Grid.childCount do 
        self.Grid:GetChild(i-1):GetComponent("UILabel").text = ""
    end   
end

function JoinRoomWin:BindEvents()
    function InputNum(num)
        if string.len(self.keyNum)<6 then
            self.keyNum=self.keyNum..num
            ShowNum()
            Debug.log(self.keyNum)
            if string.len(self.keyNum)>5 then
                local RoomModule = require("Module.RoomModule").RoomModule
                RoomModule.JoinRoomBeforeCm(self.keyNum)
            end
        end 
    end

    function ShowNum()
        local s = string.len(self.keyNum)
        if s>0 then
            for i=1, s do
                self.Grid:GetChild(i-1):GetComponent("UILabel").text = string.sub( self.keyNum, i, i )
            end
        end
    end

    function QingKong()
        self.keyNum=""
        for i=1,self.Grid.childCount do 
            self.Grid:GetChild(i-1):GetComponent("UILabel").text = ""
        end
    end
    UIHelper.BindUIEvnet("Click", QingKong , self.QingKongButton.gameObject)     

    function ShanChu()
        if string.len(self.keyNum)>1 then
            self.keyNum=string.sub( self.keyNum, 1, -2 )
            for i=1,self.Grid.childCount do 
            self.Grid:GetChild(i-1):GetComponent("UILabel").text = ""
            end
            ShowNum()
        else
            self.keyNum=""
            self.Grid:GetChild(0):GetComponent("UILabel").text = ""
        end
    end
    UIHelper.BindUIEvnet("Click", ShanChu , self.ShanChuButton.gameObject) 

    function Close()
        self:Close()
    end
    UIHelper.BindUIEvnet("Click", Close , self.closeButton.gameObject) 
    UIHelper.BindUIEvnet("Click", Close , self.di.gameObject) 
    
    function Input1()
        InputNum("1")
    end
    UIHelper.BindUIEvnet("Click", Input1 , self.key1Button.gameObject)  


    function Input2()
        InputNum("2")
    end
    UIHelper.BindUIEvnet("Click", Input2 , self.key2Button.gameObject)

    function Input3()
        InputNum("3")
    end
    UIHelper.BindUIEvnet("Click", Input3 , self.key3Button.gameObject) 

    function Input4()
        InputNum("4")
    end
    UIHelper.BindUIEvnet("Click", Input4 , self.key4Button.gameObject)

    function Input5()
        InputNum("5")
    end
    UIHelper.BindUIEvnet("Click", Input5 , self.key5Button.gameObject) 

    function Input6()
        InputNum("6")
    end
    UIHelper.BindUIEvnet("Click", Input6 , self.key6Button.gameObject) 

    function Input7()
        InputNum("7")
    end
    UIHelper.BindUIEvnet("Click", Input7 , self.key7Button.gameObject) 

    function Input8()
        InputNum("8")
    end
    UIHelper.BindUIEvnet("Click", Input8 , self.key8Button.gameObject) 

    function Input9()
        InputNum("9")   
    end
    UIHelper.BindUIEvnet("Click", Input9 , self.key9Button.gameObject) 

    function Input0()
        InputNum("0")
    end
    UIHelper.BindUIEvnet("Click", Input0 , self.key0Button.gameObject)

    --粘贴房间号
    function cilckCopyButtonAction()
       
        self:pasteRoomNumber()
    end
    UIHelper.BindUIEvnet("Click", cilckCopyButtonAction , self.Copy_roomNumButton.gameObject)
end

--粘贴房间号
function JoinRoomWin:pasteRoomNumber()

    function CopyClipboardCallback(boardString)
        if string.match(boardString ,"疯狂阿拉房号") == "疯狂阿拉房号" then
            local p1 = string.find(boardString,"%[")
            local p2 = string.find(boardString,"%]")
            local code = string.sub(boardString, p1+1, p2-1)                
            Debug.log("code"..#code)
            for i=1, #code do
                local num = string.sub(code, i, i)
                Debug.log("拆分--"..num)
                InputNum(num)
            end
        else
            UIWinMgr:OpenPromptMaskWin("内容不是疯狂阿拉房间号")   
        end 
    end
    self.callback = CopyClipboardCallback
    PlatformTool.Instance:CopyClipboardString(self.callback)

end
