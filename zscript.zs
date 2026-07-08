// Main ZScript loader
#include "zscript/Config/CheatConfig.zs"
#include "zscript/Commands/CommandHandler.zs"
#include "zscript/Menu/CheatMenuBase.zs"
#include "zscript/Menu/CheatMenuUI.zs"

class CheatPanelEventHandler : EventHandler
{
    override void KeyDown(int keyCode, bool isRepeat)
    {
        if (keyCode == 282) // F1
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
