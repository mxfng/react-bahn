# React Bahn 🚆

This template provides a comprehensive and opinionated setup for modern React development.

Dependencies to highlight include:

- React 19
- TypeScript 5.8.3 + SWC
- Vite 6
- TailwindCSS 4.1.5
- Radix UI Primitives
- Shadcn-style utilities
- Framer Motion 12
- React Router 7
- React Hook Form 7 + zod

React Bahn also comes pre-packaged with popular development tooling, including battle-tested configurations for ESLint, Prettier, Husky, TypeScript, Playwright, and Vitest.

## Dependencies

- git
- bun (default) or npm

Also recommended: asdf (to use .tool-versions)

## Quick Start

Boostrap a project repo with a `curl` command:

```bash
# Using Bun (default)
curl -s https://raw.githubusercontent.com/mxfng/react-bahn/main/setup.sh | bash -s my-project-name

# Using npm
curl -s https://raw.githubusercontent.com/mxfng/react-bahn/main/setup.sh | bash -s my-project-name --package-manager=npm
```

The setup script clones this repository, runs `git init`, updates the project name in `package.json` and `index.html`, and makes an initial git commit.

After setup completes, install the dependencies and start the development server:

```bash
cd my-project-name
# If using Bun
bun install
bun dev

# If using npm
npm install
npm run dev
```

Just a quick warning, I haven't tested compatibility for installing for `npm` via the `setup.sh` script, so there might be some issues on different platforms outside of macOS. Please report a bug if you find one.

## Structure

The template follows a feature-first architecture with clear separation of concerns:

```
react-bahn/
├── public/             # Static assets
├── src/
│   ├── api/            # API client and service abstractions
│   ├── assets/         # Project assets (images, fonts, etc.)
│   ├── components/     # Reusable UI components
│   ├── features/       # Feature-specific components and logic
│   ├── layouts/        # Layout components (wrappers, containers)
│   ├── lib/            # Utility functions and shared code
│   └── routes/         # Route or page components
└── .husky/             # Git hooks
```

## Usage

You may clone, re-use, re-write, and re-purpose this template for your projects however you'd like.
