# SaveWeapon Mod for MTA:SA 💾🔫

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **SaveWeapon** mod is a vital persistence resource for your Multi Theft Auto: San Andreas server, designed to allow players to **save their current weapon loadout and ammunition counts**. This mod ensures that players' acquired weapons are remembered across server restarts and player sessions, providing a continuous and rewarding inventory experience.

In a dynamic server environment, especially one focused on combat and survival like your zombie apocalypse mod pack, losing hard-earned weapons upon disconnecting or server restart can be frustrating. **SaveWeapon** ensures that players' arsenals are always there when they reconnect, fostering a sense of progression and encouraging long-term engagement.

---

## **Features**

* **Persistent Weapon Loadout:** Players' equipped weapons and their ammunition counts are saved and automatically restored upon reconnection or server restart.
* **Seamless Inventory Persistence:** Eliminates the need for players to manually reacquire weapons or ammo, improving the user experience.
* **Reward Preservation:** Ensures that powerful or rare weapons acquired through gameplay (e.g., from `ZombieMoney` or `LevelSystem` rewards) are not lost.
* **Configurable Saving (Optional):** May allow configuration of what types of weapons are saved or if saving is tied to specific events (e.g., logging out, entering a safe zone).
* **Integration with Other Systems:** Works seamlessly with other economy and progression mods.

---

## **Technologies Used**

The **SaveWeapon** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **Database (Implied):** Likely interacts with a server-side database (e.g., XML file, MySQL) to store player weapon data persistently.

---

## **Installation Guide**

To install the **SaveWeapon** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **SaveWeapon** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **SaveWeapon** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **SaveWeapon** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **SaveWeapon** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="SaveWeapon" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start SaveWeapon`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Persistence!_****

    * For the **SaveWeapon** mod to successfully save and restore player weapons, the resource itself needs permissions to interact with player inventories and data.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **Permissions for the Mod (Server-Side for Persistence):** The `SaveWeapon` resource will likely need ACL rights to:
        * Get player weapons: `function.getPlayerWeapons`
        * Give weapons: `function.givePlayerWeapon`
        * Set player data: `function.setPlayerData` (if storing weapon info in player data).
        * Remove weapons: `function.takeWeapon` (if cleaning up old weapons before loading new ones).

        * Your provided `acl.xml` lists `resource.D1_SaveWeapon` under the `Admin` group, giving administrators control over the resource itself. **However, the resource itself needs the specific function rights to manage player weapons and save/load data.** You will need to ensure the `Admin` ACL (or an `autoACL` associated with `SaveWeapon`) has these necessary function rights set to `access="true"`.
        * **Example (critical for weapon persistence):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="function.givePlayerWeapon" access="true"></right>
                <right name="function.setPlayerData" access="true"></right>
                <right name="function.takeWeapon" access="true"></right>
                <!-- ... add other weapon/data management functions here if your mod uses them ... -->
            </acl>
            ```

    * **Permissions for Players (Optional Commands):** If the **SaveWeapon** mod includes any player-facing commands (e.g., `/savemyweapons`, `/loadmyweapons`), these might need `command` rights granted to the `Default` ACL or player groups. Admin commands (e.g., `/setplayerweapons`) would need rights for admin groups.
        * **Check the `SaveWeapon` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure SaveWeapon Mod Settings (Optional):**

    * Check the **SaveWeapon** folder for any configuration files (e.g., `config.lua` or `settings.xml`).

    * If a config file exists, you may be able to customize various aspects such as:
        * Whether to save all weapons or only specific types.
        * Minimum/maximum ammunition to save.
        * Excluding certain weapons from being saved (e.g., temporary pick-ups).
        * Messages displayed upon saving/loading weapons.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **SaveWeapon** mod should now be active, ensuring your players' hard-earned arsenals are always with them!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **SaveWeapon** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **SaveWeapon** mod, please open an issue on this repository.
