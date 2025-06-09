# Respawn_Money Mod for MTA:SA 💰🔄

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Respawn_Money** mod is a vital economic resource for your Multi Theft Auto: San Andreas server, designed to manage the distribution of in-game currency upon player respawn. This mod ensures that players receive a specific amount of money each time they respawn, providing a consistent baseline income and reducing the frustration of losing all funds after death, especially in a challenging environment like your zombie apocalypse server.

This mod helps maintain economic stability and fairness by providing a safety net for players, allowing them to quickly get back into action without being severely penalized financially. It's a key component for ensuring continuous engagement and balancing the economy in a high-mortality game mode.

---

## **Features**

* **Money on Respawn:** Automatically gives players a set amount of money each time they respawn.
* **Configurable Amount:** Easily adjust the amount of money players receive upon respawning.
* **Economic Safety Net:** Prevents players from being completely broke after death, encouraging continued participation.
* **Fair Play:** Ensures all players receive a consistent basic income.
* **Customizable Messages (Optional):** May display a message to players when they receive money upon respawn.

---

## **Technologies Used**

The **Respawn_Money** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Event System:** Utilizes MTA's player death/respawn events to trigger the money distribution.

---

## **Installation Guide**

To install the **Respawn_Money** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Respawn_Money** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Respawn_Money** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Respawn_Money** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Respawn_Money** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Respawn_Money" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Respawn_Money`**.

5.  **Configure ACL (Access Control List) - **_Crucial for Rewards!_****

    * For the **Respawn_Money** mod to automatically give money to players upon respawn, the resource itself needs permission to modify players' money balances.

    * Open your `acl.xml` file (located in `mods/deathmatch/`).

    * You will need to ensure that the ACL which the **Respawn_Money** resource implicitly or explicitly uses has the necessary function right to set or add player money. This is typically `function.setPlayerMoney`.

    * Your provided `acl.xml` lists `resource.D1_Respawn_Money` under the `Admin` group. This is good as it gives administrators control over the resource itself. **However, the resource itself needs the specific function right to grant money.** You will need to ensure the `Admin` ACL (or an `autoACL` associated with `Respawn_Money`) has this necessary function right set to `access="true"`.

    * **Example (critical for granting money):**
        ```xml
        <acl name="Admin">
            <!-- ... other rights ... -->
            <right name="function.setPlayerMoney" access="true"></right>
            <!-- ... add other reward-related functions here if your mod uses them ... -->
        </acl>
        ```

    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

6.  **Configure Respawn_Money Mod Settings (Crucial for Customization):**

    * Check the **Respawn_Money** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file will be crucial for defining the money amount.

    * If a config file exists, you **must** customize settings such as:
        * **`respawnAmount`**: The exact amount of money players receive upon respawn.
        * **`notificationMessage`**: A custom message displayed to players when they receive the money.
        * **`currencyType`** (if applicable): The type of in-game currency used (e.g., from your `ZombieMoney` mod).

7.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Respawn_Money** mod should now be active, providing players with money upon respawn!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code for the **Respawn_Money** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code adheres to MTA scripting best practices and is well-commented for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Respawn_Money** mod, please open an issue on this repository.
