# LevelSystem Mod for MTA:SA 📈🌟

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **LevelSystem** mod introduces a core **player progression system** to your Multi Theft Auto: San Andreas server. This mod allows players to earn experience points (XP) through various in-game activities (e.g., killing zombies, completing quests, playing time) and progress through defined levels. As players level up, they can unlock new abilities, gain access to exclusive items, or receive other rewards.

In your zombie apocalypse server, a well-implemented LevelSystem provides a powerful incentive for players to engage, persist, and explore, giving them a clear sense of progression and achievement. It adds significant depth to the gameplay loop, encouraging long-term player retention and fostering a more dedicated community.

---

## **Features**

* **Experience Point (XP) System:** Players gain XP for performing specified actions within the game.
* **Player Level Progression:** As XP accumulates, players level up, unlocking new tiers of power or access.
* **Reward System:** Configure rewards for reaching new levels (e.g., money, weapons, abilities, access to certain areas).
* **Persistent Data:** Player levels and XP are saved, ensuring progress is maintained across server restarts and player sessions.
* **Customizable Activities:** Define which in-game actions grant XP and how much.
* **Level Display (Optional):** Show player levels on HUD, chat, or scoreboard for prestige.

---

## **Technologies Used**

The **LevelSystem** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **Database (Implied):** Likely interacts with a server-side database (e.g., XML file, MySQL) to store player XP and level data persistently.

---

## **Installation Guide**

To install the **LevelSystem** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **LevelSystem** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **LevelSystem** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **LevelSystem** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **LevelSystem** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="LevelSystem" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start LevelSystem`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Operation & Rewards!_****

    * The **LevelSystem** mod will require specific ACL permissions, especially if it automatically grants rewards (like money, weapons, or new permissions) upon leveling up.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **Permissions for the Mod (Server-Side):** The `LevelSystem` resource itself will need rights to:
        * Modify player money: `function.setPlayerMoney` (if levels grant money).
        * Give weapons: `function.givePlayerWeapon` (if levels grant weapons).
        * Change player groups/ACLs: `function.aclGroupAddObject` (if levels grant new admin/vip access).
        * Potentially other functions depending on the rewards.

        * Your `acl.xml` already lists `resource.D1_LevelSystem` under the `Admin` group. This is good as it grants administrators control over the resource itself. **However, the resource itself needs rights to perform actions on players and ACLs.** You will need to ensure the `Admin` ACL (or an `autoACL` associated with `LevelSystem`) has these necessary function rights set to `access="true"`.

        * **Example (critical for rewards):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="function.setPlayerMoney" access="true"></right>
                <right name="function.givePlayerWeapon" access="true"></right>
                <right name="function.aclGroupAddObject" access="true"></right>
                <!-- ... add other reward-related functions here ... -->
            </acl>
            ```

    * **Permissions for Players (Optional Commands):** If the **LevelSystem** mod includes commands for players (e.g., `/mylevel`, `/showxp`), these might need `command` rights granted to the `Default` ACL or player groups. Admin commands (e.g., `/setlevel`, `/addxp`) would need rights for admin groups.
        * **Check the `LevelSystem` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure LevelSystem Mod Settings (Crucial for Customization):**

    * Check the **LevelSystem** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file will be crucial for defining your level progression.

    * If a config file exists, you **must** customize settings such as:
        * **`levelRequirements`**: A table or list defining the XP needed for each level.
        * **`xpSources`**: What actions give XP (e.g., zombie kills, specific events, time played) and how much XP they grant.
        * **`levelRewards`**: What rewards are given at each level (money, items, access to new groups).
        * **`maxLevel`**: The highest achievable level.
        * **`messages`**: Custom messages for level-ups or XP gains.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **LevelSystem** mod should now be active, allowing your players to start their journey of progression!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **LevelSystem** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **LevelSystem** mod, please open an issue on this repository.
