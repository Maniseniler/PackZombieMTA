# Support_System Mod for MTA:SA 🤝❓

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Support_System** mod is a crucial resource for your Multi Theft Auto: San Andreas server, designed to facilitate efficient and organized communication between players and server staff (administrators, moderators, or designated support personnel). This mod provides a structured way for players to request help, report issues, or ask questions, ensuring that their concerns are addressed promptly and effectively.

In a dynamic and potentially complex server environment like your zombie apocalypse mod pack, a reliable support system is essential for maintaining a positive community and ensuring smooth gameplay. **Support_System** allows staff to manage player queries, resolve problems, and provide assistance without cluttering public chat or relying solely on external communication channels.

---

## **Features**

* **Player Support Requests:** Allows players to submit tickets or requests for help directly in-game.
* **Staff Notification:** Notifies online staff members of new support requests.
* **Ticket Management:** Provides tools for staff to view, claim, respond to, and close support tickets.
* **Private Communication Channel:** Facilitates private communication between the player and the responding staff member.
* **Problem Reporting:** Enables players to report bugs, rule-breakers, or other issues.
* **Logging (Optional):** May include logging of support interactions for accountability and review.

---

## **Technologies Used**

The **Support_System** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA GUI Elements:** Likely uses MTA's built-in GUI functions for creating user interfaces for submitting and managing tickets.
* **Database (Implied):** May interact with a server-side database (e.g., XML file, MySQL) to store support tickets persistently.

---

## **Installation Guide**

To install the **Support_System** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Support_System** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Support_System** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Support_System** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Support_System** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Support_System" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Support_System`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Usage!_****

    * The **Support_System** mod requires specific ACL permissions for both players (to submit requests) and staff (to manage them).

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **Permissions for Players (Client-Side Command):** Players will need permission to use the command that opens the support request interface (e.g., `/support`, `/help`, `/ticket`). This command should be granted to the `Default` ACL or the main player group (e.g., `AraB_GuesT`).
        * **Check the `Support_System` mod's client-side and server-side Lua files and `meta.xml` for the precise command handler name.**
        * **Example (assuming the player command is `support`):**
            ```xml
            <acl name="Default">
                <!-- ... other rights ... -->
                <right name="command.support" access="true"></right>
                <!-- ... add other player-facing support commands here ... -->
            </acl>
            ```

    * **Permissions for Staff (Admin/Moderator Commands):** Staff members will need permissions to view, claim, respond to, and close support tickets. These commands should be granted to appropriate staff ACLs (e.g., `Admin`, `Moderator`, or a dedicated `SupportStaff` group).
        * **Example (assuming staff commands `viewtickets`, `claimticket`, `respondticket`, `closeticket`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.viewtickets" access="true"></right>
                <right name="command.claimticket" access="true"></right>
                <right name="command.respondticket" access="true"></right>
                <right name="command.closeticket" access="true"></right>
                <!-- ... add other staff support commands here ... -->
            </acl>
            ```
        * Your provided `acl.xml` lists `resource.D1_Support_System` under the `Admin` group, which is good for general control over the resource itself.
        * Additionally, there's a specific group `<group name="Support">` which includes `<object name="user.Mani"></object>`. Ensure this `Support` group (and any other staff groups) has the necessary command rights for managing support tickets.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Support_System Mod Settings (Optional):**

    * Check the **Support_System** folder for any configuration files (e.g., `config.lua` or `settings.xml`).

    * If a config file exists, you may be able to customize various aspects such as:
        * Messages displayed to players and staff.
        * Notification sounds or pop-ups for new tickets.
        * Maximum number of open tickets per player.
        * Whether to store ticket history persistently.
        * Designated staff groups to receive notifications.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Support_System** mod should now be active, providing a dedicated channel for player support!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Support_System** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Support_System** mod, please open an issue on this repository.
