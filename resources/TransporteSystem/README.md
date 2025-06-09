# TransporteSystem Mod for MTA:SA 🚌🚕

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **TransporteSystem** mod is a versatile resource for your Multi Theft Auto: San Andreas server, designed to provide players with various methods of **in-game transportation**. This system can encompass features like vehicle spawning, public transport routes, vehicle shops, or player-managed transportation services.

In a large, open-world environment, especially one populated by zombies, efficient transportation is crucial for survival, exploration, and moving resources. **TransporteSystem** enhances player mobility and interaction, allowing them to traverse the map effectively, escape dangerous situations, or transport goods. It contributes to a more dynamic and accessible gameplay experience within your zombie apocalypse server.

---

## **Features**

* **Diverse Transportation Options:** May include mechanics for spawning personal vehicles, accessing public transport (buses, taxis), or other unique transport methods.
* **Vehicle Persistence (Optional):** Ability to save and load owned vehicles.
* **Custom Routes/Stations (Optional):** Define specific routes or pick-up/drop-off points for public transport.
* **Economic Integration:** Link vehicle purchases or transport fares with your server's in-game economy.
* **Ease of Access:** Provide simple in-game commands or interactive GUIs for requesting/managing transport.
* **Admin Management:** Tools for administrators to manage vehicles, routes, or transportation points.

---

## **Technologies Used**

The **TransporteSystem** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Vehicle & Element Functions:** Utilizes MTA's built-in functions for creating, managing, and interacting with vehicles and other game elements.
* **Database (Implied):** If vehicle ownership or persistent routes are implemented, it will likely interact with a server-side database (e.g., XML file, MySQL) to store data persistently.

---

## **Installation Guide**

To install the **TransporteSystem** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **TransporteSystem** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **TransporteSystem** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **TransporteSystem** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **TransporteSystem** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="TransporteSystem" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start TransporteSystem`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Usage!_****

    * The **TransporteSystem** mod will require specific ACL permissions for its commands, varying based on who should have access (players, VIPs, admins).

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For Player Commands (e.g., spawn personal vehicle, request transport):** Identify the commands used by players (e.g., `/spawncar [model]`, `/calltaxi`, `/usetransport`). These commands should be granted to the `Default` ACL, `AraB_GuesT`, or specific player groups (e.g., `VIP`).
        * **Check the `TransporteSystem` mod's server-side Lua files and `meta.xml` for the precise command handler names.**
        * **Example (assuming a player command `spawncar` and `calltaxi`):**
            ```xml
            <acl name="Default">
                <!-- ... other rights ... -->
                <right name="command.spawncar" access="true"></right>
                <right name="command.calltaxi" access="true"></right>
                <!-- ... add other player-facing transport commands here ... -->
            </acl>
            ```

    * **For Admin/Moderator Commands (e.g., managing transport points, vehicle limits):** Commands for administrators to manage the transport system (e.g., `/createtransportpoint`, `/deletetransportpoint`, `/setvehiclelimit`) should be granted to admin ACLs (e.g., `Admin`, `SuperModerator`).
        * **Example (assuming admin commands `createtransportpoint`):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="command.createtransportpoint" access="true"></right>
                <!-- ... add other admin transport commands here ... -->
            </acl>
            ```
        * Your provided `acl.xml` lists `resource.TransporteSystem` under the `Admin` group, which is good for general control over the resource itself.

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure TransporteSystem Mod Settings (Crucial for Customization):**

    * Check the **TransporteSystem** folder for a configuration file (e.g., `config.lua`, `vehicles.xml`, or `settings.xml`). This file will be crucial for defining your transport options.

    * If a config file exists, you **must** customize settings such as:
        * **`spawnableVehicles`**: List of vehicle models that can be spawned, along with their costs and required permissions.
        * **`transportPoints`**: Defined locations for public transport stops.
        * **`fares`**: Cost for public transport routes or taxi services.
        * **`ownershipLimits`**: How many vehicles a player can own.
        * **`messages`**: Custom messages displayed during transport interactions.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **TransporteSystem** mod should now be active, enabling comprehensive transportation options for your players!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **TransporteSystem** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **TransporteSystem** mod, please open an issue on this repository.
