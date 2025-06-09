# Anti_Ban Mod for MTA:SA 🛡️🔒

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Anti_Ban** mod is a critical security resource for your Multi Theft Auto: San Andreas server. It is designed to prevent players from circumventing server bans or attempting to rejoin after being banned. This mod enhances your server's integrity by ensuring that bans are effectively enforced and that disruptive players cannot easily bypass restrictions.

In a dynamic server environment, especially one with a strong focus on gameplay like your zombie apocalypse mod pack, maintaining a fair and secure playing field is paramount. **Anti_Ban** provides an essential layer of protection against persistent rule-breakers, ensuring a better experience for all legitimate players.

---

## **Features**

* **Ban Evasion Prevention:** Actively works to prevent players from rejoining the server if they are under an active ban.
* **Enhanced Server Security:** Strengthens the effectiveness of your server's banning system.
* **Automated Detection:** May include logic to identify and block common methods of ban evasion (e.g., IP changes, serial changes, or account swapping).
* **Seamless Integration:** Operates in the background, requiring minimal direct interaction from administrators once configured.

---

## **Technologies Used**

The **Anti_Ban** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.

---

## **Installation Guide**

To install the **Anti_Ban** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Anti_Ban** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Anti_Ban** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Anti_Ban** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Anti_Ban** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Anti_Ban" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Anti_Ban`**.

5.  **Configure ACL (Access Control List) - (If Specific Permissions are Needed):**

    * The **Anti_Ban** mod is typically a server-side, passive security measure. It's unlikely to require specific ACL entries for players to "use" it, as its function is to *prevent* unwanted actions.
    * However, if your **Anti_Ban** mod includes any administrative commands (e.g., to whitelist an IP from ban checks, or to manually block a specific serial), then those commands would need corresponding ACL entries.
    * **Check the `Anti_Ban` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
    * If a command is found (e.g., `command.antiBanWhitelist`), you would add a `<right>` entry to the appropriate ACL group (e.g., `Admin`):
        ```xml
        <acl name="Admin">
            <!-- ... other rights ... -->
            <right name="command.antiBanWhitelist" access="true"></right>
            <!-- ... other rights ... -->
        </acl>
        ```
    * Your provided `acl.xml` already lists `resource.D1_Anti_Ban` under the `Admin` group, which means administrators have full control over the resource itself.
    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Anti_Ban** mod should now be active, diligently working to protect your server from banned players!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Anti_Ban** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Anti_Ban** mod, please open an issue on this repository.
