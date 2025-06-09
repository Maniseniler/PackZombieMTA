# killmessages Mod for MTA:SA 💀🔫

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **killmessages** mod is a client-side resource for your Multi Theft Auto: San Andreas server, designed to provide **customizable, visually engaging notifications in the chat or on-screen whenever a player is killed**. This mod enhances the feedback loop for combat scenarios, clearly indicating who killed whom and with what weapon.

In a dynamic and action-packed environment like your zombie apocalypse server (which might involve both player-versus-player combat and player-versus-zombie combat), clear kill messages are crucial for player awareness, competitive tracking, and overall immersion. **killmessages** makes every elimination satisfying and easy to follow.

---

## **Features**

* **Customizable Kill Notifications:** Displays a message in chat or on screen whenever a player is killed by another player or a zombie.
* **Detailed Information:** Messages can include the killer's name, the victim's name, and the weapon used.
* **Visually Distinct:** Kill messages are often formatted uniquely (e.g., specific colors, icons, or text styling) to stand out.
* **Engaging Combat Feedback:** Enhances player satisfaction and awareness during combat.
* **Lightweight & Efficient:** Designed to run smoothly without impacting server or client performance.
* **Filtering (Optional):** May include options to filter messages (e.g., only show player-on-player kills).

---

## **Technologies Used**

The **killmessages** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Client-Side & Server-Side Events:** Utilizes MTA's event system to detect player deaths and trigger message display on clients.

---

## **Installation Guide**

To install the **killmessages** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **killmessages** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **killmessages** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **killmessages** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **killmessages** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="killmessages" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start killmessages`**.

5.  **Configure killmessages Mod Settings (Optional):**

    * Check the **killmessages** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file might allow you to customize the message's appearance and content.

    * If a config file exists, you may be able to adjust settings such as:
        * **`messageFormat`**: The template for the kill message (e.g., "PlayerName killed VictimName with WeaponName!").
        * **`messageColor`**: The color of the kill message in chat.
        * **`displayMethod`**: Whether the message appears in standard chat, a custom GUI, or both.
        * **`showPvPKillsOnly`**: A boolean to display only player-on-player kills, excluding zombie kills.

6.  **Configure ACL (Access Control List) - (Generally Not Required):**

    * The **killmessages** mod is primarily a passive notification system. It generally does *not* require specific ACL entries for players to use it, as its function is to automatically display messages based on gameplay events.
    * If your **killmessages** mod includes any administrative commands (e.g., to toggle kill messages globally, or for debug purposes), those commands would need corresponding ACL entries for admin groups.
    * **Check the `killmessages` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
    * Your provided `acl.xml` lists `resource.killmessages` under the `Admin` group, which is good for general control over the resource itself.
    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **killmessages** mod should now be active, providing clear and engaging notifications for every kill!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **killmessages** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **killmessages** mod, please open an issue on this repository.
