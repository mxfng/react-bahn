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
- bun

Also recommended: asdf (to use .tool-versions)

## Motivations

Configuring a new repo from scratch can be a real pain. Sometimes it's nice to use a configuration you like. Tweak it if you have to, but at least you won't have to install Prettier and ESLint for the 1000th time. This setup has been used in some production apps I've bootstrapped and has a nice combination of convention (React/TypeScript) and awesome developer tools (Bun/Vite/TailwindCSS) for a modern front-end stack (as of 2025 when writing this). Enjoy.

## Quick Start

Boostrap a project repo with a `curl` command:

```bash
curl -s https://raw.githubusercontent.com/mxfng/react-bahn/main/setup.sh | bash -s my-project-name
```

The setup script clones this repository, runs `git init`, updates the project name in `package.json` and `index.html`, and makes an initial git commit.

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

## Available Scripts

### Development

- `bun dev` - Start the development server with Vite
- `bun build` - Build the project for production (TypeScript + Vite)
- `bun preview` - Preview the production build locally
- `bun serve` - Preview the production build with host access

### Testing

- `bun test:unit` - Run unit tests with Vitest
- `bun test:e2e` - Run end-to-end tests with Playwright
- `bun test:ui` - Run Playwright tests with UI mode
- `bun test` - Run both unit and e2e tests

### Code Quality

- `bun lint` - Run ESLint to check code
- `bun lint:fix` - Run ESLint with auto-fix
- `bun format` - Format code with Prettier
- `bun format:check` - Check code formatting without making changes
- `bun typecheck` - Run TypeScript type checking
- `bun check` - Run format check, lint check, and typecheck in sequence

### Git Workflow

- `bun git:add` - Run checks and stage files interactively

### Maintenance

- `bun clean` - Remove node_modules and dist directories
- `bun visualize` - Generate bundle visualization report
- `bun prepare` - Set up Husky git hooks

### Lint Staged

The following commands run automatically on staged files:

- `bun lint:fix` - Lint and fix staged JavaScript/TypeScript files
- `bun format:check` - Check formatting for staged JavaScript/TypeScript/CSS/Markdown files

## Usage

You may clone, re-use, re-write, and re-purpose this template for your projects however you'd like.
