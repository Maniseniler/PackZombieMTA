# Mosaba9at Mod for MTA:SA 🏆🏅

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Mosaba9at** mod (which translates to "Competitions" in Arabic) introduces a dynamic and engaging **in-game competition system** to your Multi Theft Auto: San Andreas server. This mod allows administrators or designated event organizers to host various types of contests, challenges, or mini-games for players, complete with defined rules, objectives, and rewards.

In your zombie apocalypse server, **Mosaba9at** can be used to spice up gameplay, offering breaks from regular survival, fostering player interaction, and driving competitive spirit. Whether it's a shooting contest, a race, a last-man-standing challenge, or a unique zombie-themed event, this mod provides the framework to host exciting server-wide activities.

---

## **Features**

* **Host Diverse Competitions:** Framework to create and run various types of in-game challenges and mini-games.
* **Defined Objectives & Rules:** Set clear goals and conditions for winning each competition.
* **Reward System:** Configure prizes (e.g., money, unique items, XP, or admin powers via `BuyAdmin`) for winners and participants.
* **Automated Management:** Potentially handles starting, tracking, and ending competitions automatically.
* **Player Participation:** Encourages broad player involvement in server events.
* **Announcements & Leaderboards (Optional):** May broadcast competition status and display results.

---

## **Technologies Used**

The **Mosaba9at** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Event System:** Integrates with MTA's event handlers for managing competition logic and player interactions.

---

## **Installation Guide**

To install the **Mosaba9at** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Mosaba9at** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Mosaba9at** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Mosaba9at** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Mosaba9at** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Mosaba9at" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Mosaba9at`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Management & Rewards!_****

    * For administrators or designated event organizers to start and manage competitions, you **must** grant them appropriate permissions in your `acl.xml` file. The mod itself will also need permissions to grant rewards.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For Admin/Event Commands:** Identify the commands used to start, stop, or manage competitions (e.g., `command.startmosaba9at`, `command.endmosaba9at`, `command.setmosaba9at`). These commands should be granted to `Admin`, `SuperModerator`, or a specific event-manager group.
        * **Check the `Mosaba9at` mod's server-side Lua files and `meta.xml` for the precise command handler names.**
        * **Example (assuming the command to start is `startmosaba9at`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.startmosaba9at" access="true"></right>
                <!-- ... add other competition management commands here ... -->
            </acl>
            ```

    * **Permissions for the Mod (Server-Side for Rewards):** If competitions grant rewards (e.g., money, items, XP, or modify player groups for `BuyAdmin`), the `Mosaba9at` resource itself will need ACL rights to perform those actions (e.g., `function.setPlayerMoney`, `function.givePlayerWeapon`, `function.aclGroupAddObject`).
        * Your provided `acl.xml` lists `resource.D1_Mosaba9at` under the `Admin` group. This is good as it gives administrators control over the resource itself. **However, the resource itself needs the specific function rights to grant rewards.** You will need to ensure the `Admin` ACL (or an `autoACL` associated with `Mosaba9at`) has these necessary function rights set to `access="true"`.
        * **Example (critical for granting rewards):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="function.setPlayerMoney" access="true"></right>
                <right name="function.givePlayerWeapon" access="true"></right>
                <right name="function.aclGroupAddObject" access="true"></right>
                <!-- ... add other reward-related functions here if your mod uses them ... -->
            </acl>
            ```

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Mosaba9at Mod Settings (Crucial for Customization):**

    * Check the **Mosaba9at** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file will be crucial for defining your competitions.

    * If a config file exists, you **must** customize settings such as:
        * **`competitionTypes`**: Define different types of competitions (e.g., "Last Man Standing," "Race," "Target Shoot").
        * **`rewards`**: Specify the rewards for each competition type or specific placements.
        * **`startConditions`**: Minimum player count, required items, or entry fees.
        * **`messages`**: Custom announcements for starting, joining, and ending competitions.
        * **`competitionAreas`**: Define specific zones where competitions take place.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Mosaba9at** mod should now be active, ready for you to host exciting competitions!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Mosaba9at** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Mosaba9at** mod, please open an issue on this repository.
