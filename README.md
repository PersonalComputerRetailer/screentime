# Screen Time Limiter for Ubuntu

This project provides a background script to limit a kid's screen time on Ubuntu (It should work with other Linux distribution).
It shows warning popups, counts down, locks the screen, and cuts off internet access after a set time (optinal).

Note:
This tool is intended to help children build time management skills.
While it locks the screen and can cut internet access, a determined child with knowledge of Linux terminal commands may still unlock the screen, reconnect the internet, or terminate the script.

If they succeed, congratulations! 🎉 — they have developed advanced computer skills beyond most children. This could be a valuable learning opportunity to further guide and encourage their growth.

## Installation

1. Clone the repository

```
git clone git@github.com:PersonalComputerRetailer/screentime.git
cd screentime
```

2. Make the script executable

```
chmod +x screen_time_limiter.sh
```

3. Install dependencies (if you don't have them, yet):

**gnome-screensaver** to activate screensaver when time's up
```
sudo apt install gnome-screensaver
```

**zenity** graphical popups
```
sudo apt install zenity
```

## Configure times

Open `creen_time_limiter.sh` with text editor, then adjust ALLOWED_MINUTES, WARNING_MINUTES, and FINAL_COUNTDOWN_SECONDS.

```
line 4: ALLOWED_MINUTES=120
line 5: WARNING_MINUTES=5
line 6: FINAL_COUNTDOWN_SECONDS=10
```

### (Optional): Turn off networking. Uncomment to activate this action

line 42: 
#nmcli networking off

## Usage
```
nohup ./screen_time_limiter.sh &
disown
```

## Auto-Start on Login (Recommended)

1. If you want the script to start automatically every time the user logs in, open `.bashrc`.

```
nano ~/.bashrc
```

2. At the very bottom, add this line:

```
(nohup /full/path/to/screen_time_limiter.sh & disown)
```
Make sure to replace /full/path/to/screen_time_limiter.sh with the absolute path to your script.

Wrapping it inside ( ) ensures it doesn't block the shell startup.

Save and exit (Ctrl+O, Enter, Ctrl+X).