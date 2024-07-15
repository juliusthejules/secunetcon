# Secunetcon

Secunetcon is an all-in-one cybersecurity toolkit and platform that allows you to directly configure device settings using various formats such as YAML, Bash, Batch, and Python straight from your browser. This project includes configurations for both Unix-based and Microsoft systems. Just use the CLI bar at the bottom of the page.

## CLI Bar

The `index.html` file comes with a Command Line Interface (CLI) bar at the end of the webpage for executing security measures straight from the browser! The CLI bar supports running Python, Batch (Windows), and Bash (Unix) scripts to help secure your devices.

### How the CLI Bar Works

- **Python Script**: Execute the Python script directly from the browser to secure your device. For python, use the `execute python` command.
- **Batch Script**: Run the Batch commands for securing Microsoft Windows systems. For Batch, use the `execute batch` command.
- **Bash Script**: Run the Bash commands to secure Unix-based systems (Linux, macOS, Android, iOS). For Bash, use the `execute bash` command.

## Overview

Secunetcon provides a structured way to manage device configurations, ensuring your devices are secure and their network settings are properly configured. The configurations are divided into two categories:
- Unix-based systems
- Microsoft Windows systems

## Repository Contents

The repository contains the following files and directories:

- `config.yml` (Unix-based)
- `config.yml` (Microsoft)
- `config.bat` (Microsoft)
- `config.sh` (Unix-based)
- `app.py` (Library): A Python script for executing the configurations of the YAML files.
- `script.js` (Root): A JavaScript file for executing the commands in the CLI bar at the end of the webpage.

## Cloning the Repository

To clone the repository, use the following command:

```bash
git clone https://github.com/juliusthejules/secunetcon.git
```

## Usage

### Unix-based Systems

The Unix-based configuration files can be found in the repository. These configuration files include commands to:

- Mask IPv4 and IPv6 addresses
- Change the hostname to localhost
- Change the MAC address to all zeros
- Configure Bluetooth settings
- Disable location and geolocation services
- Block all ICMP echo requests (pings)
- Block all incoming traffic
- Clear browser cookies and cache

### Microsoft Systems

The Microsoft configuration files can be found in the repository. These configuration files include commands to:

- Disable and enable the network interface
- Set IPv4 and IPv6 addresses
- Change the hostname to localhost
- Change the MAC address to all zeros
- Configure Bluetooth settings
- Stop and disable the GPS Location service
- Block all ICMP echo requests (pings)
- Block all incoming traffic
- Clear browser cookies and cache

## Documentation

For detailed documentation on how to use Secunetcon, please refer to the individual configuration files. Each file includes comments explaining the purpose and usage of each command.

## Contact

For questions or support, please contact the maintainer at [juliusthejulessp@duck.com](mailto:juliusthejulessp@duck.com?subject=Secunetcon).

Thank you for using Secunetcon, owned by Joseph D. Smith/Julius the Jules, SP!

## Disclaimer

By using Secunetcon, you agree to waive all liability and hold harmless Joseph D. Smith/Julius the Jules, SP and all associated parties for any consequences arising from its use. You acknowledge and understand the risks involved.
