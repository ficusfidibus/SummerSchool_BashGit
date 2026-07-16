# Unix, Bash & Git: Tools for Reproducible Science

Teaching materials for a hands-on session on the command line and version
control, developed for the **Summer School on Trends in Multi-Omics Data
Analysis for Microbial Ecology and Biotechnology (2026)**, presented on
16.07.2026.

The materials are aimed at researchers (e.g. in microbial ecology,
multi-omics, bioinformatics) who want to build reproducible, well-organized
computational workflows, and assume no prior command-line or Git
experience.

**Contact:** Breno L. S. de Almeida — brenoslivio@usp.br

## Contents

| Notebook | Description |
|---|---|
| [`Bash.ipynb`](Bash.ipynb) | Unix/Bash fundamentals: navigating the filesystem, file and directory management, searching, permissions, pipes/redirection, and shell scripts. |
| [`Git.ipynb`](Git.ipynb) | Git & GitHub fundamentals: setup, SSH authentication, the edit–add–commit–push–pull cycle, branching and merging, `.gitignore`, reverting changes, and opening a pull request. |

Both notebooks are written to run top-to-bottom in **Google Colab**
(they include `!apt`/`!pip`-style setup cells), but also work in any local
Jupyter environment with a Unix-like shell (Linux or macOS).

### `Bash.ipynb`

Covers the core Unix/Bash toolkit through short demos followed by
exercises (with solutions):

1. Setting up a practice sandbox (`~/bash_practice`) so exercises,
   including destructive ones like `rm -r`, are safe to run.
2. Example commands, grouped by topic:
   - Navigating the filesystem (`pwd`, `cd`, `ls`)
   - Getting help & system info (`man`, `htop`, `date`, `free`, `--help`)
   - Creating & removing directories/files (`mkdir`, `rmdir`, `rm`, `mv`, `touch`, `nano`)
   - Viewing file content (`cat`, `head`, `tail`, `less`, `wc`)
   - Searching (`find`, `grep`)
   - Copying, moving, hiding & removing files (`cp`, `mv`, `rm`)
   - Disk usage (`du`, `df`)
   - Permissions (`ls -l`, `chmod`)
   - Pipes & redirection (`|`, `>`, `>>`, `-exec`, `xargs`)
   - Shell scripts (shebang, variables, command substitution, heredocs)
3. A **capstone project**: organize a folder of mock sequencing sample
   files, audit their QC status with `grep`/`wc`, and produce a
   read-only summary report via a small shell script — combining
   everything from the notebook into one realistic mini-workflow.

A note in the notebook flags which commands (`nano`, `htop`, `less`,
`more`, `man`) are interactive, full-screen programs that need a real
terminal rather than a notebook cell, and shows notebook-friendly
substitutes.

### `Git.ipynb`

Builds directly on `Bash.ipynb` and walks through a complete Git/GitHub
workflow:

1. Installing and configuring Git (`git config`).
2. Creating a GitHub repository, generating an SSH key, cloning over
   SSH, and (optionally) signing commits with SSH.
3. The everyday workflow: editing files, `git add`/`commit`, and
   `git push`/`pull`.
4. Branches: creating/switching branches, working in isolation, and
   merging back into `main`.
5. `.gitignore`, for keeping generated files, secrets, and large files
   out of version control.
6. Reverting changes: `git log`, the safe `git revert`, and the
   dangerous `git reset --hard` (demonstrated on a disposable branch).
7. A **capstone project**: fork this repository, add a file to the
   `students/` folder on a new branch, and open your first **pull
   request** back to the class roster.

Because Google Colab runs each cell in a fresh subprocess, the notebook
explains why remote-facing cells (`clone`, `push`, `pull`) chain
`ssh-agent` startup and `ssh-add` into a single `!command && \ ...` line,
while local-only cells can use `%%bash` normally.

## Repository structure

```
.
├── Bash.ipynb      # Unix/Bash notebook
├── Git.ipynb       # Git/GitHub notebook
├── students/       # Class roster — target of the Git capstone pull-request exercise
├── LICENSE         # MIT License
└── README.md
```

## Running the notebooks

- **Google Colab (recommended for the class):** open each notebook via
  Colab's *File → Open notebook → GitHub* and run cells top to bottom.
  Colab provides a real Ubuntu VM, so tools like `nano` and `htop` can
  also be tried in Colab's terminal, not just the notebook cells.
- **Local Jupyter:** clone this repository and open the notebooks with
  `jupyter notebook` / `jupyter lab` on a Linux or macOS machine (or WSL
  on Windows). A few interactive commands (`nano`, `htop`, `less`,
  `man`) should be run in a separate terminal window rather than inside
  a notebook cell.

## License

Released under the [MIT License](LICENSE).
