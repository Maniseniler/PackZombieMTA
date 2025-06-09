# FA3LYAT Mod for MTA:SA 🎤📣

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **FA3LYAT** mod introduces a specialized new chat system to your Multi Theft Auto: San Andreas server, designed for **broadcasting announcements and managing server-wide events** under the control of a dedicated **FA3LYAT role**. This mod is perfect for server administrators or designated event organizers to communicate important information, start competitions, announce activities, or deliver key messages to all players in a distinct and authoritative manner.

Unlike regular chat, **FA3LYAT** provides a controlled channel for official communications, ensuring that vital announcements cut through the general chatter. This is particularly useful for orchestrating events, providing updates during dynamic scenarios, and enhancing overall server management in your zombie apocalypse environment.

---

## **Features**

* **Dedicated Broadcast System:** A specialized chat system specifically for server-wide announcements and event communications.
* **Role-Based Control:** Only users assigned to the designated **FA3LYAT role** (or other configured administrative roles) can utilize this broadcasting system.
* **Distinct Messaging:** Messages sent via **FA3LYAT** are typically formatted uniquely (e.g., special color, prefix, or message box) to ensure they are easily noticeable by all players.
* **Event Management:** Designed to facilitate the smooth operation and announcement of server events, competitions, or other activities.
* **Controlled Communication:** Provides a clear channel for authorized personnel to disseminate important information without general player interference.

---

## **Technologies Used**

The **FA3LYAT** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.

---

## **Installation Guide**

To install the **FA3LYAT** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **FA3LYAT** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **FA3LYAT** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **FA3LYAT** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **FA3LYAT** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="FA3LYAT" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start FA3LYAT`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Usage!_****

    * For users to be able to broadcast messages using the **FA3LYAT** system, you **must** grant them appropriate permissions in your `acl.xml` file. This typically involves giving a specific command right to a designated role.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * Identify the ACL group(s) you want to grant this permission to (e.g., `Admin`, `SuperModerator`, or a specific custom group like `FA3LYAT` if you create one).

    * You will need to add a `<right>` entry for the **FA3LYAT** command. The exact command name depends on how you implemented it in the mod's script (e.g., `command.fa3lyatmsg`, `command.broadcastfa3lyat`, etc.). **Please check your `FA3LYAT` mod's server-side Lua file for the precise command handler name.**

    * **Example (assuming the command is `fa3lyatmsg`):**
        ```xml
        <acl name="Admin">
            <!-- ... other rights ... -->
            <right name="command.fa3lyatmsg" access="true"></right>
            <!-- ... other rights ... -->
        </acl>
        ```

    * **Regarding the `Mani` User:**
        * Your provided `acl.xml` already has a dedicated group `<group name="FA3LYAT">` which includes `<object name="user.Mani"></object>`. This indicates `Mani` already has access to this group. You will need to ensure that the `FA3LYAT` ACL has the necessary command right to perform the broadcasting.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure FA3LYAT Mod Settings (Optional):**

    * Check the **FA3LYAT** folder for any configuration files (e.g., `config.lua` or `settings.xml`).

    * If a config file exists, you may be able to customize various aspects such as:
        * The prefix or color of **FA3LYAT** messages.
        * Whether messages appear in a special GUI element or standard chat.
        * Cooldowns for broadcasting.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **FA3LYAT** mod should now be active, allowing authorized users to broadcast important messages and manage events!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **FA3LYAT** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **FA3LYAT** mod, please open an issue on this repository.
