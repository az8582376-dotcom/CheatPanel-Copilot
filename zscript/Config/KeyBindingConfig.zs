// KeyBindingConfig - Customizable key bindings

class KeyBindingConfig
{
    // Default key bindings
    static int OPEN_MENU_KEY = 282;           // F1
    static int NAVIGATE_UP_KEY = 200;         // Up Arrow
    static int NAVIGATE_DOWN_KEY = 208;       // Down Arrow
    static int SWITCH_LEFT_KEY = 203;         // Left Arrow
    static int SWITCH_RIGHT_KEY = 205;        // Right Arrow
    static int EXECUTE_KEY = 28;              // Enter
    static int CLOSE_MENU_KEY = 1;            // ESC

    // Menu settings
    static bool ENABLE_SOUND = true;          // Enable menu sounds
    static float MENU_TRANSPARENCY = 0.6;     // Background transparency (0.0 - 1.0)
    static bool SHOW_CATEGORY_NAME = true;    // Show current category name
    static bool SHOW_COMMAND_COUNT = true;    // Show command count

    // Action cooldown (in tics, 35 tics = 1 second)
    static int EXECUTE_COOLDOWN = 5;          // Cooldown after executing command

    // Display settings
    static int BUTTON_HEIGHT = 40;
    static int BUTTON_WIDTH = 460;
    static int PANEL_WIDTH = 500;
    static int PANEL_HEIGHT = 600;
    static int COMMANDS_PER_PAGE = 12;

    // Font settings
    static Font TITLE_FONT = SmallFont;
    static int TITLE_COLOR = Font.CR_YELLOW;
    static int NORMAL_COLOR = Font.CR_WHITE;
    static int SELECTED_COLOR = Font.CR_BRIGHT;
    static int INSTRUCTION_COLOR = Font.CR_GOLD;

    // Load custom bindings (can be extended for config file support)
    static void LoadBindings()
    {
        // You can override defaults here
        // Example: OPEN_MENU_KEY = 283; // F2 instead of F1
    }

    // Check if a key binding is triggered
    static bool IsKeyPressed(InputEvent e, int bindingKey)
    {
        return e.KeyChar == bindingKey;
    }

    // Get key name for display
    static String GetKeyName(int keyCode)
    {
        switch (keyCode)
        {
            case 1:   return "ESC";
            case 2:   return "1";
            case 3:   return "2";
            case 4:   return "3";
            case 5:   return "4";
            case 6:   return "5";
            case 7:   return "6";
            case 8:   return "7";
            case 9:   return "8";
            case 10:  return "9";
            case 11:  return "0";
            case 14:  return "BACKSPACE";
            case 15:  return "TAB";
            case 28:  return "ENTER";
            case 29:  return "CTRL";
            case 42:  return "SHIFT";
            case 56:  return "ALT";
            case 57:  return "SPACE";
            case 59:  return "F1";
            case 60:  return "F2";
            case 61:  return "F3";
            case 62:  return "F4";
            case 63:  return "F5";
            case 64:  return "F6";
            case 65:  return "F7";
            case 66:  return "F8";
            case 67:  return "F9";
            case 68:  return "F10";
            case 87:  return "F11";
            case 88:  return "F12";
            case 200: return "UP";
            case 208: return "DOWN";
            case 203: return "LEFT";
            case 205: return "RIGHT";
            case 209: return "PAGE DOWN";
            case 201: return "PAGE UP";
            case 210: return "DELETE";
            case 211: return "HOME";
            case 207: return "END";
            default:  return String.Format("KEY_%d", keyCode);
        }
    }
}
