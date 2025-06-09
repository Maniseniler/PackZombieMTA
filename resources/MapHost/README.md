# MapHost Mod for MTA:SA 🗺️🚀

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **MapHost** mod is a powerful resource for your Multi Theft Auto: San Andreas server, designed to provide flexible and dynamic **map management capabilities**. This mod allows authorized players or administrators to easily change the current map, start new maps, or even host custom maps from the server's resource pool.

In a dynamic server environment, especially one with diverse gameplay modes like your zombie apocalypse server (which might feature different survival maps or event maps), **MapHost** ensures that the server can quickly adapt to player preferences or scheduled events. It enhances player interaction by potentially allowing map voting or direct map selection, keeping the gameplay fresh and engaging.

---

## **Features**

* **Dynamic Map Changing:** Allows administrators or authorized players to switch maps instantly.
* **Map Selection/Voting:** May include a system for players to vote on the next map or select from a list.
* **Custom Map Hosting:** Enables loading and starting of any map resource available on the server.
* **Ease of Use:** Provides simple in-game commands for map management.
* **Integration with Game Modes:** Supports switching to maps suitable for specific game modes or events (like your zombie survival maps).

---

## **Technologies Used**

The **MapHost** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Resource Management Functions:** Utilizes MTA's built-in functions for starting, stopping, and managing resources.

---

## **Installation Guide**

To install the **MapHost** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **MapHost** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **MapHost** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **MapHost** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **MapHost** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="MapHost" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start MapHost`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Usage!_****

    * For players or administrators to use the **MapHost** functionality (e.g., changing maps, starting map votes), you **must** grant them appropriate permissions in your `acl.xml` file.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For Commands to Change/Host Maps:** Identify the commands used by **MapHost** (e.g., `command.changemaphost`, `command.loadmap`, `command.votemap`). These commands should be granted to administrators or specific map-managing roles (e.g., `Admin`, `Moderator`, or a custom `MapHost` group).
        * **Check the `MapHost` mod's server-side Lua files and `meta.xml` for the precise command handler names.**
        * **Example (assuming commands `changemaphost` and `votemap`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.changemaphost" access="true"></right>
                <right name="command.votemap" access="true"></right>
                <!-- ... other map host commands here ... -->
            </acl>
            ```

    * **Permissions for the Mod (Server-Side):** The `MapHost` resource itself will need rights to start and stop other resources (maps) to function. This typically means granting it `function.startResource` and `function.stopResource` rights.
        * Your `acl.xml` already lists `resource.D1_MapHost` under the `Admin` group. This is good as it grants administrators control over the resource itself. **However, the resource itself needs the specific function rights to manage other resources.** You will need to ensure the `Admin` ACL (or an `autoACL` associated with `MapHost`) has these necessary function rights set to `access="true"`.
        * **Example (critical for map loading):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="function.startResource" access="true"></right>
                <right name="function.stopResource" access="true"></right>
                <!-- ... other resource management functions if needed ... -->
            </acl>
            ```

    * **Regarding the `Mani` User:**
        * Your provided `acl.xml` lists `resource.D1_MapHost` under the `Admin` group. Ensure that the `Admin` ACL (or relevant admin ACLs) has the command rights to *use* the map hosting functions, and that `Mani` is part of a group that inherits these permissions.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure MapHost Mod Settings (Optional):**

    * Check the **MapHost** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file will allow you to customize various aspects of map hosting.

    * If a config file exists, you may be able to adjust settings such as:
        * List of available maps that can be hosted/voted on.
        * Default map rotation.
        * Voting timeout and minimum player count for votes.
        * Messages displayed when maps change or votes start.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **MapHost** mod should now be active, providing dynamic map management for your server!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **MapHost** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **MapHost** mod, please open an issue on this repository.
