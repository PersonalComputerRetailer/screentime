#!/bin/bash

# CONFIGURATION
ALLOWED_MINUTES=120
WARNING_MINUTES=5
FINAL_COUNTDOWN_SECONDS=10

# TIME CALCULATIONS
ALLOWED_SECONDS=$((ALLOWED_MINUTES * 60))
WARNING_SECONDS=$((WARNING_MINUTES * 60))

# WAIT until (total time - warning time)
sleep $((ALLOWED_SECONDS - WARNING_SECONDS))

# FIRST WARNING
zenity --info \
  --title="⚠️ Screen Time Warning" \
  --text="You have $WARNING_MINUTES minutes left. Please save your work." \
  --timeout=10

# WAIT until 1 min left
sleep $((WARNING_SECONDS - FINAL_COUNTDOWN_SECONDS))

# FINAL COUNTDOWN - 1 minute
(
for ((i=FINAL_COUNTDOWN_SECONDS; i>=0; i--))
do
    echo "# Your Screen Time is Up in $i seconds..."
    echo "$(( (FINAL_COUNTDOWN_SECONDS - i) * 100 / FINAL_COUNTDOWN_SECONDS ))"
    sleep 1
done
) |
zenity --progress \
  --title="⏳ Final Countdown" \
  --text="Starting countdown..." \
  --percentage=0 \
  --auto-close 

# FINAL ACTIONS

# Turn off networking
#sudo nmcli networking off

# Lock the screen
gnome-screensaver-command -l
