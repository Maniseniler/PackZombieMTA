# Anti_F8 Mod for MTA:SA 🚫📸

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Anti_F8** mod is a vital security resource for your Multi Theft Auto: San Andreas server. Its primary function is to prevent players from abusing the `F8` key, which typically opens the debug console in MTA and can be used for various exploits or unwanted actions. By restricting `F8` access or functionality, this mod significantly enhances server integrity and fairness.

In a competitive or collaborative environment like your zombie apocalypse server, preventing client-side exploits and maintaining a level playing field is crucial. **Anti_F8** acts as a proactive defense mechanism, contributing to a smoother and more secure experience for all legitimate players and minimizing potential disruptions.

---

## **Features**

* **F8 Key Abuse Prevention:** Blocks or modifies the default behavior of the `F8` key to prevent its misuse.
* **Enhanced Server Security:** Reduces the risk of client-side exploits often initiated through the debug console.
* **Fair Play Enforcement:** Ensures that players cannot gain unfair advantages by exploiting debug functionalities.
* **Seamless Operation:** Designed to run quietly in the background without impacting legitimate gameplay.

---

## **Technologies Used**

The **Anti_F8** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.

---

## **Installation Guide**

To install the **Anti_F8** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Anti_F8** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Anti_F8** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Anti_F8** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Anti_F8** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Anti_F8" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Anti_F8`**.

5.  **Configure ACL (Access Control List) - (If Specific Permissions are Needed):**

    * The **Anti_F8** mod is typically a client-side or server-side script designed to *prevent* actions, so it generally does not require specific ACL entries for players to "use" it. Its functionality is often passive.
    * However, if your **Anti_F8** mod includes any administrative commands (e.g., to temporarily disable the anti-F8 feature for specific users or debug purposes), then those commands would need corresponding ACL entries.
    * **Check the `Anti_F8` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
    * If a command is found (e.g., `command.togglef8protection`), you would add a `<right>` entry to the appropriate ACL group (e.g., `Admin`):
        ```xml
        <acl name="Admin">
            <!-- ... other rights ... -->
            <right name="command.togglef8protection" access="true"></right>
            <!-- ... other rights ... -->
        </acl>
        ```
    * Your provided `acl.xml` already lists `resource.D1_Anti_F8` under the `Admin` group, which means administrators have full control over the resource itself.
    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Anti_F8** mod should now be active, diligently working to protect your server from `F8` key abuse!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Anti_F8** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Anti_F8** mod, please open an issue on this repository.
