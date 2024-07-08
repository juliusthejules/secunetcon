// Function to execute a command
function executeCommand(command) {
    // Make a request to the backend API endpoint
    fetch('/api/execute-command', {
        method: 'POST',  // Adjust the HTTP method as needed (GET, POST, etc.)
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ command }),
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.text(); // Assuming backend returns plain text or JSON
    })
    .then(data => {
        document.getElementById('output').textContent = `Execution result: ${data}`;
    })
    .catch(error => {
        console.error('Error executing command:', error);
        document.getElementById('output').textContent = `Error: ${error.message}`;
    });
}
    document.getElementById('output').textContent = `Executing: ${command}`;
}

// Function to load commands based on OS selection
function loadCommands(os) {
    // Fetch commands.json based on selected OS
    fetch(`./commands.json`)
        .then(response => response.json())
        .then(data => {
            // Get commands based on selected OS
            const commands = os === 'unix' ? data.unix : data.windows;

            // Display commands (for demonstration)
            const commandList = document.getElementById('commands');
            commandList.innerHTML = ''; // Clear previous commands

            commands.forEach(command => {
                const li = document.createElement('li');
                li.textContent = command.name;
                li.addEventListener('click', () => executeCommand(command.command));
                commandList.appendChild(li);
            });
        })
        .catch(error => {
            console.error('Error loading commands:', error);
            alert('Failed to load commands. Please try again later.');
        });
}

// Example usage: Load commands for Unix initially
loadCommands('unix');