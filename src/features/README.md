# `./features/` directory

### Some experienced advice

Organize feature specific code into subdirectories within `./features/`

It's a good pattern to co-locate components, tests, hooks, types, helpers, utilities, and more within a feature subdirectory.

If a component is shared across two or more features, it's best to put it in the `./components/` directory.

If a hook, helper, or utility is shared across two or more features, you can put it somewhere shared like in `./lib/`.

API code should also be separated by feature, using subdirectories in `./api/`.
