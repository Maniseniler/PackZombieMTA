# Hafiz Mod for MTA:SA ⏳💰

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Hafiz** mod (which translates to "Preserver" or "Saver" in some contexts, but here implies timed distribution) is a unique economic resource for your Multi Theft Auto: San Andreas server. It's designed to **automatically distribute in-game currency to all online players at regular, configurable intervals**. The primary goal is to **encourage player activity and reward them for spending time on your server**, providing a consistent income stream in your zombie apocalypse world.

This mod ensures that players are continuously rewarded for their engagement, helping to stimulate the server's economy and provide ongoing incentives for playing. It acts as a passive income generator, making the survival experience more rewarding and sustaining long-term player presence.

---

## **Features**

* **Timed Money Distribution:** Automatically gives money to all connected players at set time intervals.
* **Configurable Interval:** Easily adjust how frequently money is given (e.g., every 5 minutes, every hour).
* **Configurable Amount:** Set the exact amount of money each player receives per distribution.
* **Player Encouragement:** Rewards players for their online time, fostering engagement and loyalty.
* **Server Economy Stimulation:** Provides a steady injection of currency into your server's economy.
* **Broadcast Notifications (Optional):** May announce to players when the money has been distributed.

---

## **Technologies Used**

The **Hafiz** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.

---

## **Installation Guide**

To install the **Hafiz** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Hafiz** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Hafiz** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Hafiz** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Hafiz** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Hafiz" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Hafiz`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Operation!_****

    * For the **Hafiz** mod to automatically give money to players, the resource itself needs permission to modify players' money balances.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * You will need to ensure that the ACL which the **Hafiz** resource implicitly or explicitly uses has the necessary function right to set or add player money. This is typically `function.setPlayerMoney`.

    * Your provided `acl.xml` already lists `resource.D1_Hafiz` under the `Admin` group. This means administrators have control over the resource itself. However, the resource itself needs permission to modify player money. **You will need to ensure the `Admin` ACL (or an `autoACL` associated with `Hafiz`) has the `function.setPlayerMoney` right set to `access="true"`.**

    * **Example (critical for the mod to give money):**
        ```xml
        <acl name="Admin">
            <!-- ... other rights ... -->
            <right name="function.setPlayerMoney" access="true"></right>
            <!-- ... other rights ... -->
        </acl>
        ```
        *(Ensure the ACL that the `Hafiz` resource uses to perform its money-giving actions has this right.)*

    * If your **Hafiz** mod includes any administrative commands (e.g., to manually trigger a money drop, or change settings in-game), those commands would also need corresponding ACL entries for your admin groups. **Please check your `Hafiz` mod's server-side Lua file for any precise command handler names.**

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Hafiz Mod Settings (Crucial for Customization):**

    * Check the **Hafiz** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file will be crucial for setting up the mod's behavior.

    * If a config file exists, you **must** customize settings such as:
        * `interval`: The time (in seconds or minutes) between money distributions.
        * `amount`: The amount of money given to each player per interval.
        * `notificationMessage`: The message displayed to players when they receive money.
        * `currencyType` (if applicable): What type of in-game money is used (e.g., from your `ZombieMoney` mod).

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Hafiz** mod should now be active, automatically distributing money to your online players!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Hafiz** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Hafiz** mod, please open an issue on this repository.
