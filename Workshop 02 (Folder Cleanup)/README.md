# Workshop 02 — Digital Folder Cleanup & Organization

## About

In this workshop, we focus on **best practices for organizing your current folder structure**. We'll walk through how to develop a system using the **Johnny Decimal method**, how to maintain it, and how to automate parts of it using simple scripts you can run in Terminal.


> **Who is this for?** This guide assumes you've **never used Terminal before**. Every step is explained from scratch. If you already know what `mkdir` does, feel free to skip ahead.

### Resources

- **Johnny Decimal System** — [johnnydecimal.com](https://johnnydecimal.com/)
- **Johnny Decimal Generator** — [johnny-decimal-generator.netlify.app](https://johnny-decimal-generator.netlify.app) *(drag-and-drop tool to plan your structure visually)*
- **Homebrew** — [brew.sh](https://brew.sh/)
- **NPM** — [npmjs.com](https://www.npmjs.com/)

---

## Tools

The tools used in this workshop:

- **Terminal** — the command-line app built into every Mac (find it in Applications → Utilities → Terminal)
- **Finder** — your regular file browser
- **Homebrew** — a package manager that lets you install tools from Terminal
- **NPM** — a package manager for JavaScript tools

---

## Step 01 — Getting Your Tools Ready

Before we organize anything, let's make sure your Mac is set up with the tools we'll need. This section walks you through installing **Homebrew**, **NPM**, and the **`tree`** command.

> **Note:** This workshop is primarily aimed at **Mac users**. Windows setup is a separate process because Homebrew is not available on PCs.

### What is Terminal?

Terminal is a text-based way to interact with your computer. Instead of clicking folders in Finder, you type commands. It looks intimidating at first, but you only need a handful of commands to get started.

To open Terminal:
1. Press `Cmd + Space` to open Spotlight
2. Type "Terminal" and press Enter

You'll see a window with a blinking cursor. That's it — you're ready.

### Installing Homebrew

Homebrew is a tool that lets you install other tools from Terminal. Think of it like an App Store for command-line programs.

Paste this into Terminal and press Enter:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

It will ask for your Mac password (the one you use to log in). When you type it, **nothing will appear on screen** — that's normal. Just type it and press Enter.

To verify it installed correctly:

```bash
brew --version
```

You should see something like `Homebrew 4.x.x`.

### Installing Node.js & NPM

NPM comes bundled with Node.js. Install it through Homebrew:

```bash
brew install node
```

Verify it worked:

```bash
node --version
npm --version
```

### Installing `tree` — See All Your Files at a Glance

This is one of the most useful tools for this workshop. The `tree` command shows your entire folder structure visually, right in Terminal.

```bash
brew install tree
```

Now try it out — navigate to any folder and run:

```bash
tree ~/Desktop
```

You'll see something like:

```
Desktop/
├── Screenshot 2026-01-15.png
├── Screenshot 2026-02-03.png
├── homework_final.docx
├── homework_final_v2.docx
├── random_notes.txt
└── untitled folder/
    └── more stuff/
        └── old_resume.pdf
```

This gives you an instant overview of what's in any folder. We'll use `tree` throughout this workshop to check our work.

### Basic Terminal Commands

Here are the only commands you need to know for this workshop:

| Command    | What It Does              | Example                        |
|------------|---------------------------|--------------------------------|
| `cd`       | Go to a folder            | `cd ~/Documents`               |
| `ls`       | List what's in a folder   | `ls`                           |
| `ls -la`   | List with details         | `ls -la`                       |
| `mkdir`    | Create a folder           | `mkdir "My Folder"`            |
| `mkdir -p` | Create nested folders     | `mkdir -p "Folder/Subfolder"`  |
| `mv`       | Move or rename a file     | `mv old.pdf new.pdf`           |
| `tree`     | Show folder tree          | `tree -d`  *(folders only)*    |
| `open .`   | Open current folder in Finder | `open .`                   |

> **Tip:** The `~` symbol means your home folder (e.g., `/Users/yourname`). So `~/Documents` is your Documents folder.

### How to Run a Script File (.sh)

Throughout this workshop, we'll use `.sh` script files to automate folder creation. Here's how to run them:

```bash
# Option 1 — Run with bash or zsh directly
bash script.sh

# Option 2 — Make it executable, then run it
chmod +x script.sh
./script.sh
```

Either method works. Option 1 is simpler if you're just getting started.

---

## Step 02 — Define Your System & Discovery

Before creating any folders, you need to understand **what you're organizing** and **how you actually use your files**. This is the most important step — skip it and you'll end up with a pretty structure that doesn't match how you work.

### Define Your System's Scope

First, decide the boundary. What part of your digital life are you organizing?

Pick **one** to start:
- 📁 Your entire `Documents` folder
- 📁 Your `Downloads` folder (the graveyard of forgotten files)
- 📁 A specific project (like a semester's coursework)
- 📁 Your job search materials

Don't try to organize everything at once. **Start with one area.**

### Discovery — Track What You Actually Do

**Action:** For at least **one week**, write down everything you do (or need to do) within the scope you've defined.

Keep a simple list — on paper, in Notes, wherever. Track things like:

- What files did you download today? Where did they go?
- What did you search for and couldn't find?
- What folders did you open most often?
- What did you rename or move?
- What files are duplicates you keep re-creating?

After a week, you'll see patterns. Those patterns become your **areas** and **categories**.

---

## Step 03 — Creating the Structure

Now the fun part. We'll go from a **messy, real-world folder** to an **organized Johnny Decimal system**, and then create a **script to build it automatically**.

### What Is the Johnny Decimal System?

The **Johnny Decimal** system gives every folder a unique number so you always know where things are. It has three levels:

- **Areas** — broad groups, numbered in tens (`10-19`, `20-29`, `30-39`)
- **Categories** — topics within an area (`11`, `12`, `13`, etc.)
- **IDs** — individual items (`11.01`, `11.02`, etc.)

The key rule: **no more than 10 things at each level.** This forces you to keep things simple and prevents the endless nesting that makes folders impossible to navigate.

### Planning Your Structure with the Johnny Decimal Generator

Before creating any folders, we're going to use the **[Johnny Decimal Generator](https://johnny-decimal-generator.netlify.app)** to visually plan our structure. This is a free drag-and-drop tool that lets you experiment with areas and categories without touching any files yet.

**How to use it:**

1. Open the generator: [johnny-decimal-generator.netlify.app](https://johnny-decimal-generator.netlify.app)
2. Click **"Add Area"** to create your broad groups (e.g., `Life Admin`, `My Hobby`)
3. Under each area, click **"Add Category"** to add topics (e.g., under `Life Admin` → `House`, `Finance`)
4. Drag and drop to rearrange until it feels right
5. The tool automatically assigns the Johnny Decimal numbers for you

**When you're done, your index will look something like this:**

```
10-19 Life Admin
   11 House
   12 Finance
   13 Motor
   14 Health
   15 Travel
20-29 My Hobby
   21 Research
   22 Promotion
   23 Sales
30-39 My Side-Hustle
   31 Build It
   32 Ship It
```

**Save your index as a text file:**

1. Copy the index output from the generator
2. Open a text editor (TextEdit on Mac, or any code editor)
3. Paste it in and save as `my-index.txt` in your Documents folder

You can also do this from Terminal:

```bash
# Create your index file — paste your index between the quotes
cat > ~/Documents/my-index.txt << 'EOF'
10-19 Life Admin
   11 House
   12 Finance
   13 Motor
   14 Health
   15 Travel
20-29 My Hobby
   21 Research
   22 Promotion
   23 Sales
30-39 My Side-Hustle
   31 Build It
   32 Ship It
EOF
```

> **Why save this?** Your index file is your **map**. When you're unsure where a file should go, check your index. When you need to add a new category, update the index first, then create the folder.

### Before: The Messy Folder

Here's what a typical person's Documents folder looks like. Sound familiar?

```
Documents/
├── car_insurance_renewal.pdf
├── lease_scan.pdf
├── taxes_2025.pdf
├── dentist_receipt.jpg
├── hobby_notes.txt
├── etsy_sales_jan.csv
├── some ideas/
│   ├── project_sketch.png
│   └── notes_v2.txt
├── important maybe/
│   ├── passport_photo.jpg
│   └── old_electric_bill.pdf
└── random/
    ├── travel_itinerary.pdf
    └── oil_change_receipt.pdf
```

**Problems:**
- Life admin, hobbies, and side-hustle files all mixed together
- Subfolders with vague names (`some ideas`, `important maybe`, `random`)
- No consistent naming pattern
- No way to know where a new file should go

### After: The Organized Structure

Using Johnny Decimal, we group everything into clear areas:

```
My System/
├── 10-19 Life Admin/
│   ├── 11 House/
│   │   ├── 11.01 Lease/
│   │   ├── 11.02 Electric/
│   │   └── 11.03 Internet/
│   ├── 12 Finance/
│   │   └── 12.01 Taxes/
│   ├── 13 Motor/
│   │   ├── 13.01 Insurance/
│   │   └── 13.02 Service/
│   ├── 14 Health/
│   │   └── 14.01 Receipts/
│   └── 15 Travel/
│       └── 15.01 Upcoming/
│
├── 20-29 My Hobby/
│   ├── 21 Research/
│   ├── 22 Promotion/
│   │   ├── 22.01 Social Media/
│   │   └── 22.02 Newsletter/
│   └── 23 Sales/
│
└── 30-39 My Side-Hustle/
    ├── 31 Build It/
    └── 32 Ship It/
```

**What changed:**
- Every file has a **home** — you never wonder where to save something
- Related files are **grouped** (all life admin lives in `10-19`, hobby stuff in `20-29`)
- The numbering makes things **findable** — "my car insurance is in `13.01`"
- Each area of your life is **cleanly separated**

### Building It Manually (Step by Step)

Open Terminal and try creating a few folders to get comfortable:

```bash
# Go to Documents
cd ~/Documents

# Create the top-level folder
mkdir "My System"
cd "My System"

# Create areas
mkdir "10-19 Life Admin"
mkdir "20-29 My Hobby"
mkdir "30-39 My Side-Hustle"
```

Now create **categories** inside Life Admin:

```bash
cd "10-19 Life Admin"
mkdir "11 House"
mkdir "12 Finance"
mkdir "13 Motor"
mkdir "14 Health"
mkdir "15 Travel"
```

And create **IDs** inside House:

```bash
cd "11 House"
mkdir "11.01 Lease"
mkdir "11.02 Electric"
mkdir "11.03 Internet"
```

Check your work with `tree`:

```bash
cd ~/Documents/"My System"
tree
```

> **Tip:** You don't have to type the whole folder name. Type the first few letters and press `Tab` — Terminal will autocomplete it for you.

### Building It with a Script (The Easy Way)

Typing each folder manually gets tedious. Instead, use a script to build everything at once.

There's a sample script included with this workshop called `build-structure.sh`. Here's how to use it:

**1. Open the script in a text editor and customize it for your needs**

The script looks like this:

```bash
#!/bin/bash

# Johnny Decimal Structure Builder — My System
BASE_DIR="$HOME/Documents/My System"

# Create base directory
mkdir -p "$BASE_DIR"
cd "$BASE_DIR"

# ===== AREAS =====
mkdir -p "10-19 Life Admin"
mkdir -p "20-29 My Hobby"
mkdir -p "30-39 My Side-Hustle"

# ===== CATEGORIES — Life Admin =====
mkdir -p "10-19 Life Admin/11 House"
mkdir -p "10-19 Life Admin/12 Finance"
mkdir -p "10-19 Life Admin/13 Motor"
mkdir -p "10-19 Life Admin/14 Health"
mkdir -p "10-19 Life Admin/15 Travel"

# ===== CATEGORIES — My Hobby =====
mkdir -p "20-29 My Hobby/21 Research"
mkdir -p "20-29 My Hobby/22 Promotion"
mkdir -p "20-29 My Hobby/23 Sales"

# ===== CATEGORIES — My Side-Hustle =====
mkdir -p "30-39 My Side-Hustle/31 Build It"
mkdir -p "30-39 My Side-Hustle/32 Ship It"

echo "Structure created at: $BASE_DIR"
```

**2. Run it:**

```bash
bash build-structure.sh
```

That's it — your entire folder structure is created in seconds.

**3. Verify it worked:**

```bash
tree ~/Documents/"My System"
```

### Moving Your Existing Files

Now that the structure exists, move your files into it:

```bash
# Move your lease into the right folder
mv ~/Documents/lease_scan.pdf ~/Documents/"My System"/"10-19 Life Admin"/"11 House"/"11.01 Lease"/

# Move tax documents
mv ~/Documents/taxes_2025.pdf ~/Documents/"My System"/"10-19 Life Admin"/"12 Finance"/"12.01 Taxes"/

# Move car insurance
mv ~/Documents/car_insurance_renewal.pdf ~/Documents/"My System"/"10-19 Life Admin"/"13 Motor"/"13.01 Insurance"/

# Move hobby research
mv ~/Documents/hobby_notes.txt ~/Documents/"My System"/"20-29 My Hobby"/"21 Research"/
```

> **Tip:** You can also just drag files in Finder — now that the folders exist, Finder works great for moving things around. Use Terminal for creating structure, Finder for day-to-day file management.

---

## Step 04 — Maintaining Your System

### Create an Index File

Keep a master index that tracks all your IDs. This script scans your folder structure and generates a markdown index:

```bash
#!/bin/bash

# Generate Johnny Decimal Index
echo "# My System — Johnny Decimal Index" > INDEX.md
echo "Last updated: $(date)" >> INDEX.md

find . -type d | sort | while read dir; do
    depth=$(echo "$dir" | tr -cd '/' | wc -c)
    name=$(basename "$dir")
    echo "- ${name}" >> INDEX.md
done

echo "INDEX.md generated!"
```

Save this as `generate-index.sh` in your `My System` folder and run it:

```bash
cd ~/Documents/"My System"
bash generate-index.sh
```

This creates an `INDEX.md` file listing every folder in your system. Run it any time you add new folders to keep your index up to date.

### Practical Tips

- **Version your files with dates**, not words. Use `taxes_2025.pdf` instead of `taxes_final_FINAL.pdf`.
- **One file, one home.** Every file should live in exactly one place. If you're unsure, check your index.
- **Don't duplicate files.** If a file is relevant to multiple categories, pick the best one and keep it there.
- **Update your index first.** When you need a new category, add it to `my-index.txt` before creating the folder.

---

## Step 05 — Quick Reference Card

| Task                  | Command                                            |
|-----------------------|----------------------------------------------------|
| Create folder         | `mkdir "11.01 Lease"`                              |
| Create nested folders | `mkdir -p "Area/Category/Item"`                    |
| Rename file           | `mv "old.pdf" "13.01 Insurance.pdf"`               |
| Move a file           | `mv file.pdf "destination/folder/"`                |
| List folder contents  | `ls -la`                                           |
| Show folder tree      | `tree -d`                                          |
| Run a script          | `bash script.sh`                                   |
| Open folder in Finder | `open .`                                           |

---

## Step 06 — Workshop Exercise

**Your Task:** Create a Johnny Decimal structure for your own digital cleanup.

1. **Define your scope** — pick one area of your digital life to organize
2. **Plan your structure** — use the [Johnny Decimal Generator](https://johnny-decimal-generator.netlify.app) to sketch it out
3. **Customize the sample script** — edit `build-structure.sh` to match your plan
4. **Run the script** — `bash build-structure.sh`
5. **Move 3–5 existing files** into your new system
6. **Verify with `tree`** — run `tree -d` to see the result
