#!/bin/bash

set -euo pipefail

# Pastel-style ANSI colors
BLUE="\033[38;5;117m"
GREEN="\033[38;5;120m"
YELLOW="\033[38;5;222m"
MAGENTA="\033[38;5;213m"
RESET="\033[0m"
BOLD="\033[1m"

# Check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check for required commands
if ! command_exists git; then
  echo -e "${YELLOW}git is not installed. Please install git first.${RESET}"
  exit 1
fi

if ! command_exists bun; then
  echo -e "${YELLOW}Bun is not installed. Install it from https://bun.sh${RESET}"
  exit 1
fi

# Get project name
if [ $# -gt 0 ]; then
  PROJECT_NAME="$1"
else
  if [ -t 0 ]; then
    echo -ne "${BLUE}Enter your project name: ${RESET}"
    read PROJECT_NAME
  else
    echo -e "${YELLOW}Project name is required.${RESET}"
    echo "Usage: curl -s https://raw.githubusercontent.com/mxfng/react-bahn/main/setup.sh | bash -s my-project-name"
    exit 1
  fi
fi

if [[ -z "$PROJECT_NAME" ]]; then
  echo -e "${YELLOW}Project name cannot be empty.${RESET}"
  exit 1
fi

echo -e "${MAGENTA}Cloning template...${RESET}"
git clone https://github.com/mxfng/react-bahn.git "$PROJECT_NAME"

cd "$PROJECT_NAME" || {
  echo -e "${YELLOW}Failed to enter directory '$PROJECT_NAME'${RESET}"
  exit 1
}

echo -e "${MAGENTA}Removing template boilerplate...${RESET}"
rm -f README.md setup.sh
rm -f src/features/README.md src/components/README.md src/layouts/README.md

echo -e "${MAGENTA}Resetting Git repository...${RESET}"
rm -rf .git
git init >/dev/null

echo -e "${MAGENTA}Renaming project...${RESET}"
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' "s/\"name\": \"react-bahn\"/\"name\": \"$PROJECT_NAME\"/" package.json
else
  sed -i "s/\"name\": \"react-bahn\"/\"name\": \"$PROJECT_NAME\"/" package.json
fi

echo -e "${MAGENTA}Creating index.html...${RESET}"
cat >index.html <<EOL
<!doctype html>
<html lang="en" class="dark">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>$PROJECT_NAME</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>
  </body>
</html>
EOL

echo -e "${MAGENTA}Updating .gitignore...${RESET}"
echo -e "\n.DS_Store\n.env*" >>.gitignore

echo -e "${MAGENTA}Adding initial commit...${RESET}"
git add .
git commit -m "Initial commit" >/dev/null

echo ""
echo -e "${GREEN}${BOLD}Setup complete!${RESET}"
echo -e "${BLUE}Your project '${PROJECT_NAME}' is ready.${RESET}"
echo -e "${MAGENTA}To start developing:${RESET}"
echo -e "${BOLD}  cd $PROJECT_NAME${RESET}"
echo -e "${BOLD}  bun install${RESET}"
echo -e "${BOLD}  bun dev${RESET}"
