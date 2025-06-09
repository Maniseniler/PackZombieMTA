# Zombies Mod for MTA:SA 🧟‍♂️ horde!

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Zombies** mod is the **core foundational resource** for establishing a zombie apocalypse on your Multi Theft Auto: San Andreas server. This mod is responsible for the **spawning, artificial intelligence (AI), and overall management of the zombie horde**. It brings the undead menace to life in your game world, providing the central challenge and defining feature of your zombie survival experience.

This mod is essential for creating the dynamic and perilous environment where players must fight for survival. It ties directly into other mods like `ZombieKillMessage`, `ZombieKillsScoreboard`, and `ZombieMoney`, forming the backbone of your server's zombie-themed gameplay.

---

## **Features**

* **Dynamic Zombie Spawning:** Controls how, where, and when zombies appear in the game world (e.g., in waves, in specific zones, or randomly).
* **Zombie AI:** Implements behaviors for zombies, such as pathfinding, attacking players, and reaction to damage.
* **Zombie Types/Skins (Optional):** May include different zombie models, speeds, health, or attack patterns.
* **Combat Integration:** Defines how zombies interact with players, weapons, and environmental elements.
* **Resource Drops (Optional):** Zombies may drop items, money, or other resources upon death.
* **Performance Management:** Designed to handle a potentially large number of zombies efficiently.
* **Persistence (Optional):** Zombie populations or specific zombie locations might persist across server restarts.

---

## **Technologies Used**

The **Zombies** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Ped & Element Functions:** Utilizes MTA's built-in functions for creating, managing, and manipulating ped (pedestrian/NPC) elements, including their AI.
* **MTA Event System:** Reacts to player actions, time changes, and other in-game events to manage zombie behavior.
* **Database (Implied):** If zombie data (e.g., specific zombie locations, boss zombie states) needs to persist, it likely interacts with a server-side database (e.g., XML file, MySQL).

---

## **Installation Guide**

To install the **Zombies** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Zombies** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Zombies** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Zombies** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Zombies** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Zombies" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Zombies`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Operation & Admin Control!_****

    * The **Zombies** mod will require specific ACL permissions for the resource itself to spawn, manage, and remove zombie pedestrians.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **Permissions for the Mod (Server-Side for Zombie Management):** The `Zombies` resource will need ACL rights to:
        * Create pedestrians: `function.createPed`
        * Set ped position: `function.setElementPosition`
        * Kill/remove pedestrians: `function.killPed` or `function.destroyElement`
        * Set ped AI: `function.setPedWalkingStyle`, `function.setPedTarget` etc.
        * Potentially give money/items: `function.setPlayerMoney`, `function.givePlayerItem` (if zombies drop loot).

        * Your provided `acl.xml` lists `resource.zombies` under the `Admin` group. This is good as it gives administrators control over the resource itself. **However, the resource itself needs the specific function rights to create and manage the zombies.** You will need to ensure the `Admin` ACL (or an `autoACL` associated with `Zombies`) has these necessary function rights set to `access="true"`.
        * **Example (critical for zombie spawning/management):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="function.createPed" access="true"></right>
                <right name="function.setElementPosition" access="true"></right>
                <right name="function.killPed" access="true"></right>
                <right name="function.setPedTarget" access="true"></right>
                <right name="function.setPlayerMoney" access="true"></right> <!-- if zombies drop money -->
                <!-- ... add other necessary functions here ... -->
            </acl>
            ```

    * **For Admin Commands (Optional):** If the **Zombies** mod includes commands for administrators to manage zombies (e.g., `/spawnzombie`, `/killallzombies`, `/setzombiespawnrate`), these should be granted to admin ACLs (e.g., `Admin`).
        * **Check the `Zombies` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
        * **Example (assuming admin command `spawnzombie`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.spawnzombie" access="true"></right>
                <!-- ... add other admin zombie commands here ... -->
            </acl>
            ```

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Zombies Mod Settings (Crucial for Customization):**

    * Check the **Zombies** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file will be crucial for defining your zombie apocalypse experience.

    * If a config file exists, you **must** customize settings such as:
        * **`spawnLocations`**: Coordinates where zombies can spawn.
        * **`spawnRate` / `spawnLimits`**: How many zombies spawn and how frequently.
        * **`zombieTypes`**: Define different zombie models, health, damage, and behaviors.
        * **`aggroRange`**: How close a player needs to be for a zombie to become aggressive.
        * **`lootDrops`**: What items or money zombies drop upon death.
        * **`messages`**: Custom messages related to zombie events.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Zombies** mod should now be active, unleashing the undead horde upon your server!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Zombies** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Zombies** mod, please open an issue on this repository.
