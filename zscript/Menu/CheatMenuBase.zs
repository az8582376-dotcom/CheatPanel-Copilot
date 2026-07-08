// CheatMenuBase - Base menu class

class CheatPanelMenu : GenericMenu
{
    String currentCategory;
    int currentCommands[256];
    int currentCommandCount;
    int selectedIndex;
    
    override void Init(Menu parent)
    {
        Super.Init(parent);
        CommandHandler.Initialize();
        
        String cats[256];
        int catCount = CommandHandler.GetAllCategories(cats);
        
        if (catCount > 0)
        {
            currentCategory = cats[0];
            RefreshCommands();
        }
        
        selectedIndex = 0;
    }

    void RefreshCommands()
    {
        currentCommandCount = CommandHandler.GetCommandsByCategory(currentCategory, currentCommands);
    }

    override void OnReturn()
    {
        if (ParentMenu)
        {
            Menu.SetMenu(ParentMenu);
        }
        else
        {
            Menu.SetMenu(NULL);
        }
    }

    override bool OnUIEvent(UIEvent ev)
    {
        if (ev.Type == UIEvent.Type_KeyDown)
        {
            switch (ev.KeyChar)
            {
                case 1: // ESC
                    OnReturn();
                    return true;
                    
                case 200: // Up arrow
                    if (selectedIndex > 0) selectedIndex--;
                    return true;
                    
                case 208: // Down arrow
                    if (selectedIndex < currentCommandCount - 1) selectedIndex++;
                    return true;
                    
                case 28: // Enter
                    if (selectedIndex >= 0 && selectedIndex < currentCommandCount)
                    {
                        CommandHandler.ExecuteCommand(currentCommands[selectedIndex]);
                        Menu.SetMenu(NULL);
                    }
                    return true;
                    
                case 203: // Left arrow
                    SwitchToPreviousCategory();
                    return true;
                    
                case 205: // Right arrow
                    SwitchToNextCategory();
                    return true;
            }
        }
        
        return Super.OnUIEvent(ev);
    }

    void SwitchToPreviousCategory()
    {
        String cats[256];
        int catCount = CommandHandler.GetAllCategories(cats);
        
        for (int i = 0; i < catCount; i++)
        {
            if (cats[i] ~== currentCategory)
            {
                if (i > 0)
                {
                    currentCategory = cats[i - 1];
                }
                else
                {
                    currentCategory = cats[catCount - 1];
                }
                RefreshCommands();
                selectedIndex = 0;
                break;
            }
        }
    }

    void SwitchToNextCategory()
    {
        String cats[256];
        int catCount = CommandHandler.GetAllCategories(cats);
        
        for (int i = 0; i < catCount; i++)
        {
            if (cats[i] ~== currentCategory)
            {
                if (i < catCount - 1)
                {
                    currentCategory = cats[i + 1];
                }
                else
                {
                    currentCategory = cats[0];
                }
                RefreshCommands();
                selectedIndex = 0;
                break;
            }
        }
    }

    override void Drawer()
    {
        Super.Drawer();
        CheatMenuUI.DrawMenu(self);
    }
}
