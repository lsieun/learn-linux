# Desktop files: putting your application in the desktop menus

URL: https://developer.gnome.org/integration-guide/stable/desktop-files.html.en

## Intro

A “`.desktop`” file is basically **a simple text file** that holds information about a program. It is usually placed in “`~/.local/share/applications`” or “`/usr/share/applications/`” depending whether you want the launcher to be accessible only for local account or for everyone. If you navigate to either directory in your File manager, you will see quite a few “`.desktop`” files that correspond to the installed apps on your computer.

**This desktop file** contains **a listing of the configurations** for your application.

Dir Name: `~/.local/share/applications/`
File Name: `jetbrains-idea.desktop`

```txt
[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA
Icon=/home/liusen/Software/idea201802/bin/idea.png
Exec="/home/liusen/Software/idea201802/bin/idea.sh" %f
Comment=Develop with pleasure!
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-idea
```


The desktop takes the information in this file and uses it to:

- put the application in the **Main Menu**. 
- list the application in the **Run Application...** dialog
- create **appropriate launchers** in the menu or on the desktop.
- associate **the name and description** of the application.
- use **the appropriate icon**.
- recognize the MIME types it supports for opening files.


## Grammer

To add **a menu entry** for your application, create **a desktop file**. It should have a unique filename, and there are **no length limits** so avoid abbreviations and feel free to include brand names. However, **don't put spaces or international characters in the file name**. For instance, "`foocorp-painter-pro.desktop`" would be a good filename to choose but "`fcpp.desktop`" would be a bad name, as would "FooCorp Painter Pro.desktop". The file should be `UTF-8` encoded, and should resemble the following template:

> 最基本的语法

```txt
[Desktop Entry]
Name=FooCorp Painter Pro
Exec=foocorp-painter-pro
Icon=foocorp-painter-pro
Type=Application
Categories=GTK;GNOME;Utility;
```

Each working desktop file needs to follow the same format. A minimal example of a desktop file is shown above. The file is split into **sections**, each starting with **the section descriptor** in **square brackets**. In this example, only one section is shown as that is **the essential section** to integrating **your application** to **the desktop**. Within each section, the part of each line **before** the **equal sign** is the `key` while the second half is the `value`. 

Place this file in the `/usr/share/applications` directory so that it is accessible by **everyone**, or in `~/.local/share/applications` if you only wish to make it accessible to **a single user**. Which is used should depend on whether your application is installed systemwide or into a user's home directory. **GNOME** monitors these directories for changes, so **simply copying the file to the right location is enough to register it with the desktop**.

> 存放位置


## Sample desktop file

```txt
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=Sample Application Name
Comment=A sample application
Exec=application
Icon=application.png
Terminal=false
```

- `[Desktop Entry]`: The first line of every desktop file and the section header to identify the block of key value pairs associated with the desktop. Necessary for the desktop to recognize the file correctly.
- `Type=Application`: Tells the desktop that this desktop file pertains to an application. Other valid values for this key are `Link` and `Directory`.
- `Encoding=UTF-8`: Describes the encoding of the entries in this desktop file.
- `Name=Sample Application Name`: Names of your application for the main menu and any launchers.
- `Comment=A sample application`: Describes the application. Used as a tooltip.
- `Exec=application`: The command that starts this application from a shell. It can have arguments.
- `Icon=application.png`: The icon name associated with this application.
- `Terminal=false`: Describes whether application should run in a terminal.

## `Exec` variables

- `%f`: a single filename.
- `%F`: multiple filenames.
- `%u`: a single URL.
- `%U`: multiple URLs.
- `%d`: a single directory. Used in conjunction with `%f` to locate a file.
- `%D`: multiple directories. Used in conjunction with `%F` to locate files.
- `%n`: a single filename without a path.
- `%N`: multiple filenames without paths.
- `%k`: a URI or local filename of the location of the desktop file.
- `%v`: the name of the Device entry.



