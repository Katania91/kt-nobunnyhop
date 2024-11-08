# kt-nobunnyhop

## Description

This FiveM script limits the number of jumps a player can perform within a short period of time. If the player exceeds the configured number of jumps (default is 5) within a set time frame (10 seconds), the player will be knocked out with a ragdoll effect for a few seconds.

This script works in all conditions, whether the player is running or just spamming the jump key without moving. It's an ideal way to add a bit of challenge and realism to the game.

### Features:
- **Limits jumps**: The script tracks the number of jumps a player performs in a short time.
- **Ragdoll effect**: If the player exceeds the configured jump limit, a ragdoll effect is applied.
- **Works while running or standing still**: The script works regardless of whether the player is running or simply spamming the jump button without moving.
- **Configurable**: Easily configure the maximum number of jumps and the timeout period in the `config.lua`.

## Installation

1. Download the repository as a ZIP file.
2. Extract the files.
3. Place the folder inside your `resources` folder of your FiveM server.
4. In your `server.cfg`, add the following line to start the script:

   ```bash
   ensure KT-nobunnyhop
## Configuration

You can adjust the settings of the script in the `config.lua` file:

- **`NumberJump`**: The maximum number of jumps allowed in the defined time frame (default is `3`).
- **`DebugMode`**: Set to `true` to enable debug messages in the console (default is `false`).
## How It Works

- The script counts the number of jumps a player makes.
- If the player exceeds the set number of jumps (default is `3`) within `10` seconds, the player will be put into a ragdoll state for `5` seconds.
- The timer resets after the ragdoll effect or when `10` seconds have passed from the first jump.

## Requirements

- **FiveM Server**: This script is intended to be used on a FiveM server.
