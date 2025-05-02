#!/bin/bash

# Exit on error
set -e

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check for required commands
if ! command_exists git; then
  echo "Error: git is not installed. Please install git first."
  exit 1
fi

if ! command_exists bun; then
  echo "Error: Bun is not installed. Please install it from https://bun.sh"
  exit 1
fi

# Get project name from command line argument or prompt
if [ $# -gt 0 ]; then
  PROJECT_NAME="$1"
else
  if [ -t 0 ]; then
    read -p "Enter your project name: " PROJECT_NAME
  else
    echo "Error: Project name is required."
    echo "Usage: curl -s https://raw.githubusercontent.com/mxfng/react-bahn/main/setup.sh | bash -s my-project-name"
    exit 1
  fi
fi

if [[ -z "$PROJECT_NAME" ]]; then
  echo "Error: Project name cannot be empty."
  exit 1
fi

echo "Cloning template repository..."
if ! git clone https://github.com/mxfng/react-bahn.git "$PROJECT_NAME"; then
  echo "Error: Failed to clone repository. Please check your internet connection and try again."
  exit 1
fi

cd "$PROJECT_NAME" || {
  echo "Error: Failed to change directory to $PROJECT_NAME"
  exit 1
}

echo "Removing template files..."
# Remove root level template files
rm -f README.md setup.sh

# Remove documentation files from source directories
rm -f src/features/README.md \
  src/components/README.md \
  src/layouts/README.md

echo "Setting up new git repository..."
rm -rf .git
git init

echo "Setting project name $PROJECT_NAME in package.json..."
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' "s/\"name\": \"react-bahn\"/\"name\": \"$PROJECT_NAME\"/" package.json
else
  sed -i "s/\"name\": \"react-bahn\"/\"name\": \"$PROJECT_NAME\"/" package.json
fi

echo "Setting project name $PROJECT_NAME in index.html..."
cat >index.html <<'EOL'
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

echo "🚆 Setup complete! Your project '$PROJECT_NAME' is ready to go."
echo "To start development, run:"
echo "cd $PROJECT_NAME"
echo "bun dev"
