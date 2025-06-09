# SaveTeam Mod for MTA:SA 💾👥

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **SaveTeam** mod is a crucial persistence resource for your Multi Theft Auto: San Andreas server, designed to allow players to **save and load their team affiliations**. This mod ensures that once a player joins or creates a team, their membership is remembered across server restarts and player sessions, providing a continuous team-based experience.

In a dynamic server environment, especially one that encourages cooperative play against zombies or team-based competitions, **SaveTeam** fosters a sense of belonging and ensures that players don't have to rejoin or recreate their teams every time they connect. It's a key component for building persistent communities and enhancing long-term player engagement.

---

## **Features**

* **Persistent Team Affiliation:** Players' team memberships are saved and automatically restored upon reconnection or server restart.
* **Team Creation & Management:** May include commands for players to create, join, leave, and manage their teams.
* **Seamless Reconnection:** Eliminates the need for players to manually rejoin their teams, improving the user experience.
* **Fosters Community:** Encourages stable team structures and cooperative gameplay.
* **Integration with Other Systems:** Can be linked with other mods that benefit from persistent team data (e.g., team houses, team money, team-based missions).

---

## **Technologies Used**

The **SaveTeam** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **Database (Implied):** Likely interacts with a server-side database (e.g., XML file, MySQL) to store player-to-team relationships persistently.

---

## **Installation Guide**

To install the **SaveTeam** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **SaveTeam** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **SaveTeam** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **SaveTeam** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **SaveTeam** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="SaveTeam" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start SaveTeam`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Usage!_****

    * For players to use team-related commands (e.g., creating, joining, leaving teams), you **must** grant them appropriate permissions in your `acl.xml` file. The mod itself will also need permissions to modify player accounts/data.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For Player Commands:** Identify the commands used for team management (e.g., `command.createteam`, `command.jointeam`, `command.leaveteam`). These commands should be granted to the `Default` ACL or the main player group (e.g., `AraB_GuesT`).
        * **Check the `SaveTeam` mod's server-side Lua files and `meta.xml` for the precise command handler names.**
        * **Example (assuming primary commands are `createteam`, `jointeam`, `leaveteam`):**
            ```xml
            <acl name="Default">
                <!-- ... other rights ... -->
                <right name="command.createteam" access="true"></right>
                <right name="command.jointeam" access="true"></right>
                <right name="command.leaveteam" access="true"></right>
                <!-- ... add other player team commands here ... -->
            </acl>
            ```

    * **Permissions for the Mod (Server-Side for Persistence):** The `SaveTeam` resource itself will need ACL rights to:
        * Modify player data: `function.setPlayerData` (if storing team info in player data).
        * Change player teams: `function.setPlayerTeam`.
        * Potentially create/destroy MTA teams: `function.createTeam`, `function.destroyTeam`.

        * Your provided `acl.xml` lists `resource.D1_SaveTeam` under the `Admin` group, giving administrators control over the resource itself. **However, the resource itself needs the specific function rights to manage player teams and save data.** You will need to ensure the `Admin` ACL (or an `autoACL` associated with `SaveTeam`) has these necessary function rights set to `access="true"`.
        * **Example (critical for team management):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="function.setPlayerTeam" access="true"></right>
                <right name="function.createTeam" access="true"></right>
                <right name="function.destroyTeam" access="true"></right>
                <!-- ... add other data/team management functions here if your mod uses them ... -->
            </acl>
            ```

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure SaveTeam Mod Settings (Optional):**

    * Check the **SaveTeam** folder for any configuration files (e.g., `config.lua` or `settings.xml`).

    * If a config file exists, you may be able to customize various aspects such as:
        * Maximum number of players per team.
        * Whether players need to pay to create a team.
        * Messages for team creation, joining, and leaving.
        * Criteria for team saving (e.g., only for logged-in players).

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **SaveTeam** mod should now be active, enabling persistent team affiliations for your players!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **SaveTeam** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **SaveTeam** mod, please open an issue on this repository.
