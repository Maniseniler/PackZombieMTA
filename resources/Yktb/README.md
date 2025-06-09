# Yktb Mod for MTA:SA ✍️💬

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Yktb** mod (likely short for "Yekteb" which means "he writes" or "typing" in Arabic) is a subtle yet effective client-side resource for your Multi Theft Auto: San Andreas server. Its primary function is to **display a "typing indicator"** next to a player's name when they are actively typing a message in the chat. This provides a visual cue to other players that a response is coming, enhancing the flow of communication and making interactions feel more natural.

In any multiplayer environment, including your zombie apocalypse server, knowing when someone is typing can prevent multiple people from speaking at once or reduce awkward silences, contributing to a smoother and more engaging chat experience.

---

## **Features**

* **Typing Indicator Display:** Shows a visual indicator (e.g., "...", "typing...", or a small icon) next to a player's name in chat or above their head when they are actively typing.
* **Real-time Feedback:** Provides instant feedback to other players about who is about to send a message.
* **Enhanced Communication Flow:** Improves the natural rhythm of in-game conversations.
* **Configurable Appearance (Optional):** May allow customization of the indicator's text, color, or visual style.
* **Lightweight:** Designed to run efficiently without noticeable performance impact.

---

## **Technologies Used**

The **Yktb** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Client-Side Events & GUI:** Utilizes MTA's client-side functions to detect keyboard input (for typing) and display the indicator on screen.

---

## **Installation Guide**

To install the **Yktb** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Yktb** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Yktb** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Yktb** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Yktb** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Yktb" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Yktb`**.

5.  **Configure Yktb Mod Settings (Optional):**

    * Check the **Yktb** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file might allow you to customize the appearance or behavior of the typing indicator.

    * If a config file exists, you may be able to adjust settings such as:
        * `indicatorText`: The actual text displayed (e.g., "typing...", "writing...").
        * `indicatorColor`: The color of the typing indicator.
        * `displayDuration`: How long the indicator shows after typing stops.
        * `displayMethod`: Whether it appears in chat, above head, or both.

6.  **Configure ACL (Access Control List) - (Generally Not Required):**

    * The **Yktb** mod is typically a client-side visual enhancement and generally does *not* require specific ACL entries for players to use it. Its function is passive and affects the display for all players.
    * If your **Yktb** mod includes any administrative commands (e.g., to toggle the indicator globally, or for debug purposes), those commands would need corresponding ACL entries for admin groups.
    * **Check the `Yktb` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
    * Your provided `acl.xml` lists `resource.D1_Yktb` under the `Admin` group, which is good for general control over the resource itself.
    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Yktb** mod should now be active, providing helpful typing indicators in chat!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Yktb** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Yktb** mod, please open an issue on this repository.
