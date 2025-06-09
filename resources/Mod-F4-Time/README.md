# Mod-F4-Time Mod for MTA:SA ⏰🎁

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Mod-F4-Time** mod introduces a custom server time system to your Multi Theft Auto: San Andreas server, providing players with persistent in-game time tracking. A unique feature of this mod is the ability for players to type **`تواجد`** (Arabic for "presence" or "attendance") in the F8 console to receive **"free hours"** or a reward for their active presence.

This mod enhances player engagement by rewarding them for their time spent on the server, contributing to a dynamic and rewarding gameplay experience within your zombie apocalypse environment. It combines essential server information with a unique incentive system.

---

## **Features**

* **Custom Server Time Display:** Shows the current server time to players (likely on the HUD or via a command).
* **"Free Hours" Reward System:** Players can redeem rewards (e.g., in-game money, time-based bonuses) by using a specific command (e.g., `تواجد`) in the F8 console.
* **Player Engagement Incentive:** Encourages players to stay online and actively participate.
* **Configurable Reward Amounts & Conditions:** Server owners can define what "free hours" mean and how rewards are given.
* **Integration with F8 Console:** Utilizes a common player interface for interaction.

---

## **Technologies Used**

The **Mod-F4-Time** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Client-Side & Server-Side Scripting:** Leverages both client-side events (for F8 input) and server-side logic (for reward processing and data saving).

---

## **Installation Guide**

To install the **Mod-F4-Time** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Mod-F4-Time** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Mod-F4-Time** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Mod-F4-Time** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Mod-F4-Time** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Mod-F4-Time" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Mod-F4-Time`**.

5.  **Configure ACL (Access Control List) - **_Crucial for `تواجد` Command!_****

    * For players to use the `تواجد` command or any other associated commands, you **must** grant them appropriate permissions in your `acl.xml` file. The mod itself will also need permissions to grant rewards (e.g., money).

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * **For Player Commands (`تواجد`):** Identify the command associated with "free hours" (e.g., `command.تواجد`, `command.rewards`, or similar). This command should be granted to the `Default` ACL or the main player group (e.g., `AraB_GuesT`).
        * **Check the `Mod-F4-Time` mod's client-side and server-side Lua files and `meta.xml` for the precise command handler name.** The F8 console typically maps direct input to commands.
        * **Example (assuming the command is `تواجد`):**
            ```xml
            <acl name="Default">
                <!-- ... other rights ... -->
                <right name="command.تواجد" access="true"></right>
                <!-- ... add other player commands here ... -->
            </acl>
            ```

    * **Permissions for the Mod (Server-Side for Rewards):** If "free hours" grant in-game money or other items/abilities, the `Mod-F4-Time` resource itself will need ACL rights to perform those actions (e.g., `function.setPlayerMoney`, `function.givePlayerItem`).
        * Your provided `acl.xml` lists `resource.D1_Mod-F4-Time` and `resource.Mod-F4-Time` under the `Admin` group, giving administrators control over the resource itself. **However, the resource itself needs the specific function rights to grant rewards.** You will need to ensure the `Admin` ACL (or an `autoACL` associated with `Mod-F4-Time`) has these necessary function rights set to `access="true"`.
        * **Example (critical for granting money):**
            ```xml
            <acl name="Admin">
                <!-- ... other rights ... -->
                <right name="function.setPlayerMoney" access="true"></right>
                <!-- ... add other reward-related functions here if your mod uses them ... -->
            </acl>
            ```

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Mod-F4-Time Settings (Optional):**

    * Check the **Mod-F4-Time** folder for any configuration files (e.g., `config.lua` or `settings.xml`). This file will allow you to customize various aspects of the time system and rewards.

    * If a config file exists, you may be able to adjust settings such as:
        * The amount of money or type of reward granted by `تواجد`.
        * Cooldown for using the `تواجد` command.
        * Interval for automatic time updates.
        * Visual display settings for the server time.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Mod-F4-Time** mod should now be active, displaying server time and allowing players to claim their "free hours"!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Mod-F4-Time** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Mod-F4-Time** mod, please open an issue on this repository.
