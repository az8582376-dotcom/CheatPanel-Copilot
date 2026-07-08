// CommandHandler - Manages all cheat commands

struct CheatCommand
{
    String id;
    String displayName;
    String category;
    String command;
}

class CommandHandler
{
    static Array<CheatCommand> commands;
    static bool initialized;

    static void AddCommand(String id, String displayName, String category, String command)
    {
        CheatCommand cmd;
        cmd.id = id;
        cmd.displayName = displayName;
        cmd.category = category;
        cmd.command = command;
        
        commands.Push(cmd);
    }

    static void ExecuteCommand(int index)
    {
        if (index >= 0 && index < commands.Size())
        {
            String cmd = commands[index].command;
            Console.MidPrint("Verdana", "Executing: "..cmd, false);
            C_DoCommand(cmd);
        }
    }

    static Array<int> GetCommandsByCategory(String category)
    {
        Array<int> result;
        
        for (int i = 0; i < commands.Size(); i++)
        {
            if (commands[i].category ~== category)
            {
                result.Push(i);
            }
        }
        
        return result;
    }

    static Array<String> GetAllCategories()
    {
        Array<String> categories;
        
        for (int i = 0; i < commands.Size(); i++)
        {
            String cat = commands[i].category;
            bool found = false;
            
            for (int j = 0; j < categories.Size(); j++)
            {
                if (categories[j] ~== cat)
                {
                    found = true;
                    break;
                }
            }
            
            if (!found)
            {
                categories.Push(cat);
            }
        }
        
        return categories;
    }

    static void Initialize()
    {
        if (!initialized)
        {
            CheatConfig.InitializeCommands();
            initialized = true;
        }
    }

    static CheatCommand GetCommand(int index)
    {
        if (index >= 0 && index < commands.Size())
        {
            return commands[index];
        }
        
        CheatCommand empty;
        return empty;
    }

    static int GetCommandCount()
    {
        return commands.Size();
    }
}
