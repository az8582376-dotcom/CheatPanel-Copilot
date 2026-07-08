// CheatMenuBase - Base menu class

class CheatPanelMenu : GenericMenu
{
    String currentCategory;
    Array<int> currentCommands;
    int selectedIndex;
    int scrollOffset;
    
    override void Init(Menu parent)
    {
        Super.Init(parent);
        CommandHandler.Initialize();
        
        Array<String> cats = CommandHandler.GetAllCategories();
        if (cats.Size() > 0)
        {
            currentCategory = cats[0];
            RefreshCommands();
        }
        
        selectedIndex = 0;
        scrollOffset = 0;
    }

    void RefreshCommands()
    {
        currentCommands = CommandHandler.GetCommandsByCategory(currentCategory);
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
                case 1:
                    OnReturn();
                    return true;
                    
                case 200:
                    if (selectedIndex > 0) selectedIndex--;
                    return true;
                    
                case 208:
                    if (selectedIndex < currentCommands.Size() - 1) selectedIndex++;
                    return true;
                    
                case 28:
                    if (selectedIndex >= 0 && selectedIndex < currentCommands.Size())
                    {
                        CommandHandler.ExecuteCommand(currentCommands[selectedIndex]);
                        Menu.SetMenu(NULL);
                    }
                    return true;
                    
                case 203:
                    SwitchToPreviousCategory();
                    return true;
                    
                case 205:
                    SwitchToNextCategory();
                    return true;
            }
        }
        
        return Super.OnUIEvent(ev);
    }

    void SwitchToPreviousCategory()
    {
        Array<String> cats = CommandHandler.GetAllCategories();
        for (int i = 0; i < cats.Size(); i++)
        {
            if (cats[i] ~== currentCategory)
            {
                if (i > 0)
                {
                    currentCategory = cats[i - 1];
                }
                else
                {
                    currentCategory = cats[cats.Size() - 1];
                }
                RefreshCommands();
                selectedIndex = 0;
                break;
            }
        }
    }

    void SwitchToNextCategory()
    {
        Array<String> cats = CommandHandler.GetAllCategories();
        for (int i = 0; i < cats.Size(); i++)
        {
            if (cats[i] ~== currentCategory)
            {
                if (i < cats.Size() - 1)
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
