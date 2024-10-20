#!/bin/bash

api_key=""

while true; do
  read -p "Enter command: " input
  prompt="\n\nHuman: please analyze the input text: '$input', \
  and provide an AppleScript command to perform this action. \
  Return only the AppleScript command (without osascript -e or extra characters), \
  and ensure it's valid syntax. No newlines or unnecessary whitespace. \
  \n\nAssistant:"

  response=$(curl -s https://api.openai.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $api_key" \
    -d '{
      "model": "gpt-4o",
      "messages": [{"role": "user", "content": "'"${prompt}"'"}],
      "max_tokens": 300,
      "temperature": 0.1
    }')

  # Save the response to a file
  echo "$response" > invoke-model-output.txt

  # Extract the completion using jq
  extractCMD=$(cat invoke-model-output.txt | jq -r .choices[0].message.content)
  echo "$extractCMD" > extractCMD.applescript

  # Display the extracted command for debugging purposes
  echo "Executing Command: $extractCMD"

  # Execute the extracted command with osascript
  osascript -e "$extractCMD"
  
  echo "Command executed. Press [CTRL+C] to exit the script."
  
done
