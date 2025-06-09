# Updates Mod for MTA:SA 🔄✨

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Updates** mod is a crucial utility resource for your Multi Theft Auto: San Andreas server, designed to manage and notify players about **server-side resource updates**. This mod helps ensure that players are aware of the latest changes, bug fixes, or new features implemented on the server without needing to manually check forums or external sources.

This mod is vital for maintaining a healthy and actively developed server, especially for a dynamic project like your zombie apocalypse mod pack. It provides a direct communication channel for important server updates, fostering transparency and keeping your community informed about new content and improvements.

---

## **Features**

* **Server Update Notifications:** Inform players about recent changes, additions, or fixes to server resources/mods.
* **Version Control (Optional):** May display current server mod versions or track updates.
* **Direct In-Game Communication:** Deliver update information directly to players without them leaving the game.
* **Configurable Messages:** Customize the messages displayed for different types of updates.
* **Periodic Checks (Optional):** Can be configured to periodically check for new updates (if integrated with an external update source or internal versioning).
* **Admin Management:** Tools for administrators to push new update notifications or manage update logs.

---

## **Technologies Used**

The **Updates** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Chat/GUI Functions:** Utilizes MTA's built-in functions for displaying messages to players.

---

## **Installation Guide**

To install the **Updates** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Updates** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Updates** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Updates** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Updates** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Updates" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Updates`**.

5.  **Configure ACL (Access Control List) - (If Specific Permissions are Needed):**

    * The **Updates** mod typically works passively to display information. However, if it includes commands for administrators to manually trigger update notifications or manage update content, then ACL is crucial for those commands.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For Admin Commands:** If your **Updates** mod includes commands for administrators (e.g., `/announceupdate`, `/setversion`), these commands should be granted to admin ACLs (e.g., `Admin`, `SuperModerator`).
        * **Check the `Updates` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
        * **Example (assuming an admin command `announceupdate`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.announceupdate" access="true"></right>
                <!-- ... add other update management commands here ... -->
            </acl>
            ```
        * Your provided `acl.xml` lists `resource.D1_Updates` under the `Admin` group, which is good for general control over the resource itself.
        * Additionally, there's a specific group `<group name="Update">` which includes `<object name="user.Mani"></object>`. Ensure this group (and any other staff groups) has the necessary command rights for managing updates.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Updates Mod Settings (Crucial for Customization):**

    * Check the **Updates** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file will be crucial for defining your update messages.

    * If a config file exists, you **must** customize settings such as:
        * **`updateMessages`**: A table or list containing the actual update announcements (e.g., "Version 1.1 released: new weapons added!").
        * **`displayInterval`**: How often update messages are shown to players.
        * **`messageFormat`**: Customize the appearance (colors, prefixes) of update messages.
        * **`versionNumber`**: The current version number of your mod pack, if tracked by this mod.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Updates** mod should now be active, keeping your players informed about the latest server developments!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Updates** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Updates** mod, please open an issue on this repository.
