# Lynx

**Lynx** is a powerful and easy-to-use GUI library for Roblox, designed to simplify the creation and management of GUI elements.

## Documentation

### Creating a New Instance

To create a new GUI element using Lynx, use the `Lynx.new` function. This initializes a new instance of the specified GUI object.

### Applying Properties

After creating the instance, you can set its properties. Once all properties are set, use the `:Apply` method to apply them.

### Example

Here's a basic example of creating and applying a `Frame` object using Lynx:

```lua
local Example = Lynx.new("Frame")  -- Create a new Frame instance

Example.Size = UDim2.new(1, 0, 1, 0)  -- Set the size to fill the parent

Example.Parent = ExampleParent.instance  -- Set the parent of the frame

Example:Apply()  -- Apply the properties to the frame
```

To get its `custom types`, you can get it through `Lynx.CustomTypes`.

## Using themes
Themes are a central part of the Lynx gui library, you can make white mode or dark mode, or rainbow!
You can get the themes using `Lynx.Themes`

## Applying a theme

To use a theme, write down `.Use`: Args --> theme: {}.

```lua
Lynx.Themes.Use(Lynx.Themes.ExampleTheme)
```

## Creating a theme
A theme should have specific properties to be a theme, Here are those properties:
```lua
	BackgroundColor
	BackgroundTransparency
	HoverBackgroundTransparency
	HoverBackgroundColor
	TextColor3
	HoverTextColor3
	Font
```

If you finished your theme, put it in the Lynx themes using `Lynx.Themes.ExampleTheme = ThemeProperties`.
