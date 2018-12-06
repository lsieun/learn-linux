# How can I open an image file from the Linux terminal?

URL: https://www.computerhope.com/issues/ch001720.htm

Many image viewer applications are available for Linux. The simplest, most common and powerful is **ImageMagick**. 

# 1. Checking if ImageMagick is installed

ImageMagick comprises many different commands for viewing, manipulating, and modifying images. The tool used to display files is called `display`. To find out if it's already installed on your system, you can open a terminal and at the command prompt, run the following command:

```bash
display -version
```

If ImageMagick is installed, you will see the version information:

```txt
Version: ImageMagick 6.8.9-9 Q16 i586 http://www.imagemagick.org
Copyright: Copyright (C) ImageMagick Studio LLC
Features: DPC Modules OpenMP
Delegates: bzlib djvu fftw fontconfig freetype jbig jng jpeg [...]
```

# 2. Installing ImageMagick

If you don't have ImageMagick installed on your system, you can install it with your package manager. To do so, use the command listed below that corresponds to your Linux distribution:

Debian or Ubuntu:

```bash
sudo apt-get update && sudo apt-get install imagemagick
```

CentOS:

```bash
sudo yum update && sudo yum install ImageMagick
```

Fedora:

```bash
sudo dnf update && sudo dnf install ImageMagick
```

OpenSUSE:

```bash
sudo zypper refresh && sudo zypper install ImageMagick
```

Arch Linux:

```bash
pacman -Sy imagemagick
```

# 3. Using ImageMagick To Display A File

To display an image file, run `display <file name>`. For example:

```bash
display logo.jpg
```
