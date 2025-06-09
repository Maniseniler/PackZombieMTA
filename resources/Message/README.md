# Message Mod for MTA:SA ✉️🗣️

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Message** mod introduces a dedicated **private direct messaging (DM) system** to your Multi Theft Auto: San Andreas server. This mod allows players to communicate directly with each other, one-on-one, without their conversations being visible to the entire server chat. This is crucial for private discussions, coordinating strategies, or simply chatting discreetly with friends.

In a dynamic and often intense environment like your zombie apocalypse server, a private messaging system enhances player interaction, enables confidential communication, and contributes to a more personal and connected community experience.

---

## **Features**

* **Private Direct Messaging:** Send and receive messages privately between individual players.
* **Discreet Communication:** Conversations are hidden from public chat, ensuring privacy.
* **Easy-to-Use Commands:** Typically involves simple commands like `/pm [player_name] [message]` or `/reply`.
* **Player-to-Player Interaction:** Fosters direct communication and coordination among players.
* **Message History (Optional):** May include a feature to view recent private messages.
* **Notifications:** Inform players when they receive a new private message.

---

## **Technologies Used**

The **Message** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Chat & Event System:** Integrates with MTA's built-in chat functionalities and event handlers for message processing.

---

## **Installation Guide**

To install the **Message** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Message** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Message** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Message** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Message** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Message" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Message`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Usage!_****

    * For players to send and receive private messages using the **Message** mod, you **must** grant them appropriate permissions in your `acl.xml` file. This typically involves granting access to the private message command(s).

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For General Player Commands:** Identify the command(s) used for private messaging (e.g., `command.pm`, `command.msg`, `command.tell`, `command.reply`). These commands should be granted to the `Default` ACL or the main player group (e.g., `AraB_GuesT`).
        * **Check the `Message` mod's server-side Lua files and `meta.xml` for the precise command handler names.**
        * **Example (assuming primary command is `pm` and reply command is `reply`):**
            ```xml
            <acl name="Default">
                <!-- ... other rights ... -->
                <right name="command.pm" access="true"></right>
                <right name="command.reply" access="true"></right>
                <!-- ... add other player message commands here ... -->
            </acl>
            ```

    * **For Admin-Specific Commands (Optional):** If the **Message** mod includes commands for administrators (e.g., to view private messages, block private messages for a player), these should be granted to admin ACLs (e.g., `Admin`).
        * **Example (assuming an admin command `viewpm`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.viewpm" access="true"></right>
                <!-- ... other rights ... -->
            </acl>
            ```

    * **Regarding the `Mani` User:**
        * Your provided `acl.xml` lists `resource.D1_Message` under the `Admin` group, giving administrators control over the resource itself.
        * Additionally, there's a specific group `<group name="NewMsg">` which includes `<object name="user.Mani"></object>`. If this group is specifically for messaging features for `Mani`, ensure it has the necessary command rights for the private message commands.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Message Mod Settings (Optional):**

    * Check the **Message** folder for any configuration files (e.g., `config.lua` or `settings.xml`).

    * If a config file exists, you may be able to customize various aspects such as:
        * Message format and colors for private DMs.
        * Cooldowns between messages.
        * Maximum message length.
        * Notification sounds or visuals.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Message** mod should now be active, enabling private direct messaging for your players!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Message** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Message** mod, please open an issue on this repository.
