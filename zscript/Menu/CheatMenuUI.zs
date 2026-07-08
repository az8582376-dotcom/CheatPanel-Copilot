// CheatMenuUI - UI rendering for cheat panel

class CheatMenuUI
{
    static void DrawMenu(CheatPanelMenu menu)
    {
        int SCREEN_WIDTH = 1280;
        int SCREEN_HEIGHT = 720;
        int PANEL_WIDTH = 500;
        int PANEL_HEIGHT = 600;
        int BUTTON_HEIGHT = 40;
        int BUTTON_WIDTH = 460;
        int MARGIN = 20;

        Screen.Dim(Color(0, 0, 0), 0.6, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);

        int panelX = (SCREEN_WIDTH - PANEL_WIDTH) / 2;
        int panelY = (SCREEN_HEIGHT - PANEL_HEIGHT) / 2;

        Screen.DrawThickFrame(panelX, panelY, PANEL_WIDTH, PANEL_HEIGHT, 3);
        Screen.Clear(panelX + 3, panelY + 3, PANEL_WIDTH - 6, PANEL_HEIGHT - 6, Color(30, 30, 30));

        String title = "CHEAT PANEL - Category: "..menu.currentCategory;
        Screen.DrawText(SmallFont, Font.CR_YELLOW, panelX + MARGIN, panelY + 10, title);

        int yPos = panelY + 50;
        for (int i = 0; i < menu.currentCommands.Size() && i < 12; i++)
        {
            int cmdIndex = menu.currentCommands[i];
            CheatCommand cmd = CommandHandler.GetCommand(cmdIndex);

            int buttonColor = Font.CR_WHITE;
            if (i == menu.selectedIndex)
            {
                buttonColor = Font.CR_BRIGHT;
                Screen.Clear(panelX + MARGIN, yPos, BUTTON_WIDTH, BUTTON_HEIGHT, Color(80, 80, 150));
            }

            Screen.DrawText(SmallFont, buttonColor, panelX + MARGIN + 10, yPos + 10, cmd.displayName);
            yPos += BUTTON_HEIGHT + 5;
        }

        int instrY = panelY + PANEL_HEIGHT - 60;
        Screen.DrawText(SmallFont, Font.CR_GOLD, panelX + MARGIN, instrY, "UP/DOWN - Navigate | ENTER - Execute");
        Screen.DrawText(SmallFont, Font.CR_GOLD, panelX + MARGIN, instrY + 20, "LEFT/RIGHT - Change Category | ESC - Close");
    }
}
