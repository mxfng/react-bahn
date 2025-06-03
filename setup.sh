#!/bin/bash

set -euo pipefail

# Check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Default package manager
PACKAGE_MANAGER="bun"

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --package-manager=*)
      PACKAGE_MANAGER="${1#*=}"
      shift
      ;;
    *)
      PROJECT_NAME="$1"
      shift
      ;;
  esac
done

# Validate package manager
if [[ "$PACKAGE_MANAGER" != "bun" && "$PACKAGE_MANAGER" != "npm" ]]; then
  echo "Error: Package manager must be either 'bun' or 'npm'"
  exit 1
fi

# Check for required commands
if ! command_exists git; then
  echo "Error: git is not installed. Please install git first."
  exit 1
fi

if [[ "$PACKAGE_MANAGER" == "bun" ]] && ! command_exists bun; then
  echo "Error: Bun is not installed. Install it from https://bun.sh"
  exit 1
fi

if [[ "$PACKAGE_MANAGER" == "npm" ]] && ! command_exists npm; then
  echo "Error: npm is not installed. Please install Node.js and npm first."
  exit 1
fi

# Get project name if not provided
if [ -z "${PROJECT_NAME:-}" ]; then
  if [ -t 0 ]; then
    read -p "Enter your project name: " PROJECT_NAME
  else
    echo "Error: Project name is required."
    echo "Usage: curl -s https://raw.githubusercontent.com/mxfng/react-bahn/main/setup.sh | bash -s my-project-name [--package-manager=bun|npm]"
    exit 1
  fi
fi

if [[ -z "$PROJECT_NAME" ]]; then
  echo "Error: Project name cannot be empty."
  exit 1
fi

echo "Cloning template..."
git clone https://github.com/mxfng/react-bahn.git "$PROJECT_NAME"

cd "$PROJECT_NAME" || {
  echo "Error: Failed to enter directory '$PROJECT_NAME'"
  exit 1
}

echo "Removing template boilerplate..."
rm -f README.md setup.sh
rm -f src/features/README.md src/components/README.md src/layouts/README.md

echo "Resetting Git repository..."
rm -rf .git
git init >/dev/null

echo "Renaming project..."
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' "s/\"name\": \"react-bahn\"/\"name\": \"$PROJECT_NAME\"/" package.json
else
  sed -i "s/\"name\": \"react-bahn\"/\"name\": \"$PROJECT_NAME\"/" package.json
fi

# Update package.json based on package manager
if [[ "$PACKAGE_MANAGER" == "npm" ]]; then
  echo "Updating scripts for npm..."
  # Update test script
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' 's/"test": "bun test:unit && bun test:e2e"/"test": "npm run test:unit && npm run test:e2e"/' package.json
    sed -i '' 's/"check": "bun format && bun lint && bun typecheck"/"check": "npm run format && npm run lint && npm run typecheck"/' package.json
    sed -i '' 's/"git:add": "bun check && git add -p"/"git:add": "npm run check && git add -p"/' package.json
  else
    sed -i 's/"test": "bun test:unit && bun test:e2e"/"test": "npm run test:unit && npm run test:e2e"/' package.json
    sed -i 's/"check": "bun format && bun lint && bun typecheck"/"check": "npm run format && npm run lint && npm run typecheck"/' package.json
    sed -i 's/"git:add": "bun check && git add -p"/"git:add": "npm run check && git add -p"/' package.json
  fi
fi

echo "Creating index.html..."
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

echo "Adding initial commit..."
git add .
git commit -m "Initial commit" >/dev/null

echo ""
echo "Setup complete!"
echo "Your project '$PROJECT_NAME' is ready."
echo "To start developing:"
echo "  cd $PROJECT_NAME"
echo "  $PACKAGE_MANAGER install"
echo "  $PACKAGE_MANAGER dev"
