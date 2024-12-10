# Gotify Notification Script

A lightweight Bash script to send notifications to Gotify directly from your terminal. It supports both direct message arguments and input from `stdin`, making it ideal for integrating with scripts, automation tasks, and real-time notifications.

---

## Bring Notifications to Your Terminal

Unleash the power of real-time notifications for your workflows! This script lets you send messages to Gotify effortlessly, either by providing a direct message argument or by piping output from other commands.

With just a few commands, you can:

- Send notifications about completed tasks or system updates.
- Integrate with system monitoring tools for critical alerts.
- Notify yourself of important events in real time.

---

## Features

- **Flexibility**: Accepts messages as arguments or via `stdin`.
- **Real-Time Notifications**: Easily integrate with system logs or scripts for instant updates.
- **Cross-Platform**: Works on Linux, macOS, and Windows (via WSL or Git Bash).
- **Easy to Use**: Minimal setup required to start sending notifications.

---

## Installation Instructions

### Prerequisites

Ensure you have the following tool installed:

- **curl**: Required for sending API requests to Gotify.

#### Installing `curl`

- **Ubuntu/Linux**:

  ```bash
  sudo apt update && sudo apt install curl -y
  ```

- **macOS** (via Homebrew):

  ```bash
  brew install curl
  ```

- **Windows** (via WSL or Git Bash):
  ```bash
  sudo apt update && sudo apt install curl -y
  ```

---

### One-Liner Installation

Run the following command to download, install, and set up the script:

```bash
curl -o /usr/local/bin/gotify https://raw.githubusercontent.com/worthable/gotify-terminal/main/gotify.sh && chmod +x /usr/local/bin/gotify
```

---

## Configure Gotify URL and API Key

To use the Gotify script, you need to set up your Gotify URL and API key as an environment variable:

1. Open your shell configuration file (`~/.bashrc` for Bash, `~/.zshrc` for Zsh):

   ```bash
   nano ~/.bashrc
   ```

2. Add the following line to configure your Gotify URL and API key:

   ```bash
   export GOTIFY_URL="https://gotify.yourdomain.com/message?token=YOUR_API_KEY"
   ```

   Replace `https://gotify.yourdomain.com` with your Gotify server URL and `YOUR_API_KEY` with your unique Gotify API key.

3. Reload your shell configuration:

   ```bash
   source ~/.bashrc
   ```

4. Verify the variable is set:
   ```bash
   echo $GOTIFY_URL
   ```

---

## Usage

### Send a Message Directly

Provide a message as an argument to the script:

```bash
gotify "Your message here"
```

### Send a Message Using `stdin`

Pipe a message to the script:

```bash
echo "Your message here" | gotify
```

---

## Advanced Integration

### Combine with System Monitoring Commands

#### Notify About Disk Space Issues

```bash
df -h | grep "100%" | gotify
```

#### Alert for High CPU Usage

```bash
top -b -n 1 | grep "Cpu(s)" | gotify
```

#### Track SSH Login Attempts

```bash
grep "sshd" /var/log/auth.log | gotify
```

---

## Contribution

Feel free to submit issues or feature requests to improve this script. Contributions via pull requests are welcome.

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
