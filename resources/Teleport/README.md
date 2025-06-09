# Teleport Mod for MTA:SA 🚀📍

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Teleport** mod is a highly versatile resource for your Multi Theft Auto: San Andreas server, designed to provide players and administrators with the ability to **instantly move to specific locations within the game world**. This mod can be implemented in various ways: as a set of pre-defined warp points, a command to teleport to coordinates, or even a system for players to save and revisit personal locations.

In your zombie apocalypse server, **Teleport** can be used for quick travel, to access event locations, to escape dangerous situations, or for administrators to rapidly respond to issues or manage player gatherings. It significantly enhances navigation and convenience, making the vast open world more accessible and efficient.

---

## **Features**

* **Instantaneous Travel:** Move players to designated locations quickly.
* **Warp Points/Destinations:** Create a list of pre-defined locations players can teleport to (e.g., safe zones, city centers, event areas).
* **Coordinate Teleportation (Admin):** Administrators can teleport to any given coordinates.
* **Player-Saved Locations (Optional):** Allow players to save and teleport back to their own custom points.
* **Teleportation Effects (Optional):** Add visual or sound effects for teleportation.
* **Permission-Based Access:** Control who can use specific teleport commands or destinations.

---

## **Technologies Used**

The **Teleport** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Element Functions:** Utilizes MTA's built-in functions for setting player positions and handling coordinates.

---

## **Installation Guide**

To install the **Teleport** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Teleport** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Teleport** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Teleport** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Teleport** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Teleport" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Teleport`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Usage!_****

    * The **Teleport** mod requires specific ACL permissions for its commands, varying based on who should have access (players, VIPs, admins).

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For Player Commands (e.g., warp to public locations):** If there are player-facing teleport commands (e.g., `/warp [destination]`, `/teleporttohouse`), these commands should be granted to the `Default` ACL, `AraB_GuesT`, or specific player groups (e.g., `VIP`).
        * **Check the `Teleport` mod's server-side Lua files and `meta.xml` for the precise command handler names.**
        * **Example (assuming a player command `warp`):**
            ```xml
            <acl name="Default">
                <!-- ... other rights ... -->
                <right name="command.warp" access="true"></right>
                <!-- ... add other player-facing teleport commands here ... -->
            </acl>
            ```

    * **For Admin/Moderator Commands (e.g., teleport to player, coordinates):** Commands for administrators to teleport to players, specific coordinates, or manage warp points (e.g., `/tpto [player]`, `/goto [x] [y] [z]`, `/createwarp`) should be granted to admin ACLs (e.g., `Admin`, `SuperModerator`).
        * **Example (assuming admin commands `tpto` and `goto`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.tpto" access="true"></right>
                <right name="command.goto" access="true"></right>
                <!-- ... add other admin teleport commands here ... -->
            </acl>
            ```
        * Your provided `acl.xml` lists `resource.D1_Teleport` under the `Admin` group, which is good for general control over the resource itself.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Teleport Mod Settings (Crucial for Customization):**

    * Check the **Teleport** folder for a configuration file (e.g., `config.lua`, `warps.xml`, or `settings.xml`). This file will be crucial for defining your teleport locations and settings.

    * If a config file exists, you **must** customize settings such as:
        * **`warpPoints`**: A list or table defining specific teleport destinations (name, coordinates, interior, dimension).
        * **`teleportCost`**: (If applicable) The in-game money required to use certain teleports.
        * **`cooldowns`**: Time delays between teleports.
        * **`messages`**: Custom messages displayed during teleportation.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Teleport** mod should now be active, enabling quick and efficient movement around your game world!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Teleport** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Teleport** mod, please open an issue on this repository.
