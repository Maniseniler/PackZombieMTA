# Map_Bidaya Mod for MTA:SA 🗺️🌅

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Map_Bidaya** mod (which translates to "Beginning Map" or "Starting Map" in Arabic) is a specific map resource for your Multi Theft Auto: San Andreas server. This mod provides a **designated starting map or spawn area** for players when they first join your server or respawn. Its purpose is to offer a controlled and consistent entry point into your game world, ensuring new players begin in a safe or strategically relevant location.

In a complex environment like your zombie apocalypse server, having a defined starting point is crucial. It helps prevent players from spawning into immediate danger, provides a centralized hub, or acts as an initial tutorial area, making the onboarding experience smoother and more organized.

---

## **Features**

* **Designated Spawn Location:** Provides a consistent and defined starting point for all players.
* **Controlled Environment:** Ensures players begin in a specific area, ideal for tutorials, safe zones, or introductory lore.
* **Seamless Integration:** Designed to work as a primary map or as a controlled spawn point within a larger map.
* **Ease of Management:** Simple resource to configure as your server's initial map.

---

## **Technologies Used**

The **Map_Bidaya** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language commonly used for MTA scripting.
* **MTA Map Format:** Utilizes MTA's standard map (MTA resource) structure.

---

## **Installation Guide**

To install the **Map_Bidaya** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Map_Bidaya** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Map_Bidaya** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Map_Bidaya** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Crucial for Map Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To set **Map_Bidaya** as your server's starting map, find the `<map>` tag (or add it if it doesn't exist) and set its `src` attribute to `Map_Bidaya`. You will also need to ensure the resource is started.
        ```xml
        <server>
            <!-- ... other server configurations ... -->
            <resource src="Map_Bidaya" startup="1" protected="0" />
            <map src="Map_Bidaya" />
            <!-- ... ensure no other default maps conflict ... -->
        </server>
        ```
    * If you use a `gamemode` tag, ensure it also references `Map_Bidaya` or is configured to use the `map` tag properly.
    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Map_Bidaya`**, and then explicitly `changemap Map_Bidaya`.

5.  **Configure ACL (Access Control List) - (Generally Not Required for Maps):**

    * For a map resource like **Map_Bidaya**, specific ACL entries are typically *not* required for its basic functionality (loading and spawning players). Maps generally don't have commands or functions that players directly interact with via ACL.
    * Your provided `acl.xml` lists `resource.D1_Map_Bidaya` under the `Admin` group. This is good as it grants administrators control over the resource itself (e.g., stopping/restarting it). No further ACL changes should be needed for the map to function.
    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Map_Bidaya** map resource should now be active, serving as your server's designated starting point!

---

## **How to Contribute**

We welcome contributions to improve this mod/map! If you have suggestions, bug reports, or would like to contribute code/improvements for **Map_Bidaya**, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code/map adheres to MTA scripting/mapping best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Map_Bidaya** mod, please open an issue on this repository.
