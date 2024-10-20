AutomateMac
This shell script uses OpenAI's GPT-4 API to generate and execute AppleScript commands on macOS based on user input. The script continuously prompts the user for commands, sends the input to the OpenAI API for analysis, and then runs the corresponding AppleScript commands on the Mac.

Features
Continuous Command Input: The script runs in a loop, prompting the user for a new command after each execution.
OpenAI GPT-4 Integration: User inputs are processed by the GPT-4 model to generate AppleScript commands.
Automatic Execution: The generated AppleScript commands are immediately executed via the osascript command.
