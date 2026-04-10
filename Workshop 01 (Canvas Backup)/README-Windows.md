# Workshop 01 — How to Back Up Your Canvas (Windows)

## About

This is the **Windows version** of the workshop. If you're on a Mac, see the main [README.md](./README.md) instead.

This workshop is intended to show you how to **download all of your Canvas assignments and materials from all your courses** so you can preserve your work.

### Resources

- **Canvas Student Data Export** — [github.com/davekats/canvas-student-data-export](https://github.com/davekats/canvas-student-data-export)
- **Canvas API Policy** — [instructure.com/policies/canvas-api-policy](https://www.instructure.com/policies/canvas-api-policy)
- **Python** — [python.org](https://www.python.org/)
- **Node.js & NPM** — [docs.npmjs.com/downloading-and-installing-node-js-and-npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)

---

## Tools

The tools required for this workshop:

- **PowerShell** or **Command Prompt**
- **Python & NPM**
- **Browser**

---

## Step 01 — Set Up Laptop Environment

On Windows, you'll need to install **Python** and **Node.js (which includes NPM)** before we begin.

### Install Python

1. Go to [python.org/downloads](https://www.python.org/downloads/) and click **Download Python**.
2. Run the installer.
3. **Important:** On the first screen of the installer, check the box that says **"Add python.exe to PATH"** before clicking Install Now.
4. Click **Install Now** and let it finish.

### Install Node.js & NPM

1. Go to [nodejs.org](https://nodejs.org/) and download the **LTS** (Long Term Support) version.
2. Run the installer and follow the prompts — the defaults are fine.
3. NPM is included automatically with Node.js.

### Verify Installation

Open **PowerShell** (search for it in the Start menu) and run:

```powershell
python --version
node --version
npm --version
```

You should see version numbers for each. If you get an error like `'python' is not recognized`, restart PowerShell and try again — the PATH may not have updated yet.

> **Note:** On some Windows setups, you may need to use `python3` instead of `python`, or `pip3` instead of `pip`.

---

## Step 02 — Go to the GitHub Repository

1. Go to the repository: [Canvas Student Data Export](https://github.com/davekats/canvas-student-data-export)

2. Download this repository to your **Documents** folder (or wherever it's easily accessible for you).
3. On the repository page, click **Code** → **Download ZIP**.

> **Note:** If you already have GitHub Desktop installed, it makes it much easier to clone the repository. However, for the sake of this workshop, we're just downloading the ZIP.

4. Once downloaded, go to your **Downloads** folder, right-click the ZIP file, and select **Extract All...**
5. Move the extracted folder to your **Documents** folder.

---

## Step 03 — Locate the API

Now that we have both the environment set up and the project repository downloaded, we'll need to **locate the API** or **create an API token** in Canvas.

### How to find the API Key in Canvas

1. **Log in** to your Canvas account.
2. Once logged in, you'll most likely land on the **Dashboard**.
3. Click the menu on the far left where it says **Account** or shows your profile picture.
4. In the pop-up/menu, you'll see options like Notifications, Profile, Files, Settings, and Portfolio. Click **Settings**.
5. On the Settings page, scroll down to the section labeled **Approved Integrations** — for third-party applications that can access the Canvas site on your behalf.

### Create a New Access Token

1. Click the **+ New Access Token** button.
2. For **Purpose**, enter a name for the application, such as `Canvas Backup`.
3. Select the token's **expiration date** (the date when it should stop working).
4. Click **Generate Token**.
5. A pop-up will display the token. **Copy it and save it in a safe, easily accessible location.**

> ⚠️ **Important:** Once you generate this access token, you won't be able to view it again. If you lose it, you'll have to generate a new one. **Do not share this token with anyone.**

### Find Your User ID

1. Go back to the Canvas **Dashboard**.
2. Click on your **profile picture** or name in the left sidebar.
3. In the profile panel that appears, click the **title link with your name** (e.g., "John Doe's Profile").
4. Look at the URL in your browser's address bar — it will look something like this:

   ```
   https://pratt.instructure.com/about/12345
   ```

5. The number after `/about/` is your **User ID**. In this example, the User ID is `12345`.

> **Tip:** Copy this number and save it alongside your API token — you'll need it when setting up the credentials file.

---

## Step 05 — Install Project Dependencies

Now that we have the API key, we're going back to the project folder using **PowerShell**.

### Open PowerShell

Press `Win + S` (or click the Start menu search), type `PowerShell`, and open it.

### Navigate to the Project Folder

Use the `cd` command to change to the project directory.

1. In File Explorer, navigate to the project folder. Click the address bar at the top to reveal the full path, and copy it.
2. In PowerShell, run:

```powershell
cd "C:\Users\YourName\Documents\canvas-student-data-export"
```

Replace the path with the actual path you copied.

> **Tip:** You can also hold `Shift` and right-click inside the project folder in File Explorer, then select **"Open PowerShell window here"** to skip the `cd` step entirely.

### Install Dependencies

Make sure you have **Python 3.8 or newer** and **Node.js 16 or newer**. Check your versions with:

```powershell
python --version
node --version
```

**Install Python dependencies:**

```powershell
pip install -r requirements.txt
```

> The `requirements.txt` file lists the specific packages needed for this project.

**Install NPM packages:**

```powershell
npm install
```

If both commands run successfully, everything is working and we can move on to the next step.

> **Troubleshooting:** If `pip` is not recognized, try `pip3` or `python -m pip install -r requirements.txt`.

---

## Step 06 — Add API to Config File

Now that we have all the dependencies installed, we'll configure the project and make sure the credentials file is created.

### Create the Credentials File

1. Go back to the [GitHub repository](https://github.com/davekats/canvas-student-data-export) and copy the code snippet for the credentials file.

2. In PowerShell, create the file:

```powershell
New-Item credentials.yaml -ItemType File
```

> **Alternative:** You can also just right-click inside the project folder in File Explorer → **New** → **Text Document**, rename it to `credentials.yaml` (make sure to change the extension from `.txt` to `.yaml`), and open it with **Notepad**.

3. Open the file in Notepad:

```powershell
notepad credentials.yaml
```

4. Paste the following content:

```yaml
API_URL: "https://pratt.instructure.com/"
API_KEY: "your_api_token_here"
USER_ID: "your_user_id_here"
```

Replace `your_api_token_here` with the API token you saved earlier, and replace `your_user_id_here` with the User ID you found in your profile URL.

5. Save the file (`Ctrl + S`) and close Notepad.

> **Reminder:** The API URL for Pratt's Canvas is `https://pratt.instructure.com/` — make sure to use this exact URL.

> ⚠️ **Windows note:** Make sure the file is saved as `credentials.yaml` and not `credentials.yaml.txt`. In File Explorer, go to **View** → check **"File name extensions"** to verify.

---

## Step 07 — Start Backup

Now that we have everything needed, we're going to run the command to start the backup process. This will back up **everything** — from your previous projects and classes to your current classes.

Run the command:

```powershell
python export.py
```

When you run it, you should see it start accessing the API and downloading everything. All files will go into the default folder within the project repository we downloaded.

Let it run until it finishes — at the end, it should tell you when it's done.

### Troubleshooting

If you encounter an error, check the following:

- Make sure there are no misspellings in the command or in the YAML file.
- Confirm that you have installed all required packages and dependencies.
- Verify your API token is correct and hasn't expired.
- If `python` doesn't work, try `python3` or `py` instead.
- Make sure you're running PowerShell **inside the project folder** (check with `pwd` to see your current directory).
- If you see a permissions error, try running PowerShell as **Administrator** (right-click → Run as Administrator).
