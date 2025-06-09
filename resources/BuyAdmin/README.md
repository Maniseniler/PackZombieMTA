# BuyAdmin Mod for MTA:SA 💰👑

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **BuyAdmin** mod introduces a unique and intriguing feature to your Multi Theft Auto: San Andreas server, allowing players to **purchase administrative privileges or special admin-like tools** using in-game currency. This can be a compelling way to incentivize gameplay, reward active players, or create a distinct tier of server roles within your zombie apocalypse environment.

This mod offers a dynamic approach to server management and player progression. It transforms administrative access from a purely static assignment into an achievable in-game goal, adding a layer of economic depth and aspiration for your players.

---

## **Features**

* **In-Game Admin Purchase:** Allows players to spend earned in-game currency (e.g., `ZombieMoney`) to acquire admin ranks or specific admin tools.
* **Configurable Pricing & Ranks:** Server owners can set the cost for different tiers of admin access or individual admin commands.
* **Automated Permission Granting:** Integrates with MTA's ACL system to automatically grant permissions upon successful purchase.
* **Exclusive Content (Optional):** Can be used to unlock specific administrative commands or special features that only purchased admins can access.
* **Economic Sink:** Provides a valuable way for players to spend their accumulated in-game wealth.

---

## **Technologies Used**

The **BuyAdmin** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.

---

## **Installation Guide**

To install the **BuyAdmin** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **BuyAdmin** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **BuyAdmin** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **BuyAdmin** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **BuyAdmin** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="BuyAdmin" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start BuyAdmin`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Operation!_****

    * The **BuyAdmin** mod will require specific ACL permissions to function correctly, both for players to initiate the purchase and for the mod itself to modify player permissions (granting admin rights).

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **Permissions for the Mod (Server-Side):** The `BuyAdmin` mod itself will need the ability to modify ACLs for players. This typically means granting it the `function.aclGroupAddObject` and `function.aclGroupRemoveObject` (if it supports revoking access) rights, and potentially `function.aclSetRight` or `function.addAccount` if it creates new accounts or sets specific command rights.

        * Your `acl.xml` already lists `resource.D1_BuyAdmin` under the `Admin` group. This is good as it grants administrators control over the resource itself. **However, the resource itself needs rights to modify ACLs.** You will need to create an `autoACL` for the `BuyAdmin` resource or add the necessary ACL modification functions to the `Admin` ACL that the `BuyAdmin` resource inherits.

        * **Example (critical for the mod to grant rights):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="function.aclGroupAddObject" access="true"></right>
                <right name="function.aclGroupRemoveObject" access="true"></right>
                <right name="function.aclSetRight" access="true"></right>
                <!-- ... other rights ... -->
            </acl>
            ```
            *(Ensure these functions are set to `access="true"` within the ACL that the `BuyAdmin` resource implicitly or explicitly uses to perform its permission granting actions.)*

    * **Permissions for Players (Client-Side Command):** Players will need permission to use the command that initiates the purchase. **Check your `BuyAdmin` mod's server-side Lua file for the precise command handler name (e.g., `/buyadmin`, `/purchaseadmin`).**

        * **Example (assuming the command is `buyadmin`):**
            ```xml
            <acl name="Default"> <!-- Or a specific group like 'Vip' if only certain players can buy -->
                <!-- ... other rights ... -->
                <right name="command.buyadmin" access="true"></right>
                <!-- ... other rights ... -->
            </acl>
            ```

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure BuyAdmin Mod Settings:**

    * Check the `BuyAdmin` folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file will be crucial for setting up the mod.

    * If a config file exists, you will need to customize settings such as:
        * **`price`**: The cost of purchasing admin access or a specific admin tool.
        * **`adminGroupToGrant`**: The name of the ACL group (e.g., "Admin", "Vip_Admin") that players will be added to upon purchase.
        * **`purchasableCommands`**: A list of specific commands that can be bought individually, along with their prices.
        * **`successMessage` / `errorMessage`**: Messages displayed to the player upon successful or failed purchase.
        * **`currencyType`**: What type of in-game money is used (e.g., from your `ZombieMoney` mod).

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **BuyAdmin** mod should now be active, allowing players to purchase admin privileges according to your configurations!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **BuyAdmin** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **BuyAdmin** mod, please open an issue on this repository.
