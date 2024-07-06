import yaml
import subprocess
import os
import platform

def load_yaml(file_path):
    with open(file_path, 'r') as file:
        return yaml.safe_load(file)

def execute_commands(commands):
    for item in commands:
        command = item['command']
        comment = item.get('comment', 'Executing command')
        print(f"{comment}: {command}")
        try:
            result = subprocess.run(command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            print(result.stdout.decode())
        except subprocess.CalledProcessError as e:
            print(f"Error executing command: {e.stderr.decode()}")

def run_unix_commands(config):
    for section in config.values():
        execute_commands(section)

def run_windows_commands(config):
    for section in config.values():
        execute_commands(section)

def main():
    system_type = platform.system()
    
    if system_type == "Linux" or system_type == "Darwin":
        config_path = "./Unix-based/config.yml"
        config = load_yaml(config_path)
        run_unix_commands(config)
    elif system_type == "Windows":
        config_path = "./Microsoft/config.yml"
        config = load_yaml(config_path)
        run_windows_commands(config)
    else:
        print(f"Unsupported system type: {system_type}")

if __name__ == "__main__":
    main()
