# Secunetcon

Secunetcon is an all-in-one cybersecurity toolkit and platform that allows you to directly configure device settings using various formats such as YAML, Bash, Batch, and Python. This project includes configurations for both Unix-based and Microsoft systems. 

## CLI Bar

The `index.html` file also comes with a Comand Line Interface (CLI) bar at the end of the webpage for executing the security measures straight from the browser!

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
- `app.py`: A python script for executing the configurations of the YAML files.
- `script.js`: A JavaScript file for executing the commands in the CLI bar at the end of the webpage.
- `Secunetcon.zip`: A ZIP file containing both Unix-based and Microsoft configuration folders.
- `Secunetcon.7z`: A 7z file containing both Unix-based and Microsoft configuration folders.
- `Secunetcon.tar.gz`: A tar.gz file containing both Unix-based and Microsoft configuration folders.

## Cloning the Repository

To clone the repository, use the following command:

    git clone https://github.com/juliusthejules/secunetcon.git

## Usage

### Unix-based Systems

The Unix-based configuration files can be found in the `Unix-based` directory. These configuration files includes commands to:

- Mask IPv4 and IPv6 addresses
- Change the hostname to localhost
- Change the MAC address to all zeros
- Configure Bluetooth settings
- Disable location and geolocation services
- Block all ICMP echo requests (pings)
- Block all incoming traffic
- Clear browser cookies and cache

### Microsoft Systems

The Microsoft configuration files can be found in the `Microsoft` directory. These configuration files includes commands to:

- Disable and enable the network interface
- Set IPv4 and IPv6 addresses
- Change the hostname to localhost
- Change the MAC address to all zeros
- Configure Bluetooth settings
- Stop and disable the GPS Location service
- Block all ICMP echo requests (pings)
- Block all incoming traffic
- Clear browser cookies and cache

### Archives

The archive files can be found in the `Archives` directory. This directory contains compressed versions of the project, which include both Unix-based and Microsoft configuration folders. The available archive formats are:

- `Secunetcon.zip`: A ZIP file containing both Unix-based and Microsoft configuration folders.
- `Secunetcon.7z`: A 7z file containing both Unix-based and Microsoft configuration folders.
- `Secunetcon.tar.gz`: A tar.gz file containing both Unix-based and Microsoft configuration folders.

## Documentation

For detailed documentation on how to use Secunetcon, please refer to the individual configuration files in their respective folders. Each file includes comments explaining the purpose and usage of each command.

## Contact

For questions or support, please contact the maintainer at [secunetcon@duck.com](mailto:secunetcon@duck.com?subject=Secunetcon).

Thank you for using Secunetcon!
