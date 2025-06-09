# PackZombieMTA
This is the initial release of the MTA Zombie Apocalypse Mod Pack, a comprehensive collection of resources designed to transform your MTA server into a dynamic zombie survival experience.
# MTA Zombie Apocalypse Mod Pack

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)
[![Language: Xml](https://img.shields.io/badge/Language-XML-orange?logo=xml)](https://www.xml.com/)


## Description

Dive into a thrilling post-apocalyptic world with the **MTA Zombie Apocalypse Mod Pack**! This comprehensive collection of custom resources transforms your Multi Theft Auto: San Andreas server into a dynamic, persistent zombie survival experience. Featuring robust administrative tools, engaging gameplay mechanics, an in-depth economy, and persistent player data, this pack provides a solid foundation for a unique and immersive zombie-themed server.

Fight hordes of the undead, earn rewards, level up your character, build and manage safe houses, and enjoy a suite of anti-cheat and moderation tools to keep your server running smoothly.

## Key Features

* **Intense Zombie Survival:** Dynamic zombie spawning, kill messages, and scoreboards to track your prowess.
* **Persistent Player Progression:** Level system, saveable weapons and teams, and money management.
* **Advanced Economy:** Earn money from zombie kills, buy weapons, and manage houses.
* **Comprehensive Admin Tools:** A wide array of commands and panels for server management, anti-griefing, and player oversight.
* **Dynamic Events & Activities:** Participate in custom events and competitions to keep gameplay fresh.
* **Anti-Cheat & Security:** Tools to prevent common exploits like F8 abuse and kicks.
* **User-Friendly UI Enhancements:** Custom HUD, chat, and message systems.
* **Discord Integration:** Rich presence support to showcase your server activity.

## Included Mods

This pack includes the following custom resources, many prefixed with `D1_` for easy identification and management:

| Category                   | Mod Name(s)                                                                                                                                                                                                                             | Description                                                                  |
| :------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------- |
| **Admin/Anti-Griefing** | `AdminMsg`, `Anti_Ban`, `Anti_F8`, `Anti_Kick`, `BuyAdmin`, `Support_System`                                                                                                                                                            | Tools for server moderation, preventing exploits, and assisting players.     |
| **Core Game Mechanics** | `LevelSystem`, `Login`, `Respawn_Money`, `SaveTeam`, `SaveWeapon`, `GiveMoney`, `House`, `Weapon-Shop`, `TransporteSystem`, `Weapons`                                                                                                      | Systems for player progression, data persistence, and managing core game elements. |
| **Zombie-Specific** | `AntiZombie`, `ZombieKillMessage`, `ZombieKillsScoreboard`, `ZombieMoney`, `Zombies`                                                                                                                                                    | Core zombie spawning, AI, and related gameplay features.                     |
| **Utility/UI Enhancements** | `AFK`, `Chat`, `Discord_Rich`, `Hud`, `Message`, `Mod-F4-Time`, `Teleport`, `Txd`, `Updates`, `WarpSystem`, `xJump`, `Yktb`, `guimessages`, `killmessages`, `ZoneArea` | Enhancements for user experience, server utility, and visual customization.  |
| **Unique Events/Features** | `FA3LYAT`, `Horob`, `Mosaba9at`, `Map_Bidaya`, `MapHost`, `Bodygurad`                                                                                                                                                                   | Custom activities, escape mechanics, competitions, and specialized roles.    |
| **Data Management** | `Hafiz`                                                                                                                                                                                                                                 | A resource likely responsible for saving and loading player or server data.  |

## Installation Guide

To install the MTA Zombie Apocalypse Mod Pack on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release:**
    Download the latest release package (e.g., `MTA-Zombie-Mod-Pack-v1.0.0.zip`) from the [Releases](https://github.com/Maniseniler/PackZombieMTA/releases) section of this GitHub repository.

2.  **Extract the Files:**
    Unzip the downloaded `MTA-Zombie-Mod-Pack-v1.0.0.zip` file. You should find a folder containing all the individual resource folders (e.g., `D1_AdminMsg`, `Zombies`, etc.).

3.  **Place Resources on Your Server:**
    Copy all the extracted resource folders directly into your MTA server's `resources` directory.
    *(Example Path: `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`)*

4.  **Configure `mtaserver.conf` (Optional but Recommended):**
    For optimal performance and to ensure all resources start correctly, you can add them to your `mtaserver.conf` file. Open `mtaserver.conf` (located in your server's root directory, e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`) and add `<resource src="RESOURCE_NAME_HERE" startup="1" protected="0" />` for each mod, replacing `RESOURCE_NAME_HERE` with the actual folder name (e.g., `AdminMsg`, `Zombies`).

    Alternatively, you can manually start them in the server console using `start [resource_name]`.

5.  **Configure ACL (Access Control List):**
    The `acl.xml` file (located in your server's `mods/deathmatch/` directory) manages permissions. For full administrative access to all mod features, ensure your in-game account has the necessary rights.

    **Important:** If you wish to use the pre-configured admin tools, you might need to set your in-game username to `Mani` or ensure your account is part of an administrative group that grants permissions to resources, as defined in the provided `acl.xml`. If you need to remove `Mani`'s default admin status, you will need to edit the `acl.xml` to remove their `user.Mani` entries from the `Programing Of ServeR`, `OwNeR`, `Console`, `AdminMsg`, `FA3LYAT`, `NewMsg`, `MoneY`, `House`, `Support`, `Update`, and `Time` groups.

    Refer to the MTA Wiki for detailed guidance on [ACL Configuration](https://wiki.multitheftauto.com/wiki/ACL).

6.  **Start Your Server:**
    Launch your MTA server. The new mods should now be loaded and active!

## How to Contribute

We welcome contributions from the community! If you have suggestions, bug reports, or would like to contribute code, please feel free to:

* Open an issue on GitHub.
* Fork the repository and submit a pull request.

Please ensure your code adheres to MTA scripting best practices and is well-commented.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For questions or support, please open an issue on this repository.
