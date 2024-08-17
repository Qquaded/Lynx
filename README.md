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
