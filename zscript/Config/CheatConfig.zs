// CheatConfig - Command Configuration
// Add your custom commands here easily!

class CheatConfig
{
    // Define all commands with their categories
    static void InitializeCommands()
    {
        // BASIC COMMANDS
        CommandHandler.AddCommand("god", "God Mode", "BASIC", "god");
        CommandHandler.AddCommand("noclip", "No Clip", "BASIC", "noclip");
        CommandHandler.AddCommand("notarget", "No Target", "BASIC", "notarget");
        CommandHandler.AddCommand("give all", "Give All Items", "BASIC", "give all");
        CommandHandler.AddCommand("give ammo", "Give Ammo", "BASIC", "give ammo");
        CommandHandler.AddCommand("give health 100", "Full Health", "BASIC", "give health 100");
        CommandHandler.AddCommand("give armor", "Give Armor", "BASIC", "give armor");
        CommandHandler.AddCommand("give keys", "Give All Keys", "BASIC", "give keys");
        
        // WEAPONS
        CommandHandler.AddCommand("give shotgun", "Shotgun", "WEAPONS", "give shotgun");
        CommandHandler.AddCommand("give chainsawer", "Chainsaw", "WEAPONS", "give chainsawer");
        CommandHandler.AddCommand("give rocketlauncher", "Rocket Launcher", "WEAPONS", "give rocketlauncher");
        CommandHandler.AddCommand("give plasmarifle", "Plasma Rifle", "WEAPONS", "give plasmarifle");
        CommandHandler.AddCommand("give bfg9000", "BFG9000", "WEAPONS", "give bfg9000");
        
        // MONSTERS
        CommandHandler.AddCommand("summon Cyberdemon", "Summon Cyberdemon", "MONSTERS", "summon Cyberdemon");
        CommandHandler.AddCommand("summon SpiderMastermind", "Summon Spider Mastermind", "MONSTERS", "summon SpiderMastermind");
        CommandHandler.AddCommand("summon BaronOfHell", "Summon Baron of Hell", "MONSTERS", "summon BaronOfHell");
        CommandHandler.AddCommand("summon Revenant", "Summon Revenant", "MONSTERS", "summon Revenant");
        CommandHandler.AddCommand("summon Cacodemon", "Summon Cacodemon", "MONSTERS", "summon Cacodemon");
        CommandHandler.AddCommand("summon Imp", "Summon Imp", "MONSTERS", "summon Imp");
        CommandHandler.AddCommand("summon Demon", "Summon Demon", "MONSTERS", "summon Demon");
        
        // CHEATS
        CommandHandler.AddCommand("idbehold", "Powerups Menu", "CHEATS", "idbehold");
        CommandHandler.AddCommand("iddqd", "Instant Death", "CHEATS", "iddqd");
        CommandHandler.AddCommand("idkfa", "Kill All Monsters", "CHEATS", "idkfa");
    }
}
