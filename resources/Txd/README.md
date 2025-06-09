# Txd Mod for MTA:SA 🎨🖼️

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Maniseniler/PackZombieMTA)](https://github.com/Maniseniler/PackZombieMTA/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: Lua](https://img.shields.io/badge/Language-Lua-blue?logo=lua)](https://www.lua.org/)

---

## **Description**

The **Txd** mod is a powerful resource for your Multi Theft Auto: San Andreas server, designed to handle **custom texture loading and management**. In Grand Theft Auto: San Andreas, `.txd` files contain textures (images) used for vehicles, objects, player skins, and the environment. This mod allows you to seamlessly replace or add custom textures, enabling extensive visual customization of your server.

In your zombie apocalypse server, the **Txd** mod is invaluable for creating a unique and immersive atmosphere. You can use it to apply custom zombie skins, re-texture buildings to look dilapidated, add blood splatters, or even modify weapon appearances, drastically altering the visual experience without requiring client-side modifications from players.

---

## **Features**

* **Custom Texture Loading:** Load custom textures from `.txd` files directly into the game.
* **Visual Customization:** Change the appearance of vehicles, objects, skins, and environmental elements.
* **Enhanced Immersion:** Create a unique visual theme that fits your server's concept (e.g., post-apocalyptic aesthetic).
* **Automatic Application:** Textures are typically applied automatically when players join the server.
* **Performance Optimization (Optional):** May include features to optimize texture loading for smoother performance.

---

## **Technologies Used**

The **Txd** mod is developed using:

* **Lua:** The lightweight, powerful, multi-paradigm scripting language widely used for game development and the core scripting language for Multi Theft Auto.
* **MTA Custom Texture Functions:** Utilizes MTA's built-in functions for loading and applying `.txd` files.

---

## **Installation Guide**

To install the **Txd** mod on your Multi Theft Auto: San Andreas server, follow these steps:

1.  **Download the Release Package:**

    * Download the latest release package of your full mod pack from the [**Releases**](https://github.com/Maniseniler/PackZombieMTA/releases) section of your GitHub repository.

    * The **Txd** mod resource folder is included within this **.zip** file.

2.  **Extract the Mod Files:**

    * Unzip the downloaded **.zip** file to access its contents.

    * Locate the **Txd** folder among the extracted resource directories.

3.  **Place Resource on Your Server:**

    * Copy *only* the **Txd** resource folder directly into your MTA server's **resources** directory.

    * *Typical path:* `C:\Multi Theft Auto\Server\mods\deathmatch\resources\`

4.  **Place Custom `.txd` Files:**

    * Inside the **Txd** resource folder, there should be a designated location (e.g., a `files` folder or directly within the resource root) where you place your custom `.txd` files. **Ensure your custom `.txd` files are correctly placed according to the mod's internal structure.**

5.  **Configure `mtaserver.conf` (Recommended for Auto-Startup):**

    * Open your server's **mtaserver.conf** file, which is usually found in your server's root directory (e.g., `C:\Multi Theft Auto\Server\mods\deathmatch\mtaserver.conf`).

    * To ensure the **Txd** mod starts automatically every time your server launches, add the following line within the **<server>** tags:

        ```xml
        <resource src="Txd" startup="1" protected="0" />
        ```

    * Alternatively, you can manually start the resource in the MTA server console after startup by typing: **`start Txd`**.

6.  **Configure Txd Mod Settings (Optional):**

    * Check the **Txd** folder for a configuration file (e.g., `config.lua` or `settings.xml`). This file might allow you to specify which `.txd` files to load, set priorities, or enable/disable certain textures.

    * If a config file exists, you may be able to adjust settings such as:
        * **`textureMapping`**: Define which original textures are replaced by your custom `.txd` files.
        * **`loadOrder`**: Prioritize certain textures if conflicts arise.
        * **`debugMode`**: Enable logging for texture loading issues.

7.  **Configure ACL (Access Control List) - (Generally Not Required):**

    * The **Txd** mod is primarily a visual modification resource and typically does *not* require specific ACL entries for players to use it. Its function is to automatically apply textures.
    * However, if your **Txd** mod includes any administrative commands (e.g., to reload textures, toggle specific texture packs), then those commands would need corresponding ACL entries for admin groups.
    * **Check the `Txd` mod's server-side Lua files and `meta.xml` for any defined commands or functions that require permissions.**
    * Your provided `acl.xml` lists `resource.D1_Txd` under the `Admin` group, which is good for general control over the resource itself.
    * Refer to the official [MTA Wiki on ACL](https://wiki.multitheftauto.com/wiki/ACL) for detailed guidance on how to modify your **acl.xml**.

8.  **Start Your MTA Server:**

    * Launch your Multi Theft Auto server.

    * The **Txd** mod should now be active, applying your custom textures and enhancing the visual experience of your server!

---

## **How to Contribute**

We welcome contributions to improve this mod! If you have suggestions, bug reports, or would like to contribute code or texture packs for the **Txd** mod, please feel free to:

* Open an [issue on GitHub](https://github.com/Maniseniler/PackZombieMTA/issues) for bug reports or feature requests.

* [Fork the repository](https://github.com/Maniseniler/PackZombieMTA/fork) and submit a pull request with your changes.

Please ensure your code and textures adhere to MTA best practices and are well-commented/organized for clarity.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Maniseniler/PackZombieMTA/blob/main/LICENSE) file for full details. (Assuming your LICENSE file is in the root of your repo).

---

## **Contact**

For any questions, support, or further assistance regarding the **Txd** mod, please open an issue on this repository.
