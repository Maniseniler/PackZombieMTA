# Weapons Mod for MTA:SA 🔫💥

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Weapons** mod is a foundational resource for your Multi Theft Auto: San Andreas server, designed to provide comprehensive **management and customization of in-game weaponry**. This mod goes beyond simple weapon shops, potentially controlling global weapon availability, custom weapon properties (damage, accuracy, rate of fire), unique weapon types, or dynamic weapon distribution throughout your server.

In your zombie apocalypse server, effective weapon handling is paramount. The **Weapons** mod allows you to fine-tune the combat experience, create distinct weapon tiers, or implement special weapon mechanics, ensuring a balanced and engaging fight against the undead. It's a core component for defining your server's combat dynamics and player interaction with the arsenal.

---

## **Features**

* **Global Weapon Control:** Manage the availability and behavior of all weapons across the server.
* **Custom Weapon Properties:** Adjust damage, accuracy, firing rate, and other attributes for specific weapon models.
* **Unique Weapon Spawning/Distribution:** Implement custom ways for players to acquire weapons beyond just a shop (e.g., drops, events, crates).
* **Ammunition Management:** Control how ammo is handled, distributed, or limited for different weapons.
* **New Weapon Types (Optional):** Introduce weapons not typically found in standard GTA: San Andreas.
* **Admin Weapon Management:** Tools for administrators to give, take, or inspect player weapons.

---

## **Technologies Used**

The **Weapons** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Weapon & Player Functions:** Utilizes MTA's built-in functions for manipulating player weapons, ammunition, and other related properties.
* **Database (Implied):** If custom weapon data or persistent global weapon states are maintained, it may interact with a server-side database (e.g., XML file, MySQL).

---

## **Installation Guide**

To install the **Weapons** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Weapons** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Weapons** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Weapons** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Weapons** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Weapons" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Weapons`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Management!_****

    * The **Weapons** mod will require specific ACL permissions, especially if it includes commands for administrators to manage weapons, or if it interacts with player inventories in a way that requires elevated rights.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **Permissions for the Mod (Server-Side for Weapon Manipulation):** The `Weapons` resource itself will likely need ACL rights to:
        * Give weapons: `function.givePlayerWeapon`
        * Take weapons: `function.takeWeapon`
        * Set weapon ammo: `function.setWeaponAmmo`
        * Potentially modify player money: `function.setPlayerMoney` (if weapon acquisition is tied to cost).

        * Your provided `acl.xml` lists `resource.Weapons` under the `Admin` group, which is good for general control over the resource itself. **However, the resource itself needs the specific function rights to manage player weapons and possibly other related properties.** You will need to ensure the `Admin` ACL (or an `autoACL` associated with `Weapons`) has these necessary function rights set to `access="true"`.
        * **Example (critical for weapon manipulation):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="function.givePlayerWeapon" access="true"></right>
                <right name="function.takeWeapon" access="true"></right>
                <right name="function.setWeaponAmmo" access="true"></right>
                <!-- ... add other necessary functions here ... -->
            </acl>
            ```

    * **For Admin/Moderator Commands:** If the **Weapons** mod includes commands for administrators to manage weapons (e.g., `/giveallweapons`, `/removeallweapons`, `/setweaponstats`), these should be granted to admin ACLs (e.g., `Admin`).
        * **Check the `Weapons` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
        * **Example (assuming admin command `giveallweapons`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.giveallweapons" access="true"></right>
                <!-- ... add other admin weapon commands here ... -->
            </acl>
            ```

    * **For Player Commands (Optional):** If players have any commands related to weapons (e.g., `/checkammo`, `/dropweapon`), these might need `command` rights granted to the `Default` ACL or player groups.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Weapons Mod Settings (Crucial for Customization):**

    * Check the **Weapons** folder for a configuration file (e.g., `config.lua`, `weapon_stats.xml`, or `settings.xml`). This file will be crucial for defining custom weapon properties.

    * If a config file exists, you **must** customize settings such as:
        * **`weaponStats`**: A table defining custom damage, recoil, spread, and other properties for each weapon model.
        * **`ammoLimits`**: Global or per-weapon ammo caps.
        * **`defaultWeapons`**: Weapons players receive upon spawning.
        * **`messages`**: Custom messages related to weapon actions.
        * **`weaponDrops`**: (If applicable) Configuration for dropped weapons from zombies or players.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Weapons** mod should now be active, controlling and customizing the arsenal in your game world!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Weapons** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Weapons** mod, please open an issue on this repository.
