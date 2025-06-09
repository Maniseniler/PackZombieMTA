# House Mod for MTA:SA 🏠🔑

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **House** mod introduces a fundamental and highly engaging **player housing system** to your Multi Theft Auto: San Andreas server. This mod allows players to purchase, own, and customize properties within the game world, providing them with a personal base of operations, a secure storage location, and a persistent stake in the server's economy.

In a zombie apocalypse setting, owning a house can be crucial for survival, offering a safe haven from threats, a place to store valuable loot (perhaps from your `ZombieMoney` and `SaveWeapon` mods), and a sense of belonging. The **House** mod enriches the role-playing aspects of your server and gives players a tangible goal to work towards.

---

## **Features**

* **Property Ownership:** Players can purchase available houses using in-game currency.
* **Secure Storage:** Houses provide a safe place to store items, protected from other players.
* **Customization (Optional):** May include options for interior decoration, furniture, or exterior modifications.
* **Persistent Data:** House ownership and contents are saved, persisting across server restarts and player sessions.
* **Economic Integration:** Links directly into the server's economy (e.g., buying, selling, or paying taxes on houses).
* **Access Control:** Owners can manage who has access to their property (e.g., friends, team members).

---

## **Technologies Used**

The **House** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **Database (Implied):** Likely interacts with a server-side database (e.g., XML file, MySQL) to store house ownership, interior states, and stored items.

---

## **Installation Guide**

To install the **House** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **House** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **House** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **House** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **House** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="House" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start House`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Usage!_****

    * For players to interact with the **House** system (e.g., buying, selling, entering, storing items), you **must** grant them appropriate permissions in your `acl.xml` file. This often involves granting access to specific commands.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For General Player Commands:** Identify the commands used for house interaction (e.g., `command.buyhouse`, `command.sellhouse`, `command.enterhouse`, `command.storeitem`, `command.housemenu`). These should be granted to the `Default` ACL or the main player group (e.g., `AraB_GuesT`).
        * **Check the `House` mod's server-side Lua files and `meta.xml` for the precise command handler names.**
        * **Example (assuming basic commands exist):**
            ```xml
            <acl name="Default">
                <!-- ... other rights ... -->
                <right name="command.buyhouse" access="true"></right>
                <right name="command.sellhouse" access="true"></right>
                <right name="command.enterhouse" access="true"></right>
                <!-- ... add other player house commands here ... -->
            </acl>
            ```

    * **For Admin-Specific Commands (Optional):** If the **House** mod includes commands for administrators to manage houses (e.g., `command.forcebuyhouse`, `command.deletehouse`, `command.sethouseprice`), these should be granted to admin ACLs (e.g., `Admin`).
        * **Example (assuming an admin command `sethouseprice`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.sethouseprice" access="true"></right>
                <!-- ... other rights ... -->
            </acl>
            ```

    * **Regarding the `Mani` User:**
        * Your provided `acl.xml` already lists `resource.D1_House` under the `Admin` group, giving administrators control over the resource itself.
        * Additionally, there's a specific group `<group name="House">` which includes `<object name="user.Mani"></object>`. Ensure this group, or another group `Mani` is part of, has the necessary command rights for managing houses.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure House Mod Settings (Crucial for Customization):**

    * Check the **House** folder for a configuration file (e.g., `config.lua`, `houses.xml`, or `settings.xml`). This file will be essential for setting up available properties, prices, and other features.

    * If a config file exists, you **must** customize settings such as:
        * **Defining Houses:** Locations (coordinates), interiors, and default items for each purchasable house.
        * **Prices:** The cost for each house.
        * **Storage Limits:** Capacity for items within a house.
        * **Ownership Limits:** Whether a player can own multiple houses.
        * **Tax/Rent System:** (If applicable) Configuration for recurring costs.
        * **Messages:** Custom messages for buying/selling/entering houses.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **House** mod should now be active, allowing players to establish their own safe havens!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **House** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **House** mod, please open an issue on this repository.
