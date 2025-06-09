# AFK Mod for MTA:SA 😴

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)
[![Language: Xml](https://img.shields.io/badge/Language-XML-orange?logo=xml)](https://www.xml.com/)

---

## **Description**

The **AFK** mod is a simple yet effective resource for your Multi Theft Auto: San Andreas server. It helps manage inactive players by detecting when they are **Away From Keyboard (AFK)** for a configurable period. This can be useful for:

* **Server Cleanup:** Automatically kicking or moving truly inactive players to a spectator mode to free up player slots and optimize server performance.

* **Player Awareness:** Notifying other players when someone is AFK, preventing confusion in team-based scenarios or when waiting for a response.

* **Resource Management:** Potentially reducing server load by identifying and managing idle connections.

This mod is designed to integrate seamlessly into your existing server environment, providing better player management and contributing to overall server health.

---

## **Features**

* **Automatic AFK Detection:** Automatically identifies players who have been inactive (no input, movement, or chat) for a specified duration.

* **Configurable Timeout:** Easily adjust the amount of time (in seconds) before a player is marked as AFK.

* **(Optional) AFK Message:** Broadcasts a customizable message to the server or directly to the AFK player when their status changes.

* **(Optional) Automatic Action on AFK:** Configurable actions, such as automatically moving the player to spectator mode or kicking them from the server after a prolonged period of inactivity.

---

## **Technologies Used**

The **AFK** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.

---

## **Installation Guide**

To install the **AFK** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **AFK** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **AFK** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **AFK** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **AFK** mod starts automatically every time your server launches, add the following line within the `<server>` tags:

        ```xml
        <resource src="AFK" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start AFK`**.

5.  **Configure AFK Mod Settings (Optional - if applicable):**

    * The **AFK** mod may include a dedicated configuration file (often named **config.lua** or a section within **meta.xml** inside the **AFK** folder) where you can customize its behavior.

    * **Please check the AFK mod's folder for such a file to adjust settings like:**

        * `afkTimeout`: The number of seconds a player must be inactive before being marked AFK.

        * `kickAfterAFK`: A boolean (`true`/`false`) to enable or disable automatically kicking AFK players.

        * `movePlayerToSpectator`: A boolean (`true`/`false`) to enable or disable moving AFK players to spectator mode.

        * `afkMessage`: The custom message displayed when a player goes AFK.

    * If no explicit configuration file is found, the mod's behavior is likely hardcoded with default values.

6.  **Configure ACL (Access Control List) - (If Specific Permissions are Needed):**

    * For the core functionality of the **AFK** mod (detecting and handling AFK players), specific ACL entries are typically *not* required.

    * However, if this mod includes any special **admin commands** for managing AFK status (e.g., a command to manually set or clear someone's AFK status, or to override AFK detection), you would need to ensure the appropriate administrative groups have access to those commands in your **acl.xml** file.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **AFK** mod should now be active, silently monitoring player activity and managing AFK players according to your configurations!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **AFK** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for full details.

---

## **Contact**

For any questions, support, or further assistance regarding the **AFK** mod, please open an issue on this repository.
