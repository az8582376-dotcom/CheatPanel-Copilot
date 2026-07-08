// Commands - Additional command utilities

class Commands
{
    // Execute raw console command
    static void Execute(String cmd)
    {
        C_DoCommand(cmd);
    }

    // Print message to console
    static void PrintMessage(String msg)
    {
        Console.MidPrint("Verdana", msg, false);
    }

    // Get command display info
    static String GetCommandInfo(int index)
    {
        CheatCommand cmd = CommandHandler.GetCommand(index);
        return cmd.displayName;
    }
}
