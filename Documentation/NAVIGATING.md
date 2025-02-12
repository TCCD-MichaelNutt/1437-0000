### [Return to README](../README.md)

# Navigating Your Filesystem with `cd`

The `cd` command is your primary tool for moving around your filesystem in the terminal. It stands for "change directory." Here's a quick guide for navigating between your programming assignments:

## 1. Checking Your Current Location: `pwd`

*   `pwd` stands for "print working directory."
*   Use it to see exactly where you are in the filesystem.

```bash
pwd
```

Example output:

```bash
/workspace/assignment-name
```

## Listing Files and Folders: `ls`

* `ls` lists the files and folders in your current directory.
* Use `ls -l` for a detailed list (permissions, size, modification date).
* Use `ls -a` to show hidden files and folders (those starting with a dot, like .git).

```bash
ls
ls -l
ls -a
```

Example output:
```bash
program1  program2 program3  main.cpp
```

## Changing Directories: `cd`
* Move into a folder:
```bash
cd <folder_name>
```
Example:
```bash
cd program1
```

* Move up one level (to the parent folder)
```bash
cd ..
```

* Move to your main workspace folder
```bash
cd /workspace/<assignment-name>
```

## 4. Example Workflow:
1. Check your current location
    ```bash
    pwd
    ```
2. List the available folders:
    ```bash
    ls
    ```
3. Move into `program2`:
    ```bash
    cd program2
    ```
4. Compile and run your program using the make file
    ```bash
    make
    make run
    ```
5. Go back to the main workspace
    ```bash
    cd ..
    ```
6. Perform Git actions (eg, `git status`, `git add`, `git commit`, `git push`)

**Tip:** Use tab completion! Start typing a folder name and press `Tab` to autocomplete. If there are multiple options, press `Tab` twice to see a list of possibilities.

**In essence, `pwd`, `ls`, and `cd` are your fundamental tools for navigating the filesystem. Mastering them will make working with your programming projects much more efficient!**
