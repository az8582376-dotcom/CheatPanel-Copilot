// Main ZScript loader
#include "zscript/Config/CheatConfig.zs"
#include "zscript/Commands/CommandHandler.zs"
#include "zscript/Commands/Commands.zs"
#include "zscript/Menu/CheatMenuBase.zs"
#include "zscript/Menu/CheatMenuUI.zs"

class CheatPanelEventHandler : StaticEventHandler
{
    override void KeyDown(InputEvent e)
    {
        // Open menu on F1 key (code 282)
        if (e.KeyChar == 282)
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
