# Bodygurad Mod for MTA:SA 🛡️🧍

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Bodygurad** mod introduces a dynamic and strategic element to your Multi Theft Auto: San Andreas server, particularly enhancing the survival experience in a zombie apocalypse setting. This mod empowers players to **spawn a personal AI-controlled bodyguard**, providing them with a loyal companion that will actively follow and defend them against hostile entities, including zombies and other threats.

This feature is invaluable for players seeking additional firepower during a zombie horde, extra protection while traversing dangerous areas, or a reliable backup in player-versus-player encounters. **Bodygurad** offers a customizable and engaging way to boost personal security and tactical options, making survival more manageable and exciting.

---

## **Features**

* **Spawn Personal Bodyguard:** Players with the appropriate permissions can easily summon their own AI bodyguard.

* **Intelligent Follow & Protect AI:** The spawned bodyguard will intelligently follow the commanding player, engaging and defending against any detected hostile targets.

* **Enhanced Survivability:** Provides players with critical support during intense combat situations, increasing their chances of survival.

* **Command-Based Control:** Likely includes a simple in-game command (e.g., `/bodyguard` or `/spawnprotector`) to manage the bodyguard (spawn, dismiss).

* **Customizable Attributes (Optional):** May offer configuration options within its files to adjust the bodyguard's appearance (skin), weaponry, health, and possibly other behaviors.

---

## **Technologies Used**

The **Bodygurad** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.

---

## **Installation Guide**

To install the **Bodygurad** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Bodygurad** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Bodygurad** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Bodygurad** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Bodygurad** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Bodygurad" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Bodygurad`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Usage!_****

    * For players to be able to use the bodyguard feature (e.g., by typing a command), you **must** grant them appropriate permissions in your `acl.xml` file.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * Identify the ACL group(s) you want to grant this permission to (e.g., `Admin`, `Vip`, or a custom player group).

    * You will need to add a `<right>` entry for the bodyguard command. The exact command name depends on how you implemented it in the mod's script (e.g., `command.bodyguard`, `command.spawnbodyguard`, etc.). **Please check your `Bodygurad` mod's server-side Lua file for the precise command handler name.**

    * **Example (assuming the command is `bodyguard`):**
        ```xml
        <acl name="Vip">
            <!-- ... other rights ... -->
            <right name="command.bodyguard" access="true"></right>
            <!-- ... other rights ... -->
        </acl>
        ```

    * **Regarding the `Mani` User:**
        * Your provided `acl.xml` has a dedicated group `<group name="Admin">` which lists `resource.D1_Bodygurad`. This means administrators (and potentially `Mani` if they are in that group) will have control over the resource itself.
        * You also have a specific group `<group name="AdminMsg">` and others that include `user.Mani`. If the command for spawning a bodyguard is intended for **Mani** specifically, ensure a command right is added to the `AdminMsg` group or another group **Mani** is part of.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Bodygurad Mod Settings (Optional):**

    * Check the `Bodygurad` folder for any configuration files (e.g., `config.lua` or `settings.xml`).

    * If a config file exists, you may be able to customize various aspects such as:
        * The default character skin for the bodyguard.
        * The weapon(s) the bodyguard is equipped with.
        * The bodyguard's health and armor values.
        * Any cost (money/resources) associated with spawning a bodyguard.
        * Cooldowns for spawning.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Bodygurad** mod should now be active, allowing players with the correct permissions to summon their personal protectors!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Bodygurad** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Bodygurad** mod, please open an issue on this repository.
