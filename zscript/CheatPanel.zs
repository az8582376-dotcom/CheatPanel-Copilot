// CheatPanel - Main Entry Point
// GZDoom 4.14.2 Compatible

#include "zscript/Config/CheatConfig.zs"
#include "zscript/Commands/CommandHandler.zs"
#include "zscript/Commands/Commands.zs"
#include "zscript/Menu/CheatMenuBase.zs"
#include "zscript/Menu/CheatMenuUI.zs"

class CheatPanelEventHandler : StaticEventHandler
{
    override void KeyDown(InputEvent e)
    {
        // Open menu on F1 key (can be changed)
        if (e.KeyChar == 282) // F1 key code for GZDoom
        {
            Menu.SetMenu("CheatPanelMenu");
        }
    }
}

class CheatPanelInit : Actor
{
    Default
    {
        +NOINTERACTION
    }

    override void BeginPlay()
    {
        EventHandler.Register(new("CheatPanelEventHandler"));
    }
}
