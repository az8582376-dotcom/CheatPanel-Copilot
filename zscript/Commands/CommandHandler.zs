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
    static CheatCommand commands[256];
    static int commandCount;

    static void AddCommand(String id, String displayName, String category, String command)
    {
        if (commandCount >= 256) return;
        
        commands[commandCount].id = id;
        commands[commandCount].displayName = displayName;
        commands[commandCount].category = category;
        commands[commandCount].command = command;
        commandCount++;
    }

    static void ExecuteCommand(int index)
    {
        if (index >= 0 && index < commandCount)
        {
            String cmd = commands[index].command;
            Console.MidPrint(SmallFont, "Executing: "..cmd, false);
            C_DoCommand(cmd);
        }
    }

    static int GetCommandsByCategory(String category, int result[256])
    {
        int count = 0;
        
        for (int i = 0; i < commandCount; i++)
        {
            if (commands[i].category ~== category)
            {
                result[count] = i;
                count++;
                if (count >= 256) break;
            }
        }
        
        return count;
    }

    static int GetAllCategories(String categories[256])
    {
        int count = 0;
        
        for (int i = 0; i < commandCount; i++)
        {
            String cat = commands[i].category;
            bool found = false;
            
            for (int j = 0; j < count; j++)
            {
                if (categories[j] ~== cat)
                {
                    found = true;
                    break;
                }
            }
            
            if (!found && count < 256)
            {
                categories[count] = cat;
                count++;
            }
        }
        
        return count;
    }

    static CheatCommand GetCommand(int index)
    {
        CheatCommand empty;
        
        if (index >= 0 && index < commandCount)
        {
            return commands[index];
        }
        
        return empty;
    }

    static int GetCommandCount()
    {
        return commandCount;
    }
}
