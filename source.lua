-- Variables
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Modules
local Spring = require(script.Spring)
local Ripple = require(script.Ripple)
local Tooltip = require(script.Tooltip)
local Draggable = require(script.Draggable)
local Glass = require(script.GlassmorphicUI)

--> Main Module
local Lynx = {}

--> Custom Types
local CustomTypes = {
	TextButton = {
		new = function()
			local data = {}
			
			data.instance = Instance.new("TextButton")
			data.instance.AutoButtonColor = false
			data.instance.Text = "Text"
			data.instance.Size = UDim2.new(0, 100, 0, 50)
			data.instance.BorderSizePixel = 0
			data.instance.BackgroundColor3 = Color3.new(0, 0, 0)
			data.instance.TextColor3 = Color3.new(1, 1, 1)
			data.instance.BackgroundTransparency = 0.4
			data.instance.Font = Enum.Font.BuilderSans
			data.instance.TextSize = 32
			
			data.instance.MouseEnter:Connect(function()
				Spring.target(data.instance, 2, 5, {
					BackgroundTransparency = 0.3
				})
			end)
			
			data.instance.MouseButton1Down:Connect(function()
				if RunService:IsClient() then
					Ripple(data.instance, Players.LocalPlayer:GetMouse(), Color3.new(1, 1, 1))
				end
			end)
			
			data.instance.MouseLeave:Connect(function()
				Spring.target(data.instance, 2, 5, {
					BackgroundTransparency = 0.4
				})
			end)
			
			Instance.new("UICorner").Parent = data.instance
			
			return data
		end,
	},
	
	ServerTab = {
		new = function()
			local data = {}
			
			local ServerTab = Instance.new("CanvasGroup")
			ServerTab.Name = "ServerTab"
			ServerTab.AnchorPoint = Vector2.new(0.5, 0.5)
			ServerTab.Size = UDim2.new(0, 369, 0, 100)
			ServerTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ServerTab.BackgroundTransparency = 0.2
			ServerTab.Position = UDim2.new(0.5, 0, 0.5, 0)
			ServerTab.BorderSizePixel = 0
			ServerTab.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			
			data.instance = ServerTab

			local UICorner = Instance.new("UICorner")
			UICorner.Parent = ServerTab

			local Image = Instance.new("ImageLabel")
			Image.Name = "Image"
			Image.Size = UDim2.new(0, 80, 0, 80)
			Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Image.Position = UDim2.new(0.0189702, 0, 0.1, 0)
			Image.BorderSizePixel = 0
			Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Image.Image = "rbxassetid://18751997340"
			Image.Parent = ServerTab

			local UICorner1 = Instance.new("UICorner")
			UICorner1.Parent = Image

			local Title = Instance.new("TextLabel")
			Title.Name = "Title"
			Title.Size = UDim2.new(0, 271, 0, 24)
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BackgroundTransparency = 1
			Title.Position = UDim2.new(0.2655827, 0, 0.1, 0)
			Title.BorderSizePixel = 0
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.FontSize = Enum.FontSize.Size14
			Title.TextSize = 14
			Title.TextColor3 = Color3.fromRGB(217, 217, 217)
			Title.Text = "Server"
			Title.Font = Enum.Font.BuilderSansBold
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.Parent = ServerTab

			local Description = Instance.new("TextLabel")
			Description.Name = "Description"
			Description.Size = UDim2.new(0, 255, 0, 49)
			Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Description.BackgroundTransparency = 1
			Description.Position = UDim2.new(0.2655827, 0, 0.34, 0)
			Description.BorderSizePixel = 0
			Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Description.FontSize = Enum.FontSize.Size14
			Description.TextSize = 14
			Description.TextColor3 = Color3.fromRGB(139, 139, 139)
			Description.TextYAlignment = Enum.TextYAlignment.Top
			Description.Text = "Description"
			Description.TextWrapped = true
			Description.TextWrap = true
			Description.Font = Enum.Font.BuilderSans
			Description.TextXAlignment = Enum.TextXAlignment.Left
			Description.Parent = ServerTab

			local Buttons = Instance.new("Frame")
			Buttons.Name = "Buttons"
			Buttons.Size = UDim2.new(0.9810298, 0, 0.9, 0)
			Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Buttons.BackgroundTransparency = 1
			Buttons.BorderSizePixel = 0
			Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Buttons.Parent = ServerTab

			local UIListLayout = Instance.new("UIListLayout")
			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)
			UIListLayout.Parent = Buttons
			
			function data:AddButton(name, image, callback: () -> ())
				local button = Lynx.new("ImageButton")
				button.Size = UDim2.new(0, 30, 0, 30)
				button.CustomTypeProperties.Image = image
				button.CustomTypeProperties.ImageColor = Color3.new(0, 0, 0)
				button.MouseButton1Click = function()
					callback()
				end
				button.Name = name
				button.BackgroundColor3 = Color3.new(1, 1, 1)
				button.Parent = Buttons
				button:Apply()
				
				return button
			end
			
			return data
		end,
	},
	
	Frame = {
		new = function()
			local data = {}
			
			data.instance = Instance.new("Frame")
			data.instance.Size = UDim2.new(0, 100, 0, 100)
			data.instance.BorderSizePixel = 0
			data.instance.BackgroundColor3 = Color3.new(0, 0, 0)
			data.instance.BackgroundTransparency = 0.4
			
			Instance.new("UICorner").Parent = data.instance

			return data
		end,
	},
	
	ImageButton = {
		new = function()
			local data = {
				Image = "rbxassetid://11419705225",
				ImageColor = Color3.new(1, 1, 1),
			}
			
			data.instance = Instance.new("TextButton")
			data.instance.AutoButtonColor = false
			data.instance.Size = UDim2.new(0, 50, 0, 50)
			data.instance.BorderSizePixel = 0
			data.instance.BackgroundColor3 = Color3.new(0, 0, 0)
			data.instance.TextColor3 = Color3.new(1, 1, 1)
			data.instance.BackgroundTransparency = 0.4
			data.instance.TextTransparency = 1
			data.instance.TextSize = 32
			
			data.instance.MouseEnter:Connect(function()
				Spring.target(data.instance, 2, 5, {
					BackgroundTransparency = 0.3
				})
			end)

			data.instance.MouseButton1Down:Connect(function()
				if RunService:IsClient() then
					Ripple(data.instance, Players.LocalPlayer:GetMouse(), Color3.new(1, 1, 1))
				end
			end)

			data.instance.MouseLeave:Connect(function()
				Spring.target(data.instance, 2, 5, {
					BackgroundTransparency = 0.4
				})
			end)
			
			Instance.new("UICorner").Parent = data.instance
			
			local image = Instance.new("ImageLabel")
			image.BackgroundTransparency = 1
			image.Position = UDim2.new(0.5, 0, 0.5, 0)
			image.AnchorPoint = Vector2.new(0.5, 0.5)
			image.Parent = data.instance
			
			if RunService:IsClient() then
				RunService.RenderStepped:Connect(function()
					image.Image = data.Image
					image.ImageColor3 = data.ImageColor
					image.Size = UDim2.new(0, data.instance.Size.X.Offset - 20, 0, data.instance.Size.Y.Offset - 20)
				end)
			end
			
			return data
		end,
	},
	
	CanvasGroup = {
		new = function()
			local data = {}

			data.instance = Instance.new("CanvasGroup")
			data.instance.BackgroundTransparency = 1
			data.instance.Size = UDim2.new(1, 0, 1, 0)
			data.instance.AnchorPoint = Vector2.new(0.5, 0.5)
			data.instance.GroupTransparency = 1
			data.instance.Visible = true
			data.instance:SetAttribute("Test", "test")			

			return data
		end,
	},
	
	Title = {
		new = function()
			local data = {}
			
			data.instance = Instance.new("TextLabel")
			data.instance.BackgroundTransparency = 1
			data.instance.TextColor3 = Color3.new(1, 1, 1)
			data.instance.Font = Enum.Font.BuilderSansBold
			data.instance.TextSize = 55
			data.instance.Text = "Title"
			
			return data
		end,
	},
	
	Textlabel = {
		new = function()
			local data = {}

			data.instance = Instance.new("TextLabel")
			data.instance.BackgroundTransparency = 1
			data.instance.TextColor3 = Color3.new(1, 1, 1)
			data.instance.Font = Enum.Font.BuilderSans
			data.instance.TextSize = 55

			return data
		end,
	},
	
	Code = {
		new = function()
			local data = {}

			data.instance = Instance.new("TextLabel")
			data.instance.BackgroundTransparency = 1
			data.instance.TextColor3 = Color3.new(1, 1, 1)
			data.instance.Font = Enum.Font.RobotoMono
			data.instance.TextSize = 55
			data.instance.Size = UDim2.new(0, 100, 0, 100)
			data.instance.TextWrapped = true

			return data
		end,
	},
}

--> Helper Functions
local function IsACustomType(Type: string)
	return CustomTypes[Type] ~= nil
end

local function Apply(instance, data)
	for property, value in pairs(data) do
		if type(value) == "function" then
			local success, result = pcall(function()
				instance[property]:Connect(function(...)
					value(...)
				end)
			end)

			if not success then
				print(string.format("Failed to apply event %s to %s: %s", property, instance:GetFullName(), result))
			end
		else
			local success, result = pcall(function()
				instance[property] = value
			end)
			if not success then
				print(string.format("Failed to apply property %s to %s: %s", property, instance:GetFullName(), result))
			end
		end
	end
end

local function ApplyConfig(instance, config)
	if config["Children"] then
		for i, childdata in pairs(config["Children"]) do
			local newtype = childdata[1]
			local childproperties = childdata[2]

			local created = Lynx.new(newtype)

			if created.instance then
				Apply(created.instance, childproperties)
				created.instance.Parent = instance
			elseif created.CustomTypeProperties then
				Apply(created.CustomTypeProperties.instance, childproperties)
				created.CustomTypeProperties.instance.Parent = instance
			else
				print(string.format("Failed to create instance %s", newtype))
			end
		end
	end

	for property, value in pairs(config) do
		if property ~= "Children" then
			if type(value) == "function" then
				local success, result = pcall(function()
					instance[property]:Connect(function(...)
						value(...)
					end)
				end)

				if not success then
					print(string.format("Failed to apply event %s to %s: %s", property, instance:GetFullName(), result))
				end
			else
				local success, result = pcall(function()
					instance[property] = value
				end)
				if not success then
					print(string.format("Failed to apply property %s to %s: %s", property, instance:GetFullName(), result))
				end
			end
		end
	end
end

--> Methods
function Lynx:Draggable(guiobject: GuiObject, speed)
	Draggable(guiobject, speed)
end

function Lynx:Glass(guiobject: GuiObject)
	return Glass.addGlassBackground(guiobject)
end

function Lynx:Ripple(guiobject: GuiObject, color: Color3)
	Ripple(guiobject, Players.LocalPlayer:GetMouse(), color)
end

function Lynx.Spring(guiobject: GuiObject, damping, frequency, goals)
	Spring.target(guiobject, damping, frequency, goals)
end

function Lynx.new(Type: string, config: table?)
	if IsACustomType(Type) then
		local data = {
			CustomTypeProperties = CustomTypes[Type].new()
		}
		
		data.instance = data.CustomTypeProperties.instance

		if config then ApplyConfig(data.CustomTypeProperties.instance, config) end
		
		if data.CustomTypeProperties.instance:IsA("GuiObject") then
			data.CustomTypeProperties.instance.Position = UDim2.new(0.5, 0, 0.5, 0)
			data.CustomTypeProperties.instance.AnchorPoint = Vector2.new(0.5, 0.5)
		end

		function data:Apply()
			Apply(data.CustomTypeProperties.instance, data)
		end

		return data
	else
		local data = {
			instance = Instance.new(Type)
		}

		if config then ApplyConfig(data.instance, config) end
		
		if data.instance:IsA("GuiObject") then
			data.instance.Position = UDim2.new(0.5, 0, 0.5, 0)
			data.instance.AnchorPoint = Vector2.new(0.5, 0.5)
		end

		function data:Apply()
			Apply(data.instance, data)
		end

		return data
	end
end

return Lynx
