# Chat Mod for MTA:SA 💬

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Chat** mod is a fundamental resource for your Multi Theft Auto: San Andreas server, enhancing and possibly customizing the in-game communication system. While MTA has a built-in chat, custom chat mods often introduce features like:

* **Customizable Formatting:** Different colors for names, messages, or specific chat channels.
* **Chat Channels:** Implementing global, local, team, or administrative chat channels.
* **Anti-Spam/Flood Protection:** Measures to prevent rapid, repetitive messages.
* **Message Filtering/Moderation:** Tools to filter out offensive language or manage chat content.
* **Display Enhancements:** Custom fonts, chat box size, or message timestamps.

This mod ensures that player communication is effective, organized, and contributes positively to the community experience on your zombie apocalypse server.

---

## **Features**

* **Custom Chat Interface:** Modify the appearance of in-game chat messages.
* **Chat Commands (Optional):** Introduce new commands for specific chat functionalities (e.g., `/pm` for private message, `/teamchat`).
* **Anti-Spam/Flood Control:** Automatic detection and prevention of chat spamming.
* **Message Moderation:** Tools for server staff to manage and clean up chat content.
* **Dynamic Chat Channels:** Potentially allows for different communication scopes (e.g., area-based chat, admin-only chat).

---

## **Technologies Used**

The **Chat** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.

---

## **Installation Guide**

To install the **Chat** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Chat** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Chat** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Chat** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Chat** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Chat" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Chat`**.

5.  **Configure Chat Mod Settings (Optional - if applicable):**

    * The **Chat** mod may include a dedicated configuration file (often named `config.lua` or a section within `meta.xml` inside the `Chat` folder) where you can customize its behavior.

    * **Please check the Chat mod's folder for such a file to adjust settings like:**

        * `chatColors`: Define custom colors for different message types or player groups.
        * `antiSpamDelay`: Set the minimum time between messages to prevent spamming.
        * `moderationKeywords`: List keywords to filter or flag in chat.
        * `defaultChannel`: Set the default chat channel for players.

    * If no explicit configuration file is found, the mod's behavior is likely hardcoded with default values.

6.  **Configure ACL (Access Control List) - (If Specific Permissions are Needed):**

    * For basic chat functionality (sending and receiving messages), typically no specific ACL changes are needed as these are inherent to MTA.
    * However, if your **Chat** mod introduces **admin-specific commands** (e.g., `/clearchat`, `/muteplayer`, `/chatban`) or **special chat channels** that require permissions (e.g., `command.adminchat`), then those commands/channels would need corresponding ACL entries.
    * **Check the `Chat` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
    * If a command is found (e.g., `command.clearchat`), you would add a `<right>` entry to the appropriate ACL group (e.g., `Admin`):
        ```xml
        <acl name="Admin">
            <!-- ... other rights ... -->
            <right name="command.clearchat" access="true"></right>
            <!-- ... other rights ... -->
        </acl>
        ```
    * Your provided `acl.xml` already lists `resource.D1_Chat` under the `Admin` group, which means administrators have full control over the resource itself.
    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Chat** mod should now be active, enhancing your server's communication system!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Chat** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Chat** mod, please open an issue on this repository.
