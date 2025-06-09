# WarpSystem Mod for MTA:SA 🚀🌌

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **WarpSystem** mod is a highly practical resource for your Multi Theft Auto: San Andreas server, designed to provide a structured and controlled method for **instantaneous player travel** between predefined locations, often referred to as "warp points" or "destinations". This system offers a more organized approach to fast travel compared to raw coordinate-based teleportation.

In your zombie apocalypse server, an efficient **WarpSystem** is invaluable. It allows players to quickly move between safe zones, key objectives, event areas, or strategic points, reducing travel time and enhancing accessibility. It provides a convenient way for players to navigate the vast game world and participate in activities without excessive journeying.

---

## **Features**

* **Predefined Warp Points:** Establish specific, named locations that players can instantly travel to.
* **Menu-Based or Command-Based Access:** Players can access warp points via an intuitive in-game menu or specific commands.
* **Efficient Navigation:** Greatly reduces travel time across the map, making it easier for players to reach destinations.
* **Permission-Based Destinations:** Control which warp points are accessible to different player groups (e.g., public, VIP-only, admin-only).
* **Cost System (Optional):** Warps can be configured to cost in-game money (e.g., `ZombieMoney`).
* **Visual/Sound Effects (Optional):** Add immersive effects for teleportation.

---

## **Technologies Used**

The **WarpSystem** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA GUI/Element Functions:** Utilizes MTA's built-in functions for creating menus, setting player positions, and handling custom elements for warp points.

---

## **Installation Guide**

To install the **WarpSystem** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **WarpSystem** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **WarpSystem** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **WarpSystem** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **WarpSystem** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="WarpSystem" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start WarpSystem`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Usage!_****

    * The **WarpSystem** mod requires specific ACL permissions for its commands and potentially for the resource itself to manage player positions and currency.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For Player Commands/Menu Access:** Players will need permission to use the command that opens the warp menu or directly warps them (e.g., `/warp`, `/warplist`). This command should be granted to the `Default` ACL or specific player groups (e.g., `VIP`).
        * **Check the `WarpSystem` mod's server-side Lua files and `meta.xml` for the precise command handler name.**
        * **Example (assuming a player command `warp`):**
            ```xml
            <acl name="Default">
                <!-- ... other rights ... -->
                <right name="command.warp" access="true"></right>
                <!-- ... add other player-facing warp commands here ... -->
            </acl>
            ```

    * **For Admin/Moderator Commands:** Commands for administrators to manage warp points (e.g., `/createwarp`, `/deletewarp`, `/setwarpinfo`) should be granted to admin ACLs (e.g., `Admin`, `SuperModerator`).
        * **Example (assuming admin command `createwarp`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.createwarp" access="true"></right>
                <!-- ... add other admin warp commands here ... -->
            </acl>
            ```
        * Your provided `acl.xml` lists `resource.D1_WarpSystem` under the `Admin` group, which is good for general control over the resource itself.

    * **Permissions for the Mod (Server-Side for Player Movement/Money):** If warping has a cost or requires setting player positions, the `WarpSystem` resource itself will need ACL rights to:
        * Set player positions: `function.setElementPosition` or similar functions.
        * Modify player money: `function.setPlayerMoney` (if warps have a cost).
        * Your provided `acl.xml` already lists `resource.D1_WarpSystem` under the `Admin` group. You will need to ensure the `Admin` ACL (or an `autoACL` associated with `WarpSystem`) has these necessary function rights set to `access="true"`.
        * **Example (critical for warp functionality):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="function.setElementPosition" access="true"></right>
                <right name="function.setPlayerMoney" access="true"></right>
                <!-- ... add other necessary functions here ... -->
            </acl>
            ```

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure WarpSystem Mod Settings (Crucial for Customization):**

    * Check the **WarpSystem** folder for a configuration file (e.g., `config.lua`, `warps.xml`, or `settings.xml`). This file will be crucial for defining your warp points.

    * If a config file exists, you **must** customize settings such as:
        * **`warpPoints`**: A table or list defining each warp destination (name, coordinates, interior, dimension, required permission level, cost).
        * **`defaultWarp`**: The default warp point for new players or when no specific destination is chosen.
        * **`messages`**: Custom messages displayed during warp interactions.
        * **`cooldown`**: Time delay between warp uses.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **WarpSystem** mod should now be active, providing efficient and organized travel options for your players!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **WarpSystem** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **WarpSystem** mod, please open an issue on this repository.
