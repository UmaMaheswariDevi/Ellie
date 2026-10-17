# 🐘 Ellie — My Personal Always-On Desktop Companion

**Ellie** is a charming, lightweight, and dependable baby-elephant companion that lives right on your Windows desktop. Designed to keep you company throughout your day, Ellie provides gentle hydration reminders, study/focus timers, posture & eye-rest tips, and warm words of encouragement—without getting in your way!

---

## ✨ Features at a Glance

1. **Your Authentic Character**
   - Uses your exact baby-elephant image with soft grey skin, large floppy ears, warm pink inner ears, glossy black eyes, and rosy cheeks.
   - Clean transparent background with smooth anti-aliased edges and no beige artifacts.
   - Original asset preserved in `assets/elephant_original.jpg`.

2. **True Windows Desktop Experience**
   - **Frameless & Transparent:** Floating smoothly above your wallpaper with no opaque rectangular box.
   - **Always-on-Top:** Stays visible over browser windows, IDEs, and office apps (toggleable).
   - **Draggable & Persistent:** Click and drag Ellie anywhere on any monitor. Ellie remembers her position across restarts.
   - **Multi-Monitor & Resolution Aware:** Safely adjusts if your display resolution changes; includes a quick *"Reset Position"* option in the system tray.

3. **Cute Personality & Interactive Yes/No System**
   - **Interactive Choices:** Ellie asks you questions with direct `[ ✅ Yes ]` and `[ ❌ No 🥺 ]` buttons right under her speech bubble.
   - **Affectionate Requests:** If you choose **No**, Ellie will gently plead and request you to take care of yourself:
     - *Water No:* *"Please go drink a little water right now! 🥺 Just one small glass, pretty please? Ellie is waiting right here for you! 💧🐘"*
     - *Study No:* *"Please try studying for just 10 small minutes with me? 🥺 Little by little, you will accomplish something great today! 📚🐘"*
     - *Break No:* *"Please step away for just 2 short minutes! 🥺 Rest your eyes, take 3 deep breaths, and relax your shoulders! 🌸"*
     - *Stretch No:* *"Please roll your shoulders back right now! 🥺 Back and forth, 3 times! Ellie is doing it with you! 🐘✨"*
   - Gentle floating, bobbing, and delightful bouncing animations on click.
   - Soothing, synthesized chime sound effect (offline Web Audio, disabled by default, toggleable in Settings).
   - **Quiet Mode:** Temporarily silences non-essential chatter when you need uninterrupted focus.

4. **Reliable Water Reminders**
   - Configurable interval (default: **60 minutes**).
   - Interactive speech bubbles with **"💧 I Drank Water"** and **"⏰ Remind Me Later"** (5-minute snooze).
   - Windows native desktop notifications (can be toggled on/off).
   - Pause and resume controls with live countdown visible in Settings.

5. **Study & Productivity Timer (Pomodoro)**
   - Configurable focus sessions (default: **25 minutes**) and rest breaks (default: **5 minutes**).
   - Floating study badge above Ellie displaying live countdown (`📚 24:15`).
   - Session completion celebration alerts.

6. **Wellness Categories**
   - **💧 Water & Hydration:** Scheduled reminders with action buttons.
   - **📚 Study & Focus:** Pomodoro sessions.
   - **👀 Eye-Rest (20-20-20 Rule):** Prompts to soften gaze and look 20 feet away.
   - **🐘 Stretch & Posture:** Prompts to roll back shoulders and stand up.
   - **✨ Daily Motivation:** Heartwarming positive affirmations.

7. **System Tray Integration**
   - System tray icon with quick actions:
     - *Show / Hide Ellie*
     - *💧 Log Water (Reset Timer)*
     - *⏱️ Study Timer (Start / Pause / Reset)*
     - *⚙️ Settings...*
     - *🔄 Reset Position to Bottom-Right*
     - *✖️ Quit Ellie*

8. **Future AI Chat & Voice Architecture**
   - Clean, modular backend service (`src/main/ai-service.js`) ready to integrate with modern AI models (Gemini, Claude, OpenAI, or local Ollama models) without altering the companion architecture.
   - No fake AI responses; safe and authentic behavior out of the box.

---

## 🚀 Running Ellie

### Option A: Ready-to-Run Standalone App (No Tools Required)
You do **not** need Node.js, VS Code, or Antigravity to run Ellie!

You can run Ellie immediately in three different ways from the `dist/` folder:

1. **Portable App (Single `.exe`):**
   ```
   dist\Ellie Desktop Companion 1.0.0.exe
   ```
   Double-click to run Ellie anywhere on Windows without installation!

2. **Folder App:**
   ```
   dist\win-unpacked\Ellie Desktop Companion.exe
   ```
   Directly runnable executable folder.

3. **Windows Installer (NSIS Setup):**
   ```
   dist\Ellie Desktop Companion Setup 1.0.0.exe
   ```
   Installs Ellie into your Windows Applications, creates a Desktop shortcut and Start Menu entry, and adds an official Windows Uninstaller in Settings > Apps.

---

### Option B: Development Mode (For Code Customization)

If you wish to edit the source code or test changes:

1. **Install dependencies:**
   ```bash
   npm install
   ```
2. **Start Ellie in development:**
   ```bash
   npm start
   ```
3. **Build the production Windows installer:**
   ```bash
   npm run build
   ```

---

## 🛠️ How to Configure Windows Startup

You can make Ellie automatically greet you every morning when you turn on your laptop:

1. Right-click Ellie on your desktop (or click her System Tray icon) and select **Settings**.
2. Click on the **🚀 Startup & System** tab.
3. Turn on the **"Launch on Windows Sign-in"** toggle.
4. When you install Ellie via the Windows Setup installer (`dist/Ellie Desktop Companion Setup 1.0.0.exe`), Windows will automatically launch Ellie silently into your system tray upon login!

---

## 📁 Project Structure

```
ellie/
├── assets/
│   ├── elephant_original.jpg     # Your untouched original uploaded image
│   ├── elephant.png              # Reference elephant image
│   ├── elephant_transparent.png  # High-definition neural-matted character asset
│   ├── icon.png                  # High-res 512x512 app icon
│   └── icon.ico                  # Multi-size Windows application & tray icon
├── src/
│   ├── main/
│   │   ├── main.js               # Electron master process (lifecycle, IPC, window management)
│   │   ├── store.js              # Local settings persistence (JSON file in userData)
│   │   ├── reminders.js          # Reminder engine (water, study, wellness, notifications)
│   │   ├── tray.js               # Windows System Tray controller & context menu
│   │   ├── startup.js            # Windows sign-in auto-launch manager
│   │   ├── notifications.js      # Native Windows notification wrapper
│   │   └── ai-service.js         # Future AI architecture service
│   ├── preload/
│   │   └── preload.js            # Secure contextBridge API for the renderers
│   └── renderer/
│       ├── character/
│       │   ├── index.html        # Frameless transparent companion widget
│       │   ├── styles.css        # Animations, glassmorphism speech bubble, bouncing
│       │   └── character.js      # Dragging, clicking, speech bubble logic, audio synthesis
│       └── settings/
│           ├── index.html        # Modern pastel settings dashboard
│           ├── styles.css        # Settings styling (tabs, sliders, toggles, badges)
│           └── settings.js       # Live auto-save settings logic & timers
├── dist/
│   ├── Ellie Desktop Companion Setup 1.0.0.exe  # Windows installer
│   ├── Ellie Desktop Companion 1.0.0.exe        # Portable single executable
│   └── win-unpacked/                            # Unpacked standalone application
├── package.json
├── .gitignore
└── README.md
```

---

## 💡 Troubleshooting & Tips

- **Ellie got dragged off-screen or monitor disconnected?**
  - Right-click the elephant tray icon in your Windows taskbar (bottom-right) and choose **"🔄 Reset Position to Bottom-Right"**.
- **Accidentally hid Ellie?**
  - Click the elephant tray icon or right-click and choose **"🐘 Show Ellie"**.
- **Want to adjust size?**
  - Open **Settings > General** and pick from Small (75%), Medium (100%), Large (125%), or Extra (150%).
- **Need to uninstall?**
  - If installed via Setup, go to Windows **Settings > Apps > Installed apps**, find **Ellie Desktop Companion**, and click **Uninstall**.
  - All local user preferences are stored cleanly in `%APPDATA%\ellie-desktop-companion` and can be reset at any time.

---

*Made with love for Uma — Enjoy your daily desktop companion! 🐘💙*
