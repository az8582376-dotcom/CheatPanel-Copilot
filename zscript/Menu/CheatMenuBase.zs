// CheatMenuBase - Base menu class

class CheatPanelMenu : GenericMenu
{
    String currentCategory;
    Array<int> currentCommands;
    int selectedIndex;
    int scrollOffset;
    
    const int BUTTONS_PER_PAGE = 10;
    const int BUTTON_HEIGHT = 30;
    const int BUTTON_WIDTH = 400;
    
    override void Init(Menu parent)
    {
        Super.Init(parent);
        CommandHandler.Initialize();
        
        // Start with first category
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
                case UIEvent.Key_Escape:
                    OnReturn();
                    return true;
                    
                case UIEvent.Key_Up:
                    if (selectedIndex > 0) selectedIndex--;
                    return true;
                    
                case UIEvent.Key_Down:
                    if (selectedIndex < currentCommands.Size() - 1) selectedIndex++;
                    return true;
                    
                case UIEvent.Key_Enter:
                    if (selectedIndex >= 0 && selectedIndex < currentCommands.Size())
                    {
                        CommandHandler.ExecuteCommand(currentCommands[selectedIndex]);
                        Menu.SetMenu(NULL);
                    }
                    return true;
                    
                case UIEvent.Key_Left:
                    SwitchToPreviousCategory();
                    return true;
                    
                case UIEvent.Key_Right:
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
