# Horob Mod for MTA:SA 🚴🔫

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Horob** mod (which translates to "Escape" in Arabic) introduces an exciting and unique **bike mini-game** to your Multi Theft Auto: San Andreas server. This mod focuses on a thrilling chase scenario where one player, armed with a tranquilizer gun, hunts down other players who are trying to escape on bikes. It's a high-stakes, fast-paced game mode designed to provide intense fun and competition within your server environment.

This mod creates a fresh, dynamic event that breaks from traditional gameplay, offering a unique blend of pursuit, evasion, and strategic aiming. It's an excellent addition to keep your players engaged and entertained, offering a different kind of challenge in your zombie apocalypse mod pack.

---

## **Features**

* **Bike Chase Mini-Game:** A structured mini-game where players on bikes are pursued.
* **Tranquilizer Gun Mechanic:** One player acts as the hunter, equipped with a "trank" gun to disable or tag others.
* **Role-Based Gameplay:** Clear roles for the hunter and the escaping players.
* **Competitive & Fun:** Designed for engaging player-versus-player interaction and excitement.
* **Configurable Game Parameters (Optional):** May allow adjustment of game duration, bike types, weapon properties, or win conditions.

---

## **Technologies Used**

The **Horob** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.

---

## **Installation Guide**

To install the **Horob** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Horob** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Horob** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Horob** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Horob** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Horob" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Horob`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Usage!_****

    * For players to participate in and possibly initiate the **Horob** mini-game, you **must** grant them appropriate permissions in your `acl.xml` file.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For initiating the mini-game:** There will likely be a command to start the "Horob" mini-game. This command should be granted to administrators or event organizers.
        * **Check the `Horob` mod's server-side Lua files and `meta.xml` for the precise command handler name (e.g., `command.starthorob`, `command.horobgame`).**
        * **Example (assuming the command is `starthorob`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.starthorob" access="true"></right>
                <!-- ... other rights ... -->
            </acl>
            ```

    * **For player participation:** If there are specific player-side commands (e.g., to join the game, select a role, use the tranquilizer gun if it's a new weapon class), those commands might also require ACL entries for general players (e.g., in the `Default` or `AraB_GuesT` group).
        * **Example (if a command to join is `joinhorob`):**
            ```xml
            <acl name="Default">
                <!-- ... other rights ... -->
                <right name="command.joinhorob" access="true"></right>
                <!-- ... other rights ... -->
            </acl>
            ```

    * **Regarding the `Mani` User:**
        * Your provided `acl.xml` lists `resource.D1_Horob` under the `Admin` group, giving administrators control over the resource.
        * Ensure the `Admin` ACL (or relevant admin ACLs) has the command rights to *start* the game.
        * If `Mani` is intended to specifically host or manage this game, ensure their relevant groups (like `FA3LYAT` or `AdminMsg` groups you've set up for them) also have the necessary command rights.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Horob Mod Settings (Optional):**

    * Check the **Horob** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file will be important for customizing the mini-game.

    * If a config file exists, you may be able to adjust settings such as:
        * Game duration.
        * Number of players required to start.
        * Types of bikes allowed.
        * Tranquilizer gun properties (damage, range, cooldown).
        * Rewards for winners/losers.
        * Starting locations for players.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Horob** mod should now be active, ready for thrilling bike chases and tranquilizer action!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Horob** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Horob** mod, please open an issue on this repository.
