# Weapon-Shop Mod for MTA:SA 🛒🔫

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Weapon-Shop** mod is a vital economic and gameplay resource for your Multi Theft Auto: San Andreas server, designed to provide players with a dedicated in-game location or system to **purchase weapons and ammunition**. This mod integrates directly with your server's economy, allowing players to spend their earned `ZombieMoney` to acquire the tools necessary for survival against the undead.

In your zombie apocalypse server, access to a reliable weapon supply is paramount. The **Weapon-Shop** ensures that players can consistently arm themselves, progress through better weaponry, and prepare for the challenges ahead, enhancing both the survival aspect and the overall gameplay loop.

---

## **Features**

* **In-Game Weapon Purchases:** Players can buy various weapons and ammunition using in-game currency.
* **Configurable Inventory:** Server owners can define which weapons are available, their prices, and ammo limits.
* **Persistent Inventory (Optional):** Can integrate with your `SaveWeapon` mod to ensure purchased weapons are saved upon logout.
* **Shop Locations/System:** May offer physical shop locations in the map, a menu-based shop accessible anywhere, or both.
* **Economic Integration:** Direct use of your server's in-game currency for transactions.
* **Player Progression:** Allows players to upgrade their arsenal as they accumulate wealth.

---

## **Technologies Used**

The **Weapon-Shop** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA GUI/Element Functions:** Utilizes MTA's built-in functions for creating shop interfaces and managing player inventories.
* **Database (Implied):** If custom shop inventories or specific player purchase histories are saved, it may interact with a server-side database (e.g., XML file, MySQL).

---

## **Installation Guide**

To install the **Weapon-Shop** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Weapon-Shop** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Weapon-Shop** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Weapon-Shop** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Weapon-Shop** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Weapon-Shop" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Weapon-Shop`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Usage!_****

    * The **Weapon-Shop** mod requires specific ACL permissions for players to buy weapons and for the mod itself to manage items and money.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For Player Commands/Shop Access:** Players will need permission to access the shop interface or use commands to buy weapons (e.g., `/buyweapon`, `/shop`). This should be granted to the `Default` ACL or the main player group (e.g., `AraB_GuesT`).
        * **Check the `Weapon-Shop` mod's server-side Lua files and `meta.xml` for the precise command/function handler names.**
        * **Example (assuming a player command `buyweapon`):**
            ```xml
            <acl name="Default">
                <!-- ... other rights ... -->
                <right name="command.buyweapon" access="true"></right>
                <!-- ... add other player-facing shop commands here ... -->
            </acl>
            ```

    * **Permissions for the Mod (Server-Side for Transactions):** The `Weapon-Shop` resource itself will need ACL rights to:
        * Give weapons: `function.givePlayerWeapon`
        * Take money: `function.setPlayerMoney` (to deduct the cost).
        * Potentially remove current weapons: `function.takeWeapon` (if buying a new weapon replaces an old one).

        * Your provided `acl.xml` lists `resource.D1_Weapon-Shop` under the `Admin` group, which is good for general control over the resource itself. **However, the resource itself needs the specific function rights to manage player items and money.** You will need to ensure the `Admin` ACL (or an `autoACL` associated with `Weapon-Shop`) has these necessary function rights set to `access="true"`.
        * **Example (critical for shop functionality):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="function.givePlayerWeapon" access="true"></right>
                <right name="function.setPlayerMoney" access="true"></right>
                <right name="function.takeWeapon" access="true"></right>
                <!-- ... add other necessary functions here ... -->
            </acl>
            ```

    * **For Admin/Moderator Commands (Optional):** If the **Weapon-Shop** includes commands for administrators to manage shop inventory or prices (e.g., `/addshopweapon`, `/setweaponprice`), these should be granted to admin ACLs (e.g., `Admin`).
        * **Example (assuming admin command `addshopweapon`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.addshopweapon" access="true"></right>
                <!-- ... add other admin shop commands here ... -->
            </acl>
            ```

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Weapon-Shop Mod Settings (Crucial for Customization):**

    * Check the **Weapon-Shop** folder for a configuration file (e.g., `config.lua`, `weapons.xml`, or `settings.xml`). This file will be crucial for defining your shop's inventory and prices.

    * If a config file exists, you **must** customize settings such as:
        * **`availableWeapons`**: A table or list defining each weapon model, its cost, and ammunition price.
        * **`shopLocations`**: (If physical shops) Coordinates of the shop areas.
        * **`requiredLevel`**: (If integrating with `LevelSystem`) The minimum level required to buy certain weapons.
        * **`messages`**: Custom messages for purchases, insufficient funds, etc.
        * **`currencyType`**: What type of in-game money is used (e.g., `ZombieMoney`).

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Weapon-Shop** mod should now be active, providing players with essential weaponry for survival!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Weapon-Shop** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Weapon-Shop** mod, please open an issue on this repository.
