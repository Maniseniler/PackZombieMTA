# Hud Mod for MTA:SA 🖥️📊

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Hud** mod is a client-side resource for your Multi Theft Auto: San Andreas server, designed to **customize and enhance the player's heads-up display (HUD)**. This mod allows for the modification, addition, or removal of various on-screen elements that provide players with crucial information during gameplay.

In a dynamic environment like your zombie apocalypse server, a well-designed HUD is vital for player awareness. The **Hud** mod can display essential data such as health, armor, money, ammo, player count, server time, custom notifications, and more, all tailored to fit the aesthetic and informational needs of your server, ensuring players always have the information they need at a glance.

---

## **Features**

* **Customizable On-Screen Elements:** Modify the appearance, position, and information displayed on the player's HUD.
* **Essential Information Display:** Show vital player stats (health, armor, money, ammo) and server information (player count, time).
* **Enhanced Visuals:** Improve the overall look and feel of the game's interface with custom designs.
* **Dynamic Updates:** HUD elements update in real-time to reflect changes in player status or server state.
* **Clean & Intuitive Design:** Aims to present information clearly without cluttering the screen.
* **Notifications (Optional):** May integrate custom notification pop-ups for events or achievements.

---

## **Technologies Used**

The **Hud** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Client-Side GUI Elements:** Utilizes MTA's built-in functions for creating and manipulating GUI elements.

---

## **Installation Guide**

To install the **Hud** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Hud** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Hud** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Hud** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Hud** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Hud" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Hud`**.

5.  **Configure Hud Mod Settings (Optional):**

    * Check the **Hud** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file will allow you to customize various aspects of the HUD.

    * If a config file exists, you may be able to adjust settings such as:
        * **Element Visibility:** Toggle specific HUD elements on or off.
        * **Positioning:** Adjust the screen coordinates for elements.
        * **Colors & Fonts:** Customize the appearance of text and graphics.
        * **Information Displayed:** Select which data points (e.g., player count, FPS) are shown.

6.  **Configure ACL (Access Control List) - (Rarely Needed for HUD):**

    * The **Hud** mod is primarily a client-side visual enhancement and typically does *not* require specific ACL entries for players to use or for the mod to function.
    * However, if your **Hud** mod includes any administrative commands (e.g., `/togglehud` for players, `/sethudcolor` for admins), then those commands would need corresponding ACL entries.
    * **Check the `Hud` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
    * If a command is found, you would add a `<right>` entry to the appropriate ACL group (e.g., `Admin` or `Default` for player-toggable features):
        ```xml
        <acl name="Admin">
            <!-- ... other rights ... -->
            <right name="command.togglehud" access="true"></right>
            <!-- ... other rights ... -->
        </acl>
        ```
    * Your provided `acl.xml` already lists `resource.D1_Hud` under the `Admin` group, which means administrators have full control over the resource itself.
    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Hud** mod should now be active, providing a custom heads-up display for your players!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Hud** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Hud** mod, please open an issue on this repository.
