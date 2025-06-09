# xJump Mod for MTA:SA 🤸‍♂️⬆️

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **xJump** mod is a client-side resource for your Multi Theft Auto: San Andreas server, designed to enhance player mobility by introducing **advanced jumping mechanics**, such as higher jumps, double jumps, or custom jump animations. This mod provides players with increased traversal capabilities and opens up new possibilities for parkour, exploration, or evasion in various gameplay scenarios.

In your zombie apocalypse server, **xJump** can be a game-changer for survival. It allows players to escape dangerous situations more effectively, reach inaccessible areas for loot or safety, or simply adds a fun and engaging layer to movement, making the fight for survival more dynamic and less restrictive.

---

## **Features**

* **Enhanced Jumping Abilities:** Allows players to jump higher, farther, or perform multiple jumps (e.g., double jump).
* **Improved Mobility:** Increases player agility and traversal capabilities across the game world.
* **Parkour & Exploration:** Opens up new avenues for navigating the map and reaching unique spots.
* **Evasion & Combat Advantage:** Provides tools for players to outmaneuver zombies or other threats.
* **Client-Side Control:** Operates on the player's client, providing a fluid and responsive experience.
* **Configurable Parameters (Optional):** May allow customization of jump height, jump count, or stamina usage.

---

## **Technologies Used**

The **xJump** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Client-Side Events & Functions:** Utilizes MTA's client-side functions to detect player input (e.g., jump key) and modify player movement physics.

---

## **Installation Guide**

To install the **xJump** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **xJump** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **xJump** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **xJump** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **xJump** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="xJump" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start xJump`**.

5.  **Configure xJump Mod Settings (Optional):**

    * Check the **xJump** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file might allow you to customize the jump properties.

    * If a config file exists, you may be able to adjust settings such as:
        * **`jumpHeightMultiplier`**: Increase or decrease jump height.
        * **`doubleJumpEnabled`**: Toggle double jump functionality.
        * **`jumpStaminaCost`**: Define if jumps consume stamina or other resources.
        * **`permissionsRequired`**: (If only certain players should have xJump) Required ACL group or level.

6.  **Configure ACL (Access Control List) - (Generally Not Required for Basic Use):**

    * The **xJump** mod is primarily a client-side movement enhancement. It generally does *not* require specific ACL entries for players to use it, as its function is to automatically modify jump behavior.
    * However, if your **xJump** mod includes administrative commands (e.g., to toggle xJump for a player, or set global jump parameters) or if certain jump abilities are linked to `BuyAdmin` or `LevelSystem` tiers, those would need corresponding ACL entries.
    * **Check the `xJump` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
    * Your provided `acl.xml` lists `resource.D1_xJump` under the `Admin` group, which is good for general control over the resource itself.
    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **xJump** mod should now be active, providing players with enhanced jumping abilities!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **xJump** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **xJump** mod, please open an issue on this repository.
