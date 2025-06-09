# Discord_Rich Mod for MTA:SA 🎮🔊

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Discord_Rich** mod integrates your Multi Theft Auto: San Andreas server with **Discord Rich Presence**. This allows information about your server and players' in-game status to be displayed directly on their Discord profiles. When a player is connected to your MTA server, their Discord status will show details like:

* The name of your server.
* The current map being played.
* The number of players online.
* Their current in-game activity (e.g., "Playing Zombie Apocalypse," "Fighting Zombies").

This mod is a fantastic way to enhance your server's visibility, attract new players, and provide a more immersive and connected experience for your community by bridging the gap between your game server and Discord.

---

## **Features**

* **Discord Rich Presence Integration:** Display real-time server and player activity on Discord profiles.
* **Server Information Display:** Show current map, player count, and server name directly on Discord.
* **Dynamic Player Status:** Update player's individual activity (e.g., "In-game," "AFK," "In Combat") based on their actions.
* **Promotional Tool:** Increases server visibility and engagement within the Discord community.
* **Customizable Presence:** (Optional) Allows configuration of the specific text and images displayed in the Rich Presence.

---

## **Technologies Used**

The **Discord_Rich** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **Discord API (via HTTP calls):** Utilizes web requests to communicate with Discord's API for updating Rich Presence.

---

## **Installation Guide**

To install the **Discord_Rich** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Discord_Rich** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Discord_Rich** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Discord_Rich** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Discord_Rich** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Discord_Rich" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Discord_Rich`**.

5.  **Configure Discord_Rich Mod Settings (Crucial for Functionality):**

    * The **Discord_Rich** mod will almost certainly include a dedicated configuration file (often named `config.lua` or a section within `meta.xml` inside the `Discord_Rich` folder) where you **must** configure your Discord Application details.

    * **Please check the Discord_Rich mod's folder for such a file to adjust settings like:**

        * `discordApplicationID`: **This is critical.** You need to create a new application in the [Discord Developer Portal](https://discord.com/developers/applications) to get an Application ID. This ID links your game's Rich Presence to your Discord application.
        * `largeImageKey`, `smallImageKey`: Keys for custom images to display in the Rich Presence (these need to be uploaded to your Discord Application's Rich Presence Assets).
        * `details`, `state`: Customizable text for the Rich Presence (e.g., "Playing on My Zombie Server," "Surviving the Apocalypse").
        * `connectButtonLabel`, `connectButtonURL`: (Optional) Text and URL for a "Join Game" button on the Discord profile.

    * **Failure to configure the `discordApplicationID` will result in the mod not working correctly.**

6.  **Configure ACL (Access Control List) - (If Specific Permissions are Needed):**

    * The **Discord_Rich** mod primarily functions passively to update Discord profiles. It generally does not require specific ACL entries for players to "use" it.
    * However, if your **Discord_Rich** mod includes any administrative commands (e.g., to toggle Rich Presence, reload its configuration, or change messages in-game), those commands would need corresponding ACL entries.
    * **Check the `Discord_Rich` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
    * If a command is found (e.g., `command.reloadrichpresence`), you would add a `<right>` entry to the appropriate ACL group (e.g., `Admin`):
        ```xml
        <acl name="Admin">
            <!-- ... other rights ... -->
            <right name="command.reloadrichpresence" access="true"></right>
            <!-- ... other rights ... -->
        </acl>
        ```
    * Your provided `acl.xml` lists `resource.Discord_Rich` under the `Admin` group (or similar `D1_` prefix if applicable), which means administrators have full control over the resource itself.
    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Discord_Rich** mod should now be active, broadcasting your server's presence to Discord!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Discord_Rich** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Discord_Rich** mod, please open an issue on this repository.
