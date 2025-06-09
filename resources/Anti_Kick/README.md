# Anti_Kick Mod for MTA:SA 🛡️⛔

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Anti_Kick** mod is a crucial security resource for your Multi Theft Auto: San Andreas server. Its primary function is to prevent players from being unfairly or repeatedly kicked from the server, often by malicious individuals or through unintended exploits. This mod aims to stabilize the player experience and maintain server population by mitigating unauthorized kicking attempts.

In a dynamic and potentially competitive server environment, preventing disruptive actions like mass kicking or targeted harassment is essential for fostering a positive community. **Anti_Kick** acts as a protective layer, ensuring that legitimate players can enjoy their time on your zombie apocalypse server without arbitrary interruptions.

---

## **Features**

* **Kick Prevention:** Actively works to prevent unauthorized or excessive kicks from the server.
* **Enhanced Player Stability:** Ensures players can maintain their connection without arbitrary disconnections.
* **Fair Play Enforcement:** Contributes to a more equitable playing field by limiting the power of disruptive players.
* **Passive Operation:** Designed to run in the background, automatically protecting players from unwarranted kicks.

---

## **Technologies Used**

The **Anti_Kick** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.

---

## **Installation Guide**

To install the **Anti_Kick** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Anti_Kick** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Anti_Kick** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Anti_Kick** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Anti_Kick** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Anti_Kick" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Anti_Kick`**.

5.  **Configure ACL (Access Control List) - (If Specific Permissions are Needed):**

    * The **Anti_Kick** mod is typically a passive server-side security measure. It generally does not require specific ACL entries for players to "use" it, as its function is to *prevent* unwanted actions.
    * However, if your **Anti_Kick** mod includes any administrative commands (e.g., to temporarily disable the anti-kick feature for specific users or debug purposes, or to manage a whitelist/blacklist for kicking), then those commands would need corresponding ACL entries.
    * **Check the `Anti_Kick` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
    * If a command is found (e.g., `command.antiKickWhitelist`), you would add a `<right>` entry to the appropriate ACL group (e.g., `Admin`):
        ```xml
        <acl name="Admin">
            <!-- ... other rights ... -->
            <right name="command.antiKickWhitelist" access="true"></right>
            <!-- ... other rights ... -->
        </acl>
        ```
    * Your provided `acl.xml` already lists `resource.D1_Anti_Kick` under the `Admin` group, which means administrators have full control over the resource itself.
    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Anti_Kick** mod should now be active, diligently working to protect your server from unauthorized kicks!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Anti_Kick** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Anti_Kick** mod, please open an issue on this repository.
