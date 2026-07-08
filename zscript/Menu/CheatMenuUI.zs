// CheatMenuUI - UI rendering for cheat panel

class CheatMenuUI
{
    const int SCREEN_WIDTH = 1280;
    const int SCREEN_HEIGHT = 720;
    const int PANEL_WIDTH = 500;
    const int PANEL_HEIGHT = 600;
    const int BUTTON_HEIGHT = 40;
    const int BUTTON_WIDTH = 460;
    const int MARGIN = 20;

    static void DrawMenu(CheatPanelMenu menu)
    {
        // Semi-transparent background
        Screen.Dim(Color(0, 0, 0), 0.6, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);

        // Draw main panel
        int panelX = (SCREEN_WIDTH - PANEL_WIDTH) / 2;
        int panelY = (SCREEN_HEIGHT - PANEL_HEIGHT) / 2;

        // Panel background
        Screen.DrawThickFrame(panelX, panelY, PANEL_WIDTH, PANEL_HEIGHT, 3);
        Screen.Clear(panelX + 3, panelY + 3, PANEL_WIDTH - 6, PANEL_HEIGHT - 6, Color(30, 30, 30));

        // Draw title
        String title = "CHEAT PANEL - Category: " .. menu.currentCategory;
        Screen.DrawText(SmallFont, Font.CR_YELLOW, panelX + MARGIN, panelY + 10, title);

        // Draw commands
        int yPos = panelY + 50;
        for (int i = 0; i < menu.currentCommands.Size() && i < 12; i++)
        {
            int cmdIndex = menu.currentCommands[i];
            CheatCommand cmd = CommandHandler.GetCommand(cmdIndex);

            // Highlight selected button
            int buttonColor = Font.CR_WHITE;
            if (i == menu.selectedIndex)
            {
                buttonColor = Font.CR_BRIGHT;
                Screen.Clear(panelX + MARGIN, yPos, BUTTON_WIDTH, BUTTON_HEIGHT, Color(80, 80, 150));
            }

            Screen.DrawText(SmallFont, buttonColor, panelX + MARGIN + 10, yPos + 10, cmd.displayName);
            yPos += BUTTON_HEIGHT + 5;
        }

        // Draw instructions
        int instrY = panelY + PANEL_HEIGHT - 60;
        Screen.DrawText(SmallFont, Font.CR_GOLD, panelX + MARGIN, instrY, "UP/DOWN - Navigate | ENTER - Execute");
        Screen.DrawText(SmallFont, Font.CR_GOLD, panelX + MARGIN, instrY + 20, "LEFT/RIGHT - Change Category | ESC - Close");
    }
}
