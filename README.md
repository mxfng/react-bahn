# React Bahn

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

React Bahn also comes pre-packaged with popular development tooling, including battle-tested configurations for Bun, ESLint, Prettier, Husky, TypeScript, and Vitest.

## Dependencies

- git
- bun

Also recommended: asdf (to use .tool-versions)

## Quick Start

Boostrap a project repo with a `curl` command:

```bash
curl -s https://raw.githubusercontent.com/mxfng/react-bahn/main/setup.sh | bash -s my-project-name
```

The setup script clones this repository, runs `git init`, updates the project name in `package.json` and `index.html`.

After setup completes, install the dependencies and start the development server:

```bash
cd my-project-name
bun install
bun dev
```

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
