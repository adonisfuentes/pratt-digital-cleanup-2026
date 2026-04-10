# Workshop 01 — How to Back Up Your Canvas

## About

This workshop is the first half of the presentation, **"How to Back Up Your Canvas."** We will go through each step to help students and anyone attending the event learn how to set up their laptop and the necessary tools to make this work.

This workshop is intended to show you how to **download all of your Canvas assignments and materials from all your courses** so you can preserve your work.

### Resources

- **Canvas Student Data Export** — [github.com/davekats/canvas-student-data-export](https://github.com/davekats/canvas-student-data-export)
- **Canvas API Policy** — [instructure.com/policies/canvas-api-policy](https://www.instructure.com/policies/canvas-api-policy)
- **Python** — [python.org](https://www.python.org/)
- **Node.js & NPM** — [docs.npmjs.com/downloading-and-installing-node-js-and-npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)

---

## Tools

The tools required for this workshop:

- **Terminal**
- **Python & NPM**
- **Browser**

---

## Step 01 — Set Up Laptop Environment

When setting up the laptop environment, there are different steps for **Mac** and **Windows** because these two operating systems handle the Terminal differently, and some commands are specific to each.

To begin, if you have a Mac, make sure you have the following installed: **NPM** and **Python**. For this project, we'll need both.

### What is NPM?

NPM is an open-source, default package manager primarily used in the command-line interface.

**What is NPM used for?** It is primarily used when working on different projects, many of which have dependencies. For example, if you're making a website that uses specific dependencies based on how someone's repository is set up, you would run `npm install`, and it would install the necessary dependencies for that project — specific code packages that help make the project work.

### What is Python?

Python is a general-purpose programming language that enables you to accomplish many tasks, such as server-side web development, automating specific tasks, and data cleaning. There are many use cases for Python (we will not go too in-depth in this workshop today).

These are the two things you will need to extract all the elements for backing up Canvas.

---

## Step 02 — Go to the GitHub Repository

1. Go to the repository: [Canvas Student Data Export](https://github.com/davekats/canvas-student-data-export)

![GitHub Repository Page](01%20Github.png)

1. Download this repository to your **Documents** folder on your laptop (or wherever it's easily accessible for you).
2. On the repository page, click **Code** → **Download ZIP**.

> **Note:** If you already have GitHub Desktop installed, it makes it much easier to clone the repository, which means you can also contribute to this project. However, for the sake of this workshop, we're not going to do that — just download the ZIP.

1. Once you click Download, the folder will be on your desktop.

---

## Step 03 — Locate the API

Now that we have both the environment set up and the project repository downloaded, we'll need to **locate the API** or **create an API token** in Canvas. We'll also need to have Canvas open.

### How to find the API Key in Canvas

1. **Log in** to your Canvas account.
2. Once logged in, you'll most likely land on the **Dashboard**.
3. Click the menu on the far left where it says **Account** or shows your profile picture.
4. In the pop-up/menu, you'll see options like Notifications, Profile, Files, Settings, and Portfolio. Click **Settings**.
5. On the Settings page, scroll down to the section labeled **Approved Integrations** — for third-party applications that can access the Canvas site on your behalf.

![Canvas API Settings Page](03%20API.png)

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

![Finding your User ID in the profile URL](03%20Find%20Your%20User%20ID.png)

> **Tip:** Copy this number and save it alongside your API token — you'll need it when setting up the credentials file.

---

## Step 05 — Install Project Dependencies

Now that we have the API key, we're going back to the project folder. Instead of opening it through the GUI (graphical interface) in Finder, we're going to use the **Terminal**.

### Open Terminal

- On a Mac, open **Spotlight** (`Cmd + Space`), type `Terminal`, and open it.
- It should appear as a black window. It may look different on other operating systems.

### Navigate to the Project Folder

Use the `cd` command to change to the project directory so you can run commands there.

1. Copy the pathname for the project folder. On a Mac, open **Finder** and (if the pathbar view is enabled) right-click the file or folder and copy its pathname.
2. In Terminal, run:

```bash
cd /path/to/canvas-student-data-export
```

Replace `/path/to/` with the actual path you copied.

![Terminal — installing project dependencies](05%20Dependencies.png)

### Install Dependencies

Make sure you have **Python 3.8 or newer**, or **Node.js 16 or newer**. Check your versions with:

```bash
python3 --version
node --version
```

**Install Python dependencies:**

```bash
pip3 install -r requirements.txt
```

> The `requirements.txt` file lists the specific packages needed for this project.

**Install NPM packages:**

```bash
npm install
```

If both commands run successfully, everything is working and we can move on to the next step.

---

## Step 06 — Add API to Config File

Now that we have all the dependencies installed, we'll configure the project and make sure the credentials file is created.

### Create the Credentials File

1. Go back to the [GitHub repository](https://github.com/davekats/canvas-student-data-export) and copy the code snippet for the credentials file. Where you see the small stacked-windows icon, click it to copy the entire section.

2. In your Terminal, create the file:

```bash
touch credentials.yaml
```

1. Open the file and paste the required content. It should look something like this:

```yaml
API_URL: "https://pratt.instructure.com/"
API_KEY: "your_api_token_here"
USER_ID: "your_user_id_here"
```

Replace `your_api_token_here` with the API token you saved earlier, and replace `your_user_id_here` with the User ID you found in your profile URL.

> **Reminder:** The API URL for Pratt's Canvas is `https://pratt.instructure.com/` — make sure to use this exact URL.

![Credentials file configuration](06%20Credentials.png)

---

## Step 07 — Start Backup

Now that we have everything needed, we're going to run the command to start the backup process. This will back up **everything** — from your previous projects and classes to your current classes.

Run the command:

```bash
python export.py
```

You can refer back to the [GitHub repository](https://github.com/davekats/canvas-student-data-export) to copy the command; it's also provided in this workshop documentation.

When you run it, you should see it start accessing the API and downloading everything. All files will go into the default folder within the project repository we downloaded.

![Running the Canvas backup export](07%20Backup.png)

Let it run until it finishes — at the end, it should tell you when it's done.

### Troubleshooting

If you encounter an error, check the following:

- Make sure there are no misspellings in the command or in the YAML file.
- Confirm that you have installed all required packages and dependencies.
- Verify your API token is correct and hasn't expired.
