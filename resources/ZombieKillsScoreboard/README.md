# ZombieKillsScoreboard Mod for MTA:SA 🧟‍♂️📊

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **ZombieKillsScoreboard** mod is a dynamic client-side resource for your Multi Theft Auto: San Andreas server, designed to provide players with a **real-time ranking of zombie kills**. This scoreboard allows players to see who is leading in zombie eliminations, fostering a sense of competition and encouraging active participation in fighting the undead.

In your intense zombie apocalypse server, a visible scoreboard like **ZombieKillsScoreboard** is crucial for displaying player achievements, promoting competitive gameplay, and giving players a clear goal to strive for. It adds a public dimension to individual efforts, making the combat experience more engaging and community-driven.

---

## **Features**

* **Real-time Zombie Kill Tracking:** Keeps track of how many zombies each player has killed.
* **Dynamic Scoreboard Display:** Presents a visible ranking of players based on their zombie kill count (e.g., accessed via a key press like `TAB` or a command).
* **Competitive Gameplay:** Encourages players to compete for the top spot in zombie eliminations.
* **Player Recognition:** Highlights top zombie killers, providing recognition and prestige.
* **Configurable Display (Optional):** May allow customization of scoreboard appearance, columns, and refresh rate.
* **Persistent Data (Implied):** Zombie kill counts are likely saved across sessions, contributing to long-term player progression.

---

## **Technologies Used**

The **ZombieKillsScoreboard** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Client-Side GUI/Events:** Utilizes MTA's client-side functions to draw and update the scoreboard interface and respond to events (like zombie kills).
* **Database (Implied):** To ensure persistence of kill counts across server restarts and player disconnections, it likely interacts with a server-side database (e.g., XML file, MySQL).

---

## **Installation Guide**

To install the **ZombieKillsScoreboard** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **ZombieKillsScoreboard** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **ZombieKillsScoreboard** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **ZombieKillsScoreboard** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **ZombieKillsScoreboard** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="ZombieKillsScoreboard" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start ZombieKillsScoreboard`**.

5.  **Configure ZombieKillsScoreboard Mod Settings (Optional):**

    * Check the **ZombieKillsScoreboard** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file might allow you to customize the scoreboard's appearance, ranking logic, and update frequency.

    * If a config file exists, you may be able to adjust settings such as:
        * `topPlayersLimit`: Number of players to display on the scoreboard.
        * `updateInterval`: How frequently the scoreboard refreshes.
        * `displayFormat`: Customization of player names and kill counts on the scoreboard.
        * `triggerKey`: The key players press to open the scoreboard (e.g., `tab` or a custom key).

6.  **Configure ACL (Access Control List) - (Generally Not Required for Passive Display):**

    * The **ZombieKillsScoreboard** mod is primarily a passive display system. It generally does *not* require specific ACL entries for players to use it, as its function is to automatically display statistics.
    * However, if your **ZombieKillsScoreboard** mod includes any administrative commands (e.g., to reset scores, toggle the scoreboard, or debug purposes), those commands would need corresponding ACL entries for admin groups.
    * **Check the `ZombieKillsScoreboard` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
    * Your provided `acl.xml` lists `resource.D1_zombiekills_scoreboard` under the `Admin` group, which is good for general control over the resource itself.
    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **ZombieKillsScoreboard** mod should now be active, proudly displaying the top zombie hunters on your server!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **ZombieKillsScoreboard** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **ZombieKillsScoreboard** mod, please open an issue on this repository.
