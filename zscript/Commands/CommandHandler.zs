// CommandHandler - Manages all cheat commands

struct CheatCommand
{
    String id;           // Command ID
    String displayName;  // Display name in menu
    String category;     // Category (BASIC, WEAPONS, MONSTERS, etc)
    String command;      // Command to execute
}

class CommandHandler
{
    static Array<CheatCommand> commands;
    static bool initialized = false;

    // Add a new command
    static void AddCommand(String id, String displayName, String category, String command)
    {
        CheatCommand cmd;
        cmd.id = id;
        cmd.displayName = displayName;
        cmd.category = category;
        cmd.command = command;
        
        commands.Push(cmd);
    }

    // Execute command
    static void ExecuteCommand(int index)
    {
        if (index >= 0 && index < commands.Size())
        {
            String cmd = commands[index].command;
            Console.MidPrint("Verdana", "Executing: " .. cmd, false);
            C_DoCommand(cmd);
        }
    }

    // Get all commands for a category
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

    // Get all unique categories
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

    // Initialize commands
    static void Initialize()
    {
        if (!initialized)
        {
            CheatConfig.InitializeCommands();
            initialized = true;
        }
    }

    // Get command by index
    static CheatCommand GetCommand(int index)
    {
        if (index >= 0 && index < commands.Size())
        {
            return commands[index];
        }
        
        CheatCommand empty;
        return empty;
    }

    // Get total commands count
    static int GetCommandCount()
    {
        return commands.Size();
    }
}
