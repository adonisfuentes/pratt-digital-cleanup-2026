# Workshop 02 — Digital Folder Cleanup & Organization

## About

In the second half of the workshop, we focus primarily on **best practices for organizing your current folder structure**. We'll walk through examples of how to develop that structure using the **Johnny Decimal system** and how to maintain it effectively for future use — including automating aspects to help you keep your structure up to date as you create and add new items to your digital workspace.

The example we'll use throughout this workshop is a common scenario for MLIS students: **managing your job search materials** — multiple résumés tailored to different types of positions, cover letters for specific openings, portfolio pieces, and application tracking across public libraries, archives, academic libraries, and UX roles.

### Resources

- **Johnny Decimal System** — [johnnydecimal.com](https://johnnydecimal.com/)
- **Homebrew** — [brew.sh](https://brew.sh/)
- **NPM** — [npmjs.com](https://www.npmjs.com/)

---

## Tools

The tools required for this workshop:

- **Terminal**
- **Finder**
- **Homebrew / NPM**

---

## Step 01 — Setting Up Workspace Environment

To start the workshop, we'll first set up our workspace environment and help you develop the structure. Then we'll go into more depth about the structure we'll use, how we'll use it, and what tools we'll need.

We'll use **Terminal**, **Finder**, **Brew**, and **NPM**.

> **Note:** This half of the workshop is primarily aimed at **Mac users**, since the setup is much easier. Setting up a Windows environment is a different process because Homebrew is not typically used on PCs.

---

## Step 02 — What Is the Johnny Decimal System?

The **Johnny Decimal** system is an organizational method where you assign unique numerical IDs (like `15.52`) to everything in your life, using a structure of **areas**, **categories**, and **individual items**.

Here's how it works:

- **Areas** are numbered in tens (`10-19`, `20-29`, etc.)
- Each area contains up to **10 categories**
- Each category holds **numbered items**

Think of it like shelves holding boxes holding folders.

The constraint of **"no more than ten"** at each level prevents the chaotic nesting of folders that makes things impossible to find. The short, memorable IDs (spoken as "fifteen fifty-two") make it easy to communicate locations, maintain consistent organization, and quickly locate anything in your system.

### Example Structure — MLIS Job Search

Imagine you're graduating and applying to a mix of positions: reference librarian roles at public libraries, processing archivist positions, digital services roles at academic libraries, and UX research positions in tech. Your materials need to be organized, versioned, and easy to find at a moment's notice.

```
10-19 Résumés/
├── 11 Base Résumés/
│   ├── 11.01 Public Library
│   ├── 11.02 Academic Library
│   ├── 11.03 Archives
│   ├── 11.04 UX Research
│   └── 11.05 Metadata & Cataloging
├── 12 Résumé Assets/
│   ├── 12.01 Summary Variants
│   ├── 12.02 Skills List
│   └── 12.03 ATS Templates

20-29 Cover Letters/
├── 21 Templates/
│   ├── 21.01 Public Library
│   ├── 21.02 Academic Library
│   ├── 21.03 Archives
│   └── 21.04 UX & Tech
├── 22 Submitted Letters/
│   ├── 22.01 BPL Youth Services
│   ├── 22.02 NYU Digital Scholarship
│   ├── 22.03 NYPL Archives Processing
│   └── 22.04 MoMA UX Research

30-39 Portfolio & Work Samples/
├── 31 Projects/
│   ├── 31.01 Omeka Digital Exhibit
│   ├── 31.02 EAD Finding Aid
│   ├── 31.03 Library Usability Study
│   ├── 31.04 Dublin Core Schema
│   └── 31.05 Community Data Viz
├── 32 Writing Samples/
│   ├── 32.01 Information Behavior Paper
│   └── 32.02 Open Access Brief
├── 33 Presentations/
│   ├── 33.01 SAA Conference Poster
│   └── 33.02 ASIS&T Lightning Talk

40-49 Job Applications/
├── 41 Active Applications/
│   ├── 41.01 BPL Youth Services
│   ├── 41.02 NYU Digital Scholarship
│   ├── 41.03 NYPL Archives Processing
│   └── 41.04 MoMA UX Research
├── 42 Application Tracker/
│   └── 42.01 Master Tracker
├── 43 Networking/
│   ├── 43.01 Interview Notes
│   └── 43.02 Conference Contacts

50-59 References & Credentials/
├── 51 References/
│   ├── 51.01 Dr. Chen Faculty
│   ├── 51.02 Library Practicum Supervisor
│   └── 51.03 Project Lead Peer
├── 52 Credentials/
│   ├── 52.01 Unofficial Transcript
│   ├── 52.02 Archival Description Cert
│   └── 52.03 Digital Preservation Cert
```

---

## Step 03 — Creating Your Folder Structure via Command Line

Now we'll use **Terminal** to create our Johnny Decimal folder structure. This is faster and more consistent than clicking through Finder.

### Basic Commands

| Command    | Description              | Example                                    |
|------------|--------------------------|--------------------------------------------|
| `mkdir`    | Make directory           | `mkdir "11 Base Résumés"`                  |
| `mkdir -p` | Make nested directories  | `mkdir -p "10-19 Résumés/11 Base Résumés"` |
| `cd`       | Change directory         | `cd ~/Documents`                           |
| `ls`       | List contents            | `ls -la`                                   |
| `mv`       | Move/rename files        | `mv old.pdf new.pdf`                       |

### Creating a Complete Structure Manually

Open Terminal and run the following commands one by one:

```bash
# Navigate to Documents
cd ~/Documents

# Create the main Johnny.Decimal folder
mkdir "JD-Workshop"
cd "JD-Workshop"

# Create Areas
mkdir "10-19 Résumés"
mkdir "20-29 Cover Letters"
mkdir "30-39 Portfolio & Work Samples"
mkdir "40-49 Job Applications"
mkdir "50-59 References & Credentials"
```

Now create **categories** within Résumés:

```bash
cd "10-19 Résumés"
mkdir "11 Base Résumés"
mkdir "12 Résumé Assets"
```

And create **IDs** (individual items) within Base Résumés:

```bash
cd "11 Base Résumés"
mkdir "11.01 Public Library"
mkdir "11.02 Academic Library"
mkdir "11.03 Archives"
mkdir "11.04 UX Research"
mkdir "11.05 Metadata & Cataloging"
```

> **Tip:** Notice how the numbering works — `11` is the category, and `.01`, `.02`, `.03` are the individual items within that category. Each résumé variant lives in its own folder so you can keep drafts, final versions, and exported PDFs together.

### Using a Script to Build Everything at Once

Instead of typing each command manually, you can create a script that builds the whole structure for you.

Create a file called `build-structure.sh`:

```bash
#!/bin/bash

# Johnny.Decimal Structure Builder — MLIS Job Search
BASE_DIR="$HOME/Documents/JD-MLIS-Job-Search"

# Create base directory
mkdir -p "$BASE_DIR"
cd "$BASE_DIR"

# ===== AREAS =====
mkdir -p "10-19 Résumés"
mkdir -p "20-29 Cover Letters"
mkdir -p "30-39 Portfolio & Work Samples"
mkdir -p "40-49 Job Applications"
mkdir -p "50-59 References & Credentials"

# ===== CATEGORIES — Résumés =====
mkdir -p "10-19 Résumés/11 Base Résumés"
mkdir -p "10-19 Résumés/12 Résumé Assets"

# ===== CATEGORIES — Cover Letters =====
mkdir -p "20-29 Cover Letters/21 Templates"
mkdir -p "20-29 Cover Letters/22 Submitted Letters"

# ===== CATEGORIES — Portfolio =====
mkdir -p "30-39 Portfolio & Work Samples/31 Projects"
mkdir -p "30-39 Portfolio & Work Samples/32 Writing Samples"
mkdir -p "30-39 Portfolio & Work Samples/33 Presentations"

# ===== CATEGORIES — Applications =====
mkdir -p "40-49 Job Applications/41 Active Applications"
mkdir -p "40-49 Job Applications/42 Application Tracker"
mkdir -p "40-49 Job Applications/43 Networking"

# ===== CATEGORIES — References =====
mkdir -p "50-59 References & Credentials/51 References"
mkdir -p "50-59 References & Credentials/52 Credentials"

echo "Structure created at: $BASE_DIR"
```

Run it:

```bash
chmod +x build-structure.sh
./build-structure.sh
```

---

## Step 04 — Automating Folder Creation from a Text File

This is where things get powerful. Instead of manually typing each folder, you can **define your entire structure in a simple text file** and generate it automatically.

### Create Your Structure Definition File

Create a file called `my-structure.txt`:

```text
# ===== Résumés =====
10-19 Résumés
10-19 Résumés/11 Base Résumés
10-19 Résumés/11 Base Résumés/11.01 Public Library
10-19 Résumés/11 Base Résumés/11.02 Academic Library
10-19 Résumés/11 Base Résumés/11.03 Archives
10-19 Résumés/11 Base Résumés/11.04 UX Research
10-19 Résumés/11 Base Résumés/11.05 Metadata & Cataloging
10-19 Résumés/12 Résumé Assets
10-19 Résumés/12 Résumé Assets/12.01 Summary Variants
10-19 Résumés/12 Résumé Assets/12.02 Skills List
10-19 Résumés/12 Résumé Assets/12.03 ATS Templates

# ===== Cover Letters =====
20-29 Cover Letters
20-29 Cover Letters/21 Templates
20-29 Cover Letters/21 Templates/21.01 Public Library
20-29 Cover Letters/21 Templates/21.02 Academic Library
20-29 Cover Letters/21 Templates/21.03 Archives
20-29 Cover Letters/21 Templates/21.04 UX & Tech
20-29 Cover Letters/22 Submitted Letters
20-29 Cover Letters/22 Submitted Letters/22.01 BPL Youth Services
20-29 Cover Letters/22 Submitted Letters/22.02 NYU Digital Scholarship
20-29 Cover Letters/22 Submitted Letters/22.03 NYPL Archives Processing
20-29 Cover Letters/22 Submitted Letters/22.04 MoMA UX Research

# ===== Portfolio =====
30-39 Portfolio & Work Samples
30-39 Portfolio & Work Samples/31 Projects
30-39 Portfolio & Work Samples/31 Projects/31.01 Omeka Digital Exhibit
30-39 Portfolio & Work Samples/31 Projects/31.02 EAD Finding Aid
30-39 Portfolio & Work Samples/31 Projects/31.03 Library Usability Study
30-39 Portfolio & Work Samples/31 Projects/31.04 Dublin Core Schema
30-39 Portfolio & Work Samples/31 Projects/31.05 Community Data Viz
30-39 Portfolio & Work Samples/32 Writing Samples
30-39 Portfolio & Work Samples/32 Writing Samples/32.01 Information Behavior Paper
30-39 Portfolio & Work Samples/32 Writing Samples/32.02 Open Access Brief
30-39 Portfolio & Work Samples/33 Presentations
30-39 Portfolio & Work Samples/33 Presentations/33.01 SAA Conference Poster
30-39 Portfolio & Work Samples/33 Presentations/33.02 ASIS&T Lightning Talk

# ===== Applications =====
40-49 Job Applications
40-49 Job Applications/41 Active Applications
40-49 Job Applications/41 Active Applications/41.01 BPL Youth Services
40-49 Job Applications/41 Active Applications/41.02 NYU Digital Scholarship
40-49 Job Applications/41 Active Applications/41.03 NYPL Archives Processing
40-49 Job Applications/41 Active Applications/41.04 MoMA UX Research
40-49 Job Applications/42 Application Tracker
40-49 Job Applications/42 Application Tracker/42.01 Master Tracker
40-49 Job Applications/43 Networking
40-49 Job Applications/43 Networking/43.01 Interview Notes
40-49 Job Applications/43 Networking/43.02 Conference Contacts

# ===== References =====
50-59 References & Credentials
50-59 References & Credentials/51 References
50-59 References & Credentials/51 References/51.01 Dr. Chen Faculty
50-59 References & Credentials/51 References/51.02 Library Practicum Supervisor
50-59 References & Credentials/51 References/51.03 Project Lead Peer
50-59 References & Credentials/52 Credentials
50-59 References & Credentials/52 Credentials/52.01 Unofficial Transcript
50-59 References & Credentials/52 Credentials/52.02 Archival Description Cert
50-59 References & Credentials/52 Credentials/52.03 Digital Preservation Cert
```

Each line represents a folder path. The script will read each line and create the folder for you.

### Bash Script to Generate Folders from Text File

Create a file called `generate-from-txt.sh`:

```bash
#!/bin/bash

INPUT_FILE="$1"
DEST_DIR="${2:-$HOME/Documents/JD-Generated}"

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File not found"
    exit 1
fi

mkdir -p "$DEST_DIR"

while IFS= read -r line || [ -n "$line" ]; do
    [[ -z "$line" || "$line" =~ ^# ]] && continue
    mkdir -p "$DEST_DIR/$line"
    echo "Created: $line"
done < "$INPUT_FILE"

echo "Structure generated at: $DEST_DIR"
```

Run it:

```bash
chmod +x generate-from-txt.sh
./generate-from-txt.sh my-structure.txt ~/Documents/MLIS-Job-Search
```

> **What's happening here:** The script reads each line from `my-structure.txt`, skips any blank lines or comments (lines starting with `#`), and creates the corresponding folder. The `mkdir -p` flag ensures all parent folders are created automatically.

---

## Step 05 — Batch Renaming Files to Match Johnny Decimal

Often you'll have existing files that need to be renamed to fit your new system. Here's how to automate that.

### Create a Rename Mapping File

Create a file called `rename-map.txt`. Each line has the **old filename** and the **new filename**, separated by a `|` character:

```text
resume_final_v3.pdf|11.01 Public Library Resume.pdf
resume-academic-draft2.docx|11.02 Academic Library Resume.docx
cover-letter-bpl.pdf|22.01 BPL Youth Services.pdf
omeka-exhibit-screenshots.zip|31.01 Omeka Digital Exhibit.zip
prof-chen-reference-letter.pdf|51.01 Dr. Chen Faculty.pdf
transcript-unofficial-2026.pdf|52.01 Unofficial Transcript.pdf
```

### Create the Batch Rename Script

Create a file called `batch-rename.sh`:

```bash
#!/bin/bash

MAP_FILE="$1"
TARGET_DIR="${2:-.}"

cd "$TARGET_DIR"

while IFS='|' read -r old_name new_name; do
    [[ -z "$old_name" ]] && continue
    if [ -f "$old_name" ]; then
        mv "$old_name" "$new_name"
        echo "Renamed: $old_name -> $new_name"
    fi
done < "$MAP_FILE"
```

Run it:

```bash
chmod +x batch-rename.sh
./batch-rename.sh rename-map.txt ~/Downloads
```

---

## Step 06 — Maintaining Your System

### Create an Index File

Keep a master index that tracks all your IDs. This script scans your folder structure and generates a markdown index:

```bash
#!/bin/bash

# Generate Johnny.Decimal Index
echo "# My MLIS Job Search — Johnny.Decimal Index" > INDEX.md
echo "Last updated: $(date)" >> INDEX.md

find . -type d | sort | while read dir; do
    depth=$(echo "$dir" | tr -cd '/' | wc -c)
    name=$(basename "$dir")
    echo "- ${name}" >> INDEX.md
done

echo "INDEX.md generated!"
```

### Quick Add Script

Create a script to quickly add new items to your system without navigating through folders:

```bash
#!/bin/bash

# Usage: ./jd-add.sh "22.05" "Pratt Digital Archivist"
ID="$1"
NAME="$2"
BASE="$HOME/Documents/JD-MLIS-Job-Search"

CATEGORY="${ID%.*}"
CATEGORY_PATH=$(find "$BASE" -type d -name "${CATEGORY} *" | head -1)

FULL_PATH="$CATEGORY_PATH/${ID} ${NAME}"
mkdir -p "$FULL_PATH"
echo "Created: ${ID} ${NAME}"
```

### Practical Tips for MLIS Job Seekers

- **Version your résumés.** When you update a résumé, keep the previous version in the same folder with a date suffix (e.g., `resume_2026-03.pdf`, `resume_2026-04.pdf`). The JD ID stays the same — the folder is the anchor.
- **Mirror cover letters to applications.** Use the same JD number in `22 Submitted Letters` and `41 Active Applications` when they belong to the same job. For instance, `22.01` and `41.01` both refer to the Brooklyn Public Library application.
- **Track everything in `42.01`.** A simple spreadsheet with columns for **Organization**, **Position**, **Date Applied**, **Status**, **Follow-Up Date**, and the **JD IDs** of related résumé/cover letter folders ties everything together.
- **Portfolio pieces are reusable.** Your `30-39` area should contain finished, polished work samples. When you apply to a job, reference the relevant `31.xx` or `32.xx` ID — don't duplicate files across application folders.

---

## Quick Reference Card

| Task                 | Command                                        |
|----------------------|------------------------------------------------|
| Create folder        | `mkdir "11.01 Public Library"`                 |
| Create nested folders| `mkdir -p "Area/Category/Item"`                |
| Rename file          | `mv "old.pdf" "11.01 Resume.pdf"`             |
| List all folders     | `find . -type d \| sort`                       |
| Generate index       | `tree -d > INDEX.txt`                          |
| Open in Finder       | `open .`                                       |

---

## Workshop Exercise

**Your Task:** Create a Johnny Decimal structure for your own MLIS job search.

1. Open **Terminal**
2. Navigate to Documents: `cd ~/Documents`
3. Create your structure using the scripts provided
4. Customize the areas and categories for **the types of positions you're targeting** (public library, academic, archives, UX, special collections, etc.)
5. Move 3–5 existing files (résumés, cover letters, project samples) into your new system
6. Generate an `INDEX.md` file

### Bonus

Create a shell alias for quick access:

```bash
echo 'alias jd="cd ~/Documents/JD-MLIS-Job-Search && ls"' >> ~/.zshrc
source ~/.zshrc
```

Now just type `jd` to jump to your organized job search system!
