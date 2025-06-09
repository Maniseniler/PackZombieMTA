# ZoneArea Mod for MTA:SA 🗺️📍

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **ZoneArea** mod is a powerful and versatile resource for your Multi Theft Auto: San Andreas server, designed to define **specific geographical areas within the game world** and trigger events or apply rules when players enter or leave these zones. This mod is essential for creating dynamic environments, safe zones, event areas, custom mission locations, or areas with unique gameplay mechanics.

In your zombie apocalypse server, **ZoneArea** can be used to:
* Designate safe zones where zombies cannot enter or attack.
* Create contaminated areas that cause damage over time.
* Define mission objectives zones.
* Trigger events or announcements when players enter a specific region.
* Control resource spawning or specific rules within certain boundaries.

It's a foundational tool for building a structured and interactive open world.

---

## **Features**

* **Customizable Zone Definitions:** Define rectangular, circular, or polygonal areas within the game world using coordinates.
* **Enter/Exit Events:** Trigger specific scripts, effects, or rules when players enter or leave a defined zone.
* **Rule Enforcement:** Apply unique gameplay rules within a zone (e.g., no-PvP, increased zombie spawns, safe zone properties).
* **Visual Representation (Optional):** May include optional visual markers for zones (e.g., colored ground, boundary markers).
* **Player Notifications:** Inform players when they enter or leave significant zones.
* **Dynamic Zone Creation (Admin):** Allow administrators to create and manage zones in-game.

---

## **Technologies Used**

The **ZoneArea** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Element & Trigger Functions:** Utilizes MTA's built-in functions for creating elements, detecting player collisions with areas, and triggering events.
* **Database (Implied):** If zones are created dynamically or need to persist across server restarts, it likely interacts with a server-side database (e.g., XML file, MySQL) to store zone definitions.

---

## **Installation Guide**

To install the **ZoneArea** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **ZoneArea** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **ZoneArea** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **ZoneArea** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **ZoneArea** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="ZoneArea" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start ZoneArea`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Admin Control & Potential Zone Effects!_****

    * The **ZoneArea** mod requires specific ACL permissions, especially if it includes commands for administrators to create, edit, or delete zones, or if the zones themselves trigger actions that require elevated rights (e.g., giving money, changing player health).

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For Admin Commands:** If the **ZoneArea** mod includes commands for administrators to manage zones (e.g., `/createzone`, `/editzone`, `/deletezone`, `/setzoneeffect`), these should be granted to admin ACLs (e.g., `Admin`, `SuperModerator`).
        * **Check the `ZoneArea` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
        * **Example (assuming admin command `createzone`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.createzone" access="true"></right>
                <!-- ... add other admin zone commands here ... -->
            </acl>
            ```

    * **Permissions for the Mod (Server-Side for Zone Effects):** If zones apply effects (e.g., give/take money, heal/damage players, change player properties), the `ZoneArea` resource itself will need ACL rights to perform those actions.
        * `function.setPlayerMoney`, `function.setElementHealth`, `function.givePlayerWeapon`, etc.
        * Your provided `acl.xml` lists `resource.D1_ZoneArea` under the `Admin` group, which is good for general control over the resource itself. You will need to ensure the `Admin` ACL (or an `autoACL` associated with `ZoneArea`) has these necessary function rights set to `access="true"`.
        * **Example (critical for zone effects):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="function.setElementHealth" access="true"></right>
                <right name="function.setPlayerMoney" access="true"></right>
                <!-- ... add other necessary functions here ... -->
            </acl>
            ```

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure ZoneArea Mod Settings (Crucial for Customization):**

    * Check the **ZoneArea** folder for a configuration file (e.g., `config.lua`, `zones.xml`, or `settings.xml`). This file will be crucial for defining your server's zones and their properties.

    * If a config file exists, you **must** customize settings such as:
        * **`zoneDefinitions`**: A table or list defining each zone (name, type of area, coordinates, interior/dimension).
        * **`zoneEffects`**: What happens when a player enters/leaves a zone (e.g., apply a specific buff/debuff, give money, display message).
        * **`messages`**: Custom messages for entering/leaving zones.
        * **`permissions`**: (If not handled by ACLs) Who can enter certain zones.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **ZoneArea** mod should now be active, creating dynamic and interactive areas in your game world!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **ZoneArea** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **ZoneArea** mod, please open an issue on this repository.
