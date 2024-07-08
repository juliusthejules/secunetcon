function loadCommands() {
    fetch('./CLI/cli.json')
        .then(response => response.json())
        .then(data => {
            const commandsDiv = document.getElementById('commands');
            data.commands.forEach(command => {
                const button = document.createElement('button');
                button.textContent = command.name;
                button.addEventListener('click', () => executeCommand(command.name));
                commandsDiv.appendChild(button);
            });
        })
        .catch(error => console.error('Error loading commands:', error));
}

function executeCommand(command) {
    fetch(`./CLI/cli.py?command=${encodeURIComponent(command)}`)
        .then(response => response.text())
        .then(data => {
            document.getElementById('output').textContent = data;
        })
        .catch(error => console.error('Error executing command:', error));
}

document.addEventListener('DOMContentLoaded', () => {
    loadCommands();
});
