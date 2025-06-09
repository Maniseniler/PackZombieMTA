# guimessages Mod for MTA:SA 🖼️📢

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **guimessages** mod is a client-side resource for your Multi Theft Auto: San Andreas server, designed to display **important server messages and notifications using graphical user interface (GUI) elements** rather than standard chat messages. This allows for more prominent, customizable, and visually engaging announcements that can appear as on-screen pop-ups, banners, or dedicated message boxes.

In your zombie apocalypse server, **guimessages** can be incredibly effective for:
* Broadcasting critical information like event starts, safe zone warnings, or major server updates.
* Displaying achievement notifications or quest updates.
* Presenting interactive menus or alerts.
* Ensuring that vital communications capture player attention more effectively than simple chat.

It significantly enhances server-to-player communication and user experience.

---

## **Features**

* **GUI-Based Message Display:** Presents server messages using custom on-screen GUI elements.
* **Visually Distinct Notifications:** Messages stand out from regular chat, ensuring higher visibility.
* **Customizable Appearance:** Configure the size, position, colors, fonts, and background of message boxes.
* **Dynamic Content:** Messages can be dynamic, displaying player names, scores, or other real-time data.
* **Timed Display (Optional):** Messages can automatically fade out after a set duration.
* **Admin-Triggered Messages:** Allows administrators to send custom GUI messages on demand.

---

## **Technologies Used**

The **guimessages** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Client-Side GUI Functions:** Utilizes MTA's built-in functions for creating, drawing, and managing GUI elements (windows, labels, buttons, etc.).

---

## **Installation Guide**

To install the **guimessages** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **guimessages** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **guimessages** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **guimessages** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **guimessages** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="guimessages" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start guimessages`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Admin Control!_****

    * The **guimessages** mod will require specific ACL permissions if it includes commands for administrators to send or manage GUI messages.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For Admin Commands:** If the **guimessages** mod includes commands for administrators to send a custom GUI message (e.g., `/sendguimsg`, `/alertall`), these commands should be granted to admin ACLs (e.g., `Admin`, `SuperModerator`).
        * **Check the `guimessages` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
        * **Example (assuming an admin command `sendguimsg`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.sendguimsg" access="true"></right>
                <!-- ... add other admin GUI message commands here ... -->
            </acl>
            ```
        * Your provided `acl.xml` will need to be updated to reflect any such commands if they are present in your code.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure guimessages Mod Settings (Optional):**

    * Check the **guimessages** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file will be crucial for defining the appearance and behavior of your GUI messages.

    * If a config file exists, you may be able to adjust settings such as:
        * **`defaultFormat`**: Default fonts, colors, and sizes for GUI messages.
        * **`messageTypes`**: Define different styles for various message types (e.g., error, success, warning).
        * **`displayDuration`**: How long messages remain on screen.
        * **`animation`**: Entrance/exit animations for message boxes.
        * **`predefinedMessages`**: A list of messages that can be easily triggered.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **guimessages** mod should now be active, enhancing your server's communication with dynamic GUI messages!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **guimessages** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **guimessages** mod, please open an issue on this repository.
