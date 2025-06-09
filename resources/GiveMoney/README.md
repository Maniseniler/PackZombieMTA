# GiveMoney Mod for MTA:SA 💸

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **GiveMoney** mod is a powerful administrative tool for your Multi Theft Auto: San Andreas server, designed to allow authorized personnel to **grant in-game currency to specific players**. This mod is essential for server economy management, rewarding players, compensating for issues, or conducting server-side events that involve monetary distribution.

In a server with an active economy, like your zombie apocalypse mod pack where `ZombieMoney` is earned, the **GiveMoney** mod provides flexible control over currency flow, ensuring administrators can maintain economic balance and facilitate various gameplay scenarios or player support actions.

---

## **Features**

* **Direct Money Transfer:** Allows authorized users to give a specified amount of money to any player on the server.
* **Targeted Distribution:** Funds can be given to individual players, or potentially to multiple players at once depending on implementation.
* **Server Economy Management:** Enables administrators to directly influence the in-game economy for balance or rewards.
* **Command-Based Operation:** Utilizes a simple in-game command for ease of use by authorized staff.
* **Logging (Optional):** May include logging of money transactions for auditing purposes.

---

## **Technologies Used**

The **GiveMoney** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.

---

## **Installation Guide**

To install the **GiveMoney** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **GiveMoney** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **GiveMoney** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **GiveMoney** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **GiveMoney** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="GiveMoney" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start GiveMoney`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Usage!_****

    * For administrators or other authorized personnel to use the **GiveMoney** command, you **must** grant them appropriate permissions in your `acl.xml` file.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * Identify the ACL group(s) you want to grant this permission to (e.g., `Admin`, `SuperModerator`, or a custom administrative group).

    * You will need to add a `<right>` entry for the **GiveMoney** command. The exact command name depends on how you implemented it in the mod's script (e.g., `command.givemoney`, `command.addmoney`, etc.). **Please check your `GiveMoney` mod's server-side Lua file for the precise command handler name and required arguments.**

    * **Example (assuming the command is `givemoney`):**
        ```xml
        <acl name="Admin">
            <!-- ... other rights ... -->
            <right name="command.givemoney" access="true"></right>
            <!-- ... other rights ... -->
        </acl>
        ```

    * **Regarding the `Mani` User:**
        * Your provided `acl.xml` already lists `resource.D1_GiveMoney` under the `Admin` group, which means administrators (and potentially `Mani` if they are in that group) will have control over the resource itself. Ensure the `Admin` ACL (or other relevant admin ACLs) has the command right to execute the `givemoney` function.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure GiveMoney Mod Settings (Optional):**

    * Check the **GiveMoney** folder for any configuration files (e.g., `config.lua` or `settings.xml`).

    * If a config file exists, you may be able to customize aspects such as:
        * Minimum/maximum amounts that can be given.
        * Messages displayed upon successful money transfer.
        * Any logging features for transactions.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **GiveMoney** mod should now be active, allowing authorized users to manage in-game currency!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **GiveMoney** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **GiveMoney** mod, please open an issue on this repository.
