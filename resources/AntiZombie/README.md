# AntiZombie Mod for MTA:SA 🚫🧟

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)
[![Language: Xml](https://img.shields.io/badge/Language-XML-orange?logo=xml)](https://www.xml.com/)

---

## **Description**

The **AntiZombie** mod is a crucial defensive resource for your Multi Theft Auto: San Andreas server, especially within a zombie apocalypse setting. This mod is designed to provide players with tools or passive abilities that help them counter or survive against zombie threats more effectively.

Whether it offers a safe zone, specific defensive items, enhanced resistance, or other mechanics, **AntiZombie** aims to balance the challenge of the zombie horde with player survivability, ensuring a more engaging and less frustrating experience. It's a key component in empowering players to fight back against the undead menace.

---

## **Features**

* **Enhanced Survivability:** Provides players with a means to better withstand or avoid zombie attacks.
* **Defensive Mechanics:** May include features like temporary invulnerability, a shield, special anti-zombie weapons, or safe zones.
* **Balancing Gameplay:** Aims to provide a fair fight against the zombie population, preventing overwhelming player deaths.
* **Configurable Parameters:** (Optional) Allows server owners to adjust the effectiveness, cooldowns, or conditions for anti-zombie abilities.

---

## **Technologies Used**

The **AntiZombie** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.

---

## **Installation Guide**

To install the **AntiZombie** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **AntiZombie** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **AntiZombie** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **AntiZombie** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **AntiZombie** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="AntiZombie" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start AntiZombie`**.

5.  **Configure ACL (Access Control List) - (If Specific Permissions are Needed):**

    * The **AntiZombie** mod primarily provides defensive capabilities. Depending on its implementation, specific ACL entries might or might not be required for general player usage.

    * **Check the `AntiZombie` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.** For example, if it has an admin command to toggle an anti-zombie effect for a player, that command would need an ACL entry. If it's a passive effect or an item that players acquire through other means, no ACL changes might be needed for its use.

    * If a command is found (e.g., `command.toggleantizombie`), you would add a `<right>` entry to the appropriate ACL group (e.g., `Admin`):
        ```xml
        <acl name="Admin">
            <!-- ... other rights ... -->
            <right name="command.toggleantizombie" access="true"></right>
            <!-- ... other rights ... -->
        </acl>
        ```

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **AntiZombie** mod should now be active, enhancing player defense against the undead!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **AntiZombie** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **AntiZombie** mod, please open an issue on this repository.
