local score = 0
local deepth = 0


HubLayer = class("HubLayer",  function()
    return display.newLayer("HubLayer")
end)

local UP_BAR = {
    pause = {
        normal = "ui/stopup.png",
        pressed = "ui/stopdown.png",
        pos = {x=20,y=display.height-80},
    },
    score = {
        image = {
            "ui/score.png",
            pos = {x=90,y=display.height-78},
        },
        label = {
            text        = "0",
            font        = "Times New Roman",
            size        = 30,
            color       = display.COLOR_WHITE,
            x           = 150,
            y           = display.height-70,
        },
    },
    deepth = {
        image = {
            "ui/deepth.png",
            pos = {x=336,y=display.height-74},
        },
        label = {
            text        = "0",
            font        = "Times New Roman",
            size        = 30,
            color       = display.COLOR_WHITE,
            x           = 340,
            y           = display.height-70,
        },
    },
    money = {
        image = {
            "ui/money.png",
            pos = {x=490,y=display.height-74},
        },
        label = {
            text        = "0",
            font        = "Times New Roman",
            size        = 30,
            color       = display.COLOR_WHITE,
            textAlign   = cc.TEXT_ALIGNMENT_LEFT,
            textValign  = cc.VERTICAL_TEXT_ALIGNMENT_TOP,
            x           = 500,
            y           = display.height-70,
        },
    },
}

local BOTTOM_BAR = {
--    airRuler = {
--        image = "ui/AirRuler.png",
--        pos = {x=display.left+1,y=display.bottom+112},
--    },
    skill1 = {
        normal = "ui/jineng1.png",
        pressed = "ui/jineng2.png",
        pos = {x=140,y=5},
    },
    skill2 = {
        normal = "ui/jineng2.png",
        pressed = "ui/jineng3.png",
        pos = {x=240,y=5},
    },
    skill3 = {
        normal = "ui/jineng3.png",
        pressed = "ui/jineng1.png",
        pos = {x=340,y=5},
    },
    buy = {
        normal = "ui/plusup.png",
        pressed = "ui/plusdown.png",
        pos = {x=560,y=11},
    },
}
function HubLayer:ctor()
    self:createUpBar()
    self:createBottomBar()
    self:setTouchSwallowEnabled(false)
    
    local updateHubListener = cc.EventListenerCustom:create("update hub", handler(self,self.updateDate))
    self:getEventDispatcher():addEventListenerWithSceneGraphPriority(updateHubListener, self)
end

function HubLayer:createUpBar()
    cc.ui.UIPushButton.new({normal = UP_BAR.pause.normal,
                            pressed = UP_BAR.pause.pressed,
                            scale9 = true,})
        :align(display.LEFT_BOTTOM, UP_BAR.pause.pos.x, UP_BAR.pause.pos.y)
        :onButtonClicked(function(event)
            print("pause game")
            local pauseEvent = cc.EventCustom:new("pause game")
            cc.Director:getInstance():getEventDispatcher():dispatchEvent(pauseEvent)
        end)
        :addTo(self)


    cc.ui.UIImage.new(UP_BAR.score.image[1])
        :align(display.LEFT_BOTTOM, UP_BAR.score.image.pos.x, UP_BAR.score.image.pos.y)
        :addTo(self)
    self.scoreLabel = cc.ui.UILabel.new(UP_BAR.score.label)
        :align(display.LEFT_BOTTOM)
        :addTo(self)
        
        
    cc.ui.UIImage.new(UP_BAR.deepth.image[1])
        :align(display.LEFT_BOTTOM, UP_BAR.deepth.image.pos.x, UP_BAR.deepth.image.pos.y)
        :addTo(self)
    self.deepthLabel = cc.ui.UILabel.new(UP_BAR.deepth.label)
        :align(display.LEFT_BOTTOM)
        :addTo(self)
        
        
    cc.ui.UIImage.new(UP_BAR.money.image[1])
        :align(display.LEFT_BOTTOM, UP_BAR.money.image.pos.x, UP_BAR.money.image.pos.y)
        :addTo(self)
    self.moneyLabel = cc.ui.UILabel.new(UP_BAR.money.label)
        :align(display.LEFT_BOTTOM)
        :addTo(self)
end

function HubLayer:createBottomBar()

    cc.ui.UIImage.new("ui/bar.png")
        :align(display.BOTTOM_CENTER, display.cx, display.bottom)
        :addTo(self)
        
    cc.ui.UIPushButton.new({normal = BOTTOM_BAR.skill1.normal,
                            pressed = BOTTOM_BAR.skill1.pressed,
                            scale9 = true,})
        :onButtonClicked(function(event)
        end)
        :align(display.LEFT_BOTTOM, BOTTOM_BAR.skill1.pos.x, BOTTOM_BAR.skill1.pos.y)
        :addTo(self)
        
    cc.ui.UIPushButton.new({normal = BOTTOM_BAR.skill2.normal,
                            pressed = BOTTOM_BAR.skill2.pressed,
                            scale9 = true,})
        :align(display.LEFT_BOTTOM, BOTTOM_BAR.skill2.pos.x, BOTTOM_BAR.skill2.pos.y)
        :addTo(self)

    cc.ui.UIPushButton.new({normal = BOTTOM_BAR.skill3.normal,
                            pressed = BOTTOM_BAR.skill3.pressed,
                            scale9 = true,})
        :align(display.LEFT_BOTTOM, BOTTOM_BAR.skill3.pos.x, BOTTOM_BAR.skill3.pos.y)
        :addTo(self)
        
    cc.ui.UIPushButton.new({normal = BOTTOM_BAR.buy.normal,
                            pressed = BOTTOM_BAR.buy.pressed,
                            scale9 = true,})
        :onButtonClicked(function(event)
                print('buy')
            end)
        :align(display.LEFT_BOTTOM, BOTTOM_BAR.buy.pos.x, BOTTOM_BAR.buy.pos.y)
        :addTo(self)
end

function HubLayer:updateDate(event)
    if event.type == 'score' then
        score = score + event.data
        self.scoreLabel:setString(string.format("%d/%d", score, GameData.highestScore))
    elseif event.type == 'deepth' then
        deepth = deepth + event.data
        self.deepthLabel:setString(string.format("%d", deepth))
    else
    
    end

end