#!/bin/bash

# This script runs an update script first, waits, and then starts multiple Python applications.

echo "Running the update script..."
# Run the update script and wait for it to complete.

source .venv/bin/activate && python3 update.py

echo "Update script finished. Waiting for 10 seconds before starting bots..."
# Wait for 10 seconds.
sleep 10

echo "Starting background bot processes..."
# Run these two scripts in the background.
python3 HoneyTdataBot/main.py &
python3 extracterbot/bot.py &

# Run the main bot application in the foreground.
# The container will stay alive as long as this script is running.
# If this script exits, the container will stop.
echo "Starting main bot process..."
python3 -m bot
