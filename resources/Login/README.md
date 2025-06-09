# Login Mod for MTA:SA 🚪🔐

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Login** mod is a foundational resource for your Multi Theft Auto: San Andreas server, providing a robust **player authentication and account management system**. This mod ensures that players can securely register, log in, and access their persistent data (such as levels, money, saved weapons, and house ownership from your other mods) across different play sessions.

In a persistent world like your zombie apocalypse server, a reliable login system is critical. It provides a secure way to identify players, load their unique progress, and maintain a consistent gameplay experience, fostering player loyalty and ensuring that their hard-earned achievements are saved and accessible.

---

## **Features**

* **Player Account Creation:** Allows new players to register a unique account with a username and password.
* **Secure Player Authentication:** Requires players to log in upon joining the server to access their saved progress.
* **Persistent Player Data Linkage:** Connects player accounts to their in-game data (levels, money, inventory, property, etc.), ensuring continuity.
* **Password Protection:** Safeguards player accounts with secure password handling.
* **Admin Account Management:** Provides administrators with tools to manage player accounts (e.g., reset passwords, delete accounts, change groups).
* **Automatic Login (Optional):** May include features for remembering login details for convenience.

---

## **Technologies Used**

The **Login** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **Database (Crucial):** This mod *critically* relies on a server-side database (e.g., XML file, MySQL, SQLite) to store player account information (usernames, hashed passwords, linked player IDs, etc.) and persistent data.

---

## **Installation Guide**

To install the **Login** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Login** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Login** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Login** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Login** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Login" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Login`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Operation & Admin Management!_****

    * The **Login** mod requires significant ACL permissions to function correctly, particularly for creating and managing player accounts.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **Permissions for the Mod (Server-Side):** The `Login` resource itself will need rights to:
        * Add new accounts: `function.addAccount`
        * Remove accounts: `function.removeAccount`
        * Set account passwords: `function.setAccountPassword`
        * Potentially `function.setPlayerAccount` or `function.setAccountData` if it handles custom account data.
        * Integrate with ACL groups: `function.aclGroupAddObject` (e.g., to automatically add new players to a 'Default' group).

        * Your `acl.xml` already lists `resource.D1_Login` under the `Admin` group. This is good as it grants administrators control over the resource itself. **However, the resource itself needs the specific function rights listed above to interact with MTA's account system.** You will need to ensure the `Admin` ACL (or an `autoACL` associated with `Login`) has these necessary function rights set to `access="true"`.

        * **Example (critical for core Login functionality):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="function.addAccount" access="true"></right>
                <right name="function.removeAccount" access="true"></right>
                <right name="function.setAccountPassword" access="true"></right>
                <right name="function.aclGroupAddObject" access="true"></right>
                <!-- ... add other account-related functions here if your mod uses them ... -->
            </acl>
            ```

    * **Permissions for Players (Optional Commands):** If the **Login** mod includes player-facing commands (e.g., `/register`, `/login`, `/changepass`), these might need `command` rights granted to the `Default` ACL or player groups (e.g., `command.login`, `command.register`).
        * **Check the `Login` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Login Mod Settings (Crucial for Customization):**

    * Check the **Login** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file will be crucial for defining login behavior and database connection.

    * If a config file exists, you **must** customize settings such as:
        * **Database Connection Details:** (If using MySQL or external DB) Host, username, password, database name.
        * **`defaultPlayerGroup`**: The ACL group new players are automatically added to upon registration.
        * **`minPasswordLength` / `maxPasswordLength`**: Constraints for player passwords.
        * **`loginRequired`**: Whether players are forced to log in to play.
        * **`welcomeMessage` / `loginSuccessMessage`**: Custom messages for players.

7.  **Set up Database (If Applicable):**

    * If your **Login** mod uses an external database (e.g., MySQL), ensure you have a database server set up and correctly configured according to the mod's requirements. You may need to import an SQL schema provided with the mod.

8.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Login** mod should now be active, providing secure account management for your players!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Login** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Login** mod, please open an issue on this repository.
