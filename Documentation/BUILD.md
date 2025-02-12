### [Return to README](../README.md)

# Building Your C++ Projects with `make`

Your C++ assignments will typically come with a `Makefile`. This file contains instructions for the `make` utility, a powerful tool for automating the build process.

## What is `make`?

`make` reads the `Makefile` and executes commands based on *targets* and their dependencies. It helps you:

*   **Compile** your code.
*   **Link** object files into an executable.
*   **Clean up** temporary files.
*   **Automate** other tasks related to building your project.

## Common `Makefile` Targets in Your Assignments

Your assignments will typically have the following targets defined in the `Makefile`:

### 1. `make` (or `make all`)

*   **What it does:** Compiles your code and creates the executable.
*   **How to use it:**

    ```bash
    make
    ```
    or
    ```bash
    make all
    ```

    This is usually the default target, so just typing `make` is often enough.

### 2. `make run`

*   **What it does:** Runs the executable.
*   **How to use it:**

    ```bash
    make run
    ```

### 3. `make clean`

*   **What it does:** Removes intermediate files like object files (`.o`) and the executable itself. This keeps your project directory tidy.
*   **How to use it:**

    ```bash
    make clean
    ```

### 4. `make distclean`

*   **What it does:**  Similar to `make clean`, but might remove even more files, such as downloaded dependencies or configuration files. It essentially resets the project to its "pristine" state.
*   **How to use it:**

    ```bash
    make distclean
    ```

## Typical Workflow

1.  **Navigate to the assignment directory:**

    ```bash
    cd program1
    ```

2.  **Build the project:**

    ```bash
    make
    ```

3.  **Run the program:**

    ```bash
    make run
    ```
    Or, if you need to run it with specific arguments:
    ```bash
    ./program1 arg1 arg2
    ```

4.  **Clean up (after you're done or if you need to rebuild from scratch):**

    ```bash
    make clean
    ```

**Important Notes:**

- **Indentation:** Makefiles are very strict about indentation. Use tabs, not spaces, to indent commands under a target.
- **Dependencies:** make is smart about dependencies. If a source file hasn't changed, it won't recompile it unnecessarily.
- **Customization:** Your Makefile might have other targets or variables depending on the specific assignment.

By understanding these basic make commands and the structure of your Makefile, you'll be able to build, run, and manage your C++ projects efficiently.
