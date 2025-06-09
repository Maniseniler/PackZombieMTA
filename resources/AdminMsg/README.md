# AdminMsg Mod for MTA:SA 📢

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)
[![Language: Xml](https://img.shields.io/badge/Language-XML-orange?logo=xml)](https://www.xml.com/)

---

## **Description**

The **AdminMsg** mod is an essential administrative tool for your Multi Theft Auto: San Andreas server. It provides a dedicated and clear way for server administrators or authorized personnel to send important messages or announcements to all players on the server.

This mod ensures that critical information, server rules, event updates, or urgent warnings can be delivered effectively and stand out from regular chat, making it a vital component for server communication and management, especially in a dynamic environment like your zombie apocalypse server.

---

## **Features**

* **Server-Wide Announcements:** Allows authorized users to broadcast messages visible to all players.
* **Distinct Messaging:** Messages sent via AdminMsg are typically formatted differently (e.g., a special prefix or color) to distinguish them from standard chat.
* **Easy-to-Use Command:** Access messages via a simple, intuitive in-game command.
* **Permission-Based Access:** Only users with appropriate ACL permissions can use this tool, ensuring controlled communication.

---

## **Technologies Used**

The **AdminMsg** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.

---

## **Installation Guide**

To install the **AdminMsg** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **AdminMsg** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **AdminMsg** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **AdminMsg** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **AdminMsg** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="AdminMsg" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start AdminMsg`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Usage!_****

    * For administrators or other authorized personnel to use the **AdminMsg** command, you **must** grant them appropriate permissions in your `acl.xml` file.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * Identify the ACL group you want to grant this permission to (e.g., `Admin`, `SuperModerator`, or a custom admin group like `Programing Of ServeR`).

    * You will need to add a `<right>` entry for the **AdminMsg** command. The exact command name depends on how you implemented it in the mod's script (e.g., `command.adminmsg`, `command.sayadmin`, or simply `command.msg`). **Please check your `AdminMsg` mod's server-side Lua file for the precise command handler name.**

    * **Example (assuming the command is `adminmsg`):**
        ```xml
        <acl name="Admin">
            <!-- ... other rights ... -->
            <right name="command.adminmsg" access="true"></right>
            <!-- ... other rights ... -->
        </acl>
        ```

    * **Regarding the `Mani` User:**
        * Your provided `acl.xml` already has a dedicated group `<group name="AdminMsg">` which includes `<object name="user.Mani"></object>`. This indicates `Mani` already has access via this group.
        * If you want other users to have access, you need to add their usernames to this group or grant the `AdminMsg` command permission to other existing admin groups.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **AdminMsg** mod should now be active, allowing authorized users to send server-wide announcements!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **AdminMsg** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **AdminMsg** mod, please open an issue on this repository.
