local DataManager = require("app.DataManager")
local MainUILayer = require("app.layers.MainUILayer")
local AchivementLayer = require("app.layers.AchivementLayer")
local LevelLayer = require("app.layers.LevelLayer")
local QuestLayer = require("app.layers.QuestLayer")
local GameLayer = require("src.app.layers.GameLayer")

local diggerData = require "app.diggerData"

local MainScene   = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()

   print("ctor()")    

	-- 数据初始化
	DataManager.init()

    -- 创建ui层
    self.uiLayer = MainUILayer.new()

    self:addChild(self.uiLayer)

    self.uiLayer:addEventListener("GAME_START",handler(self,self.gameStart))
    
    
    --创建game 层   
    self.uiLayer:addEventListener("GAME_END",handler(self,self.gameEnd))
    
    
end

-- 开始游戏
function MainScene:gameStart(event)
    self.gameLayer = GameLayer.new()
    self:addChild(self.gameLayer)
    self.uiLayer:setVisible(false)
end

-- 结束游戏
function MainScene:gameEnd(event)
      local _tmp_rounds = DataManager.get("_tmp_rounds")+1
      local result = {
        _tmp_save_animal = DataManager.get("_tmp_rounds")+event.saves,
        _tmp_use_item_1 = DataManager.get("_tmp_use_item_1")+event.use1,
        _tmp_use_item_2 = DataManager.get("_tmp_use_item_2")+event.use2,
        _tmp_use_item_3 = DataManager.get("_tmp_use_item_3")+event.use3,
        _tmp_atk_boss = DataManager.get("_tmp_atk_boss")+event.atkboss,
        _tmp_dizz_boss = DataManager.get("_tmp_dizz_boss")+event.dizzboss,
             }
             
     -- 扫描任务        
    for k, v in pairs(diggerData.quest) do
             	
    end

end



function MainScene:dealQuest(result)
	
end

function MainScene:onEnter()

end

function MainScene:onExit()

end

return MainScene
