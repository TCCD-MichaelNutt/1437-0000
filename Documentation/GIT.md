### [Return to README](../README.md)

# Using Git and GitHub Classroom

This course utilizes Git and GitHub Classroom for version control and assignment submission.  Here's a guide to the essential Git commands and best practices you'll need:

Table of Contents
- **[Writing Semantic Commit Messages](#writing-semantic-commit-messages-a-beginners-guide)**
- **[`git add`: Staging changes for your next commit](#git-add-staging-changes-for-your-next-commit-c-edition)**
- **[`git commit`: Saving Your Changes](#git-commit-saving-your-changes)**
- **[`git push`: Uploading your commits](#git-push-uploading-your-commits-to-a-remote-repository)**
- **[`git pull`: Fetching and Merging changes](#git-pull-fetching-and-merging-changes-from-a-remote-repository)**

## **Writing Semantic Commit Messages: A Beginner's Guide**

Semantic commit messages provide a structured way to write commit messages, making your project's history clearer and more useful. This structure helps automate releases, generate changelogs, and understand the project easily.

### 1. Format:

*   ` <type>(<scope>): <subject>`
*   **`<type>`:**  Describes the kind of change (see list below).
*   **`(<scope>)`:** (Optional) Specifies the part of the project affected (e.g., `auth`, `navbar`, `docs`). Use when the change is not project wide.
*   **`<subject>`:**  A short summary of the change in the imperative, present tense (e.g., `Add`, not `Added`).
*   A blank line then follows.
*   Then the body which follows the rules from before.

### 2. Types:

*   **`feat`:** A new feature for the user.
    *   Example: `feat(login): add social media login options`
*   **`fix`:** A bug fix for the user.
    *   Example: `fix(profile): resolve error when saving empty address field`
*   **`docs`:** Documentation changes only.
    *   Example: `docs: update installation instructions`
*   **`style`:** Code style changes (formatting, semicolons, etc.) - no functional code changes.
    *   Example: `style: format code with Prettier`
*   **`refactor`:** Code changes that neither fix a bug nor add a feature.
    *   Example: `refactor(user): rename User class to Member`
*   **`test`:** Adding, updating, or refactoring tests.
    *   Example: `test(cart): add unit tests for checkout process`
*   **`chore`:** Changes to build tools, development environment, etc.
    *   Example: `chore: update Node.js to version 20`

### 3. Subject (Imperative, Present Tense):

*   Write as a command:
    *   **Good:** `fix(header): make mobile menu close on click`
    *   **Bad:** `fixed header bug`

### 4. Body (Optional but Recommended):

*   Separate from the subject with a blank line.
*   Explain the **what** and **why**, not the how.
*   Wrap lines at around 72 characters.
*   Example:

```git
feat(api): implement user authentication with JWT

This change introduces JWT-based authentication to the API. Using JWTs improves security by allowing the API to be stateless and not requiring session management on the server.

It also improves performance by reducing database lookups on each request. The implementation uses a strong signing algorithm and sets appropriate token expiration times.
```

### 5. Typed Commands Example

*   `git commit -m "feat(navigation): add breadcrumb navigation"`
*   `git commit -m "fix(search): handle empty search query correctly"`
*   `git commit -m "docs: add tutorial for creating custom themes"`
*   `git commit -m "style: run linter and fix whitespace issues"`
*   `git commit -m "refactor(database): extract database logic to separate module"`
*   `git commit -m "test(user-model): add tests for password hashing function"`
*   `git commit -m "chore: upgrade Webpack to latest version"`

### Why Use Semantic Commits?

*   **Automated Changelog Generation:** Tools can automatically create release notes from your commits.
*   **Better Project Understanding:** Easily see the types of changes in your project's history.
*   **Improved Collaboration:** Provides a clear and consistent way for teams to communicate about code changes.
*   **Easier to Determine the Scope of Changes**: What has been changed and where.

**In short, adopting the semantic commit message style makes your Git history more organized, readable, and useful for both humans and automated tools.**

[Back to Top](#using-git-and-github-classroom)

---

## `git add`: Staging Changes for Your Next Commit (C++ Edition)

`git add` is used to *stage* changes. Staging is like preparing a package to be shipped (committed). You choose what goes into the next commit.

### 1. What it Does:

*   Takes a snapshot of your modified files and adds them to the *staging area*.
*   Prepares changes to be included in your next commit.
*   Does **not** create a commit yet.

### 2. Basic Usage:

*   **Stage a specific file:**

    ```bash
    git add <filename>
    ```

    Example:

    ```bash
    git add main.cpp
    ```

    Example:

    ```bash
    git add MyClass.h
    ```

*   **Stage a specific folder:**

    ```bash
    git add <folder>
    ```

    Example:

    ```bash
    git add utils/
    ```

    Example:

    ```bash
    git add src/
    ```

*   **Stage all changes in the current directory and subdirectories:**

    ```bash
    git add .
    ```

    (be careful with this one! Make sure you want to add everything.)

### 3. More Advanced Usage:

*   **Stage parts of a file (interactive staging):**

    ```bash
    git add -p
    ```

    Allows you to selectively stage changes within a file, hunk by hunk. Useful for breaking down large changes into smaller, logical commits.

*   **Stage all tracked modified and deleted files, but not new files:**

    ```bash
    git add -u
    ```

    Useful to avoid accidentally staging new files.

*   **Stage all new, modified and deleted files, excluding ignored ones:**

    ```bash
    git add -A
    ```
    Almost the same as `git add .` but also adds untracked files.

### 4. Important Notes:

*   `git add` is **not** `git commit`. `add` *prepares* changes, `commit` *saves* them.
*   You can `git add` multiple times before committing. Each `add` updates the staging area.
*   Use `git status` to see what's staged and what's not.

### 5. Common Workflow:

1.  Modify C++ files (e.g., `main.cpp`, `Vector.h`, `Algorithm.cpp`).
2.  `git add` the files or parts of files you want in your next commit.
3.  `git status` (to double-check what's staged).
4.  Write your commit message in `commit.txt`
5.  `git commit -F commit.txt` (commit your changes locally)

### 6. C++ Specific Examples:

*   Stage changes in a header and a source file:

    ```bash
    git add MyClass.h MyClass.cpp
    ```

*   Stage all changes within the `src` directory:

    ```bash
    git add src/
    ```

*   Interactively stage specific changes within `main.cpp`:

    ```bash
    git add -p main.cpp
    ```

**In short, `git add` is an essential command for selecting the C++ code changes you want to include in your next commit, giving you fine-grained control over your project's history.**

[Back to Top](#using-git-and-github-classroom)

---

## `git commit`: Saving Your Changes

You will be using a text file named `commit.txt` to write your commit messages.

### 1. Writing Commit Messages

* As you work, _update_ a file named `commit.txt` in your repository with a detailed description of the changes you are making. This file will be used for your commit message. For each commit:
     * Write a _clear and descriptive commit message_ in `commit.txt`. Explain _what_ changes you made and _why_. Be specific!
     * Example:
       ```git
       feat: implement even/odd check and user input

       - Added input prompt for integer.
       - Implemented if-else structure to check for even/odd.
       - Added output to display the result
       ```
### 2. Committing Your Changes

* Stage your files with:
```bash
git add <filename>
```
* Commit using the message from the file:
```bash
git commit -F commit.txt
```
[Back to Top](#using-git-and-github-classroom)

---

## `git push`: Uploading Your Commits to a Remote Repository

`git push` is used to upload your local commits to a remote repository (like GitHub, GitLab, or Bitbucket). This shares your code with others and backs up your work.

### 1. What it Does:

*   Transmits your local branch's commits to a remote repository.
*   Updates the corresponding branch on the remote.
*   Makes your changes accessible to collaborators.

### 2. Basic Usage:

*   **Push your current branch to its corresponding remote branch (usually `origin/trunk` or `origin/main`):**

    ```bash
    git push origin trunk
    ```
    **Or if origin is set up:**
    ```bash
    git push
    ```

    This usually works if you have set up tracking information. You usually set up tracking information by cloning a repository.

*   **Push your current branch to a specific remote branch:**

    ```bash
    git push <remote> <branch>
    ```

    Example:

    ```bash
    git push origin trunk
    ```

    (pushes your local `trunk` branch to the `trunk` branch on the `origin` remote)

*   **Push a new branch to the remote for the first time:**

    ```bash
    git push -u <remote> <branch>
    ```

    Example:

    ```bash
    git push -u origin feature/new-algorithm
    ```

    (pushes a new branch named `feature/new-algorithm` to `origin` and sets up tracking)

    The `-u` flag sets up tracking, so you can just use `git push` for this branch in the future.

### 3. More Advanced Usage:

*   **Force push (use with extreme caution!):**

    ```bash
    git push --force
    ```

    or

    ```bash
    git push -f
    ```

    Overwrites the remote branch with your local branch, even if it means discarding commits on the remote. **Only use this if you're absolutely sure you know what you're doing.**

    Example:

    ```bash
    git push -f origin fix/typo-in-readme
    ```

### 4. Important Notes:

*   Make sure you've committed your changes before pushing.
*   `origin` is the default name for the remote repository you cloned from, but you can have multiple remotes.
*   If others are working on the same branch, you might need to `git pull` before you can push.

### 5. Common Workflow:

1.  `git add` (stage your changes)
2.  `git commit -m "Your commit message"` (commit your changes locally)
3.  `git push origin trunk` (or `git push` if tracking is set up)

### Example Scenario (C++ Project):

1.  You've made changes to `Sorting.cpp` and `Sorting.h`.
2.  You `git add Sorting.cpp Sorting.h`.
3.  You `git commit -m "feat(sorting): implement merge sort algorithm"`.
4.  You `git push origin trunk` to upload your new merge sort implementation to the remote repository.

[Back to Top](#using-git-and-github-classroom)

---

## `git pull`: Fetching and Merging Changes from a Remote Repository

`git pull` is used to download changes from a remote repository and merge them into your local branch. It's like updating your local copy with the latest changes from your team.

### 1. What it Does:

*   Fetches changes (commits) from a remote branch.
*   Merges those changes into your current local branch.
*   Essentially, it's a combination of `git fetch` followed by `git merge`.

### 2. Basic Usage:

*   **Pull changes from the corresponding remote branch of your current branch:**

    ```bash
    git pull
    ```

    This will work if you cloned a repository or your branch is tracking a remote branch.

*   **Pull changes from a specific remote branch:**

    ```bash
    git pull <remote> <branch>
    ```

    Example:

    ```bash
    git pull origin trunk
    ```

    (pulls changes from the `trunk` branch on `origin` into your current branch)

### 3. More Advanced Usage:

*   **Rebase instead of merging (for a cleaner history):**

    ```bash
    git pull --rebase
    ```

    This applies your local commits *on top of* the remote commits, avoiding a merge commit. Useful if you want a linear project history but should be used carefully.

### 4. Important Notes:

*   Make sure your working directory is clean (no uncommitted changes) before pulling, or you may need to stash your changes using `git stash`.
*   `git pull` can result in merge conflicts if you and your collaborators have modified the same parts of the same files.
*   If you get merge conflicts you will have to fix them before being able to complete the pull request.

### 5. Common Workflow:

1.  (Optional) `git stash` if you have uncommitted changes.
2.  `git pull origin trunk` (or just `git pull` if tracking is set up)
3.  Resolve any merge conflicts if they occur.
4.  (Optional) `git stash pop` to re-apply your stashed changes.

### Example Scenario (C++ Project):

1.  Your teammate has updated the `MathUtils.h` header file on the remote `trunk` branch.
2.  You run `git pull origin trunk` to download and merge their changes into your local `trunk` branch.
3.  If you both changed `MathUtils.h` in the same place, you'll need to resolve the conflicts using a merge tool or by manually editing the file.

**In summary, `git push` uploads your local commits to a remote repository, while `git pull` downloads and merges changes from a remote repository into your local branch. These two commands are fundamental for collaborating on projects using Git.**

[Back to Top](#using-git-and-github-classroom)
