The source files are assembled into a ROM using [**rgbds**](https://github.com/rednex/rgbds).
These instructions explain how to set up the tools required to build.

If you run into trouble, ask for help on [**Aizawa's Discord server**](https://discord.gg/UKTyj3t).


# Windows

To build on Windows, install [**Cygwin**](http://cygwin.com/install.html) with the default settings.

In the installer, select the following packages: `make`, `gcc`, `python`, `git`, `gettext`.
If `gettext` no longer exists, get `libsasl2-3` and `ca-certificates`.

Then get [**rgbds 0.2.5**](https://github.com/rednex/rgbds/releases/). Versions 0.3.0 and later are not compatible.
Extract the archive and put `rgbasm.exe`, `rgblink.exe`, `rgbfix.exe` and `rgbgfx.exe` in `C:\Cygwin\usr\local\bin`.

In the **Cygwin terminal**:

```bash
git clone https://github.com/PiaCarrot/pokeorange.git
cd pokeorange
```

To build **pokeorange.gbc**:

```bash
make
```


# Linux

```bash
sudo apt-get install make gcc python git bison

git clone https://github.com/rednex/rgbds.git
cd rgbds
git checkout v0.2.5
sudo make install
cd ..

git clone https://github.com/PiaCarrot/pokeorange.git
cd pokeorange
```

To build **pokeorange.gbc**:

```bash
make
```


# Mac OS X

In **Terminal**, run:

```bash
xcode-select --install

git clone https://github.com/rednex/rgbds.git
cd rgbds
git checkout v0.2.5
sudo make install
cd ..

git clone https://github.com/PiaCarrot/pokeorange.git
cd pokeorange
```

To build **pokeorange.gbc**:

```bash
make
```
