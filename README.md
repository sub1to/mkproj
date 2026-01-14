# mkproj

A lightweight CLI tool for generating C++ project scaffolding, including directory structures, source files, premake configs, build/clean scripts, etc.


## Usage

```bash
mkproj [options] <workspace_name> <kind>
```


## Options

* `-n <name>`: Override the project name (defaults to workspace name).
* `-h`: **Disable** pedantic mode.
* *Note: Hardening/Pedantic mode is enabled by default.*


## Project Kinds

* **Console:** `con`, `console`
* **Windowed:** `win`, `window`, `windowed`
* **Shared Library:** `dll`, `sharedlib`
* **Static Library:** `lib`, `staticlib`


## Examples

Create a console application:

```bash
mkproj my_console_app con
mkproj my_console_app console
```

Create a workspace named `my_solution` containing a project named `my_console_app`:

```bash
mkproj -n my_console_app my_solution con
```

