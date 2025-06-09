# Tag Mod for MTA:SA 🏷️🏷️

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Tag** mod introduces a dynamic and customizable **player tagging system** to your Multi Theft Auto: San Andreas server. This mod allows for the display of custom tags or prefixes/suffixes next to player names, indicating their status, role, group, or achievements. These tags can be purely cosmetic or can signify special in-game abilities or privileges.

In your zombie apocalypse server, **Tag** can be used to highlight VIPs, show administrative roles, display level progression (integrating with your `LevelSystem`), identify special event participants, or simply add a personalized touch to player names, enhancing visual clarity and player recognition.

---

## **Features**

* **Customizable Player Tags:** Display unique text or icons next to player names.
* **Role-Based/Status-Based Tags:** Assign tags based on a player's rank, group (e.g., "Admin," "VIP"), or current status (e.g., "AFK," "Event Participant").
* **Dynamic Tag Updates:** Tags can change automatically based on player actions, level progression, or administrative assignment.
* **Enhanced Player Identification:** Makes it easier to distinguish between players and understand their roles.
* **Prestige & Rewards:** Can serve as a visual reward for achievements, donations, or long-term play.

---

## **Technologies Used**

The **Tag** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Client-Side GUI/Rendering:** Likely utilizes MTA's client-side functions to draw and update player name tags.

---

## **Installation Guide**

To install the **Tag** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Tag** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Tag** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Tag** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Tag** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Tag" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Tag`**.

5.  **Configure ACL (Access Control List) - (If Specific Permissions are Needed):**

    * The **Tag** mod's primary function is to display tags. For players to *have* tags displayed, no direct ACL is usually needed. However, if there are commands to *assign* tags or *manage* the tag system, then ACL is crucial.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For Admin Commands:** If your **Tag** mod includes commands for administrators to manage player tags (e.g., `/settags [player] [tag]`, `/removetags`), these commands should be granted to admin ACLs (e.g., `Admin`, `SuperModerator`).
        * **Check the `Tag` mod's server-side Lua files and `meta.xml` for the precise command handler names.**
        * **Example (assuming admin commands `settag` and `removetag`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.settag" access="true"></right>
                <right name="command.removetag" access="true"></right>
                <!-- ... add other tag management commands here ... -->
            </acl>
            ```
        * Your provided `acl.xml` lists `resource.D1_Tag` under the `Admin` group, which is good for general control over the resource itself.

    * **For Player Commands (Optional):** If players can set their own custom tags (perhaps for a cost, or unlocked through your `LevelSystem`), those commands would need to be granted to player ACLs (e.g., `Default`).

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Tag Mod Settings (Crucial for Customization):**

    * Check the **Tag** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file will be crucial for defining your tags.

    * If a config file exists, you **must** customize settings such as:
        * **`tagDefinitions`**: A list or table defining different tags, their text, color, and any conditions for display (e.g., associated ACL groups, level requirements, `BuyAdmin` purchase).
        * **`tagFormat`**: How the tag appears relative to the player name (e.g., `[TAG] PlayerName` or `PlayerName <TAG>`).
        * **`visibility`**: Whether tags are always visible or only to certain groups.
        * **`defaultTag`**: A tag assigned to all players by default.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Tag** mod should now be active, displaying custom tags for your players!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Tag** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Tag** mod, please open an issue on this repository.
