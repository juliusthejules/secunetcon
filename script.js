// Function to toggle visibility of the help guide
function toggleHelpGuide() {
    const helpGuide = document.getElementById('help-guide');
    helpGuide.classList.toggle('show');
}

// Function to execute commands based on input
function executeCommand() {
    const input = document.getElementById('cli-input').value.trim().toLowerCase();

    switch (input) {
        case 'execute python':
            executeFile('./Library/app.py');
            break;
        case 'execute batch':
            executeFile('./Microsoft/config.bat');
            break;
        case 'execute bash':
            executeFile('./Unix-based/config.sh');
            break;
        default:
            console.log('Command not recognized');
            break;
    }

    // Clear input field after command execution
    document.getElementById('cli-input').value = '';
}

// Function to execute files
function executeFile(filePath) {
    fetch(filePath)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(data => {
            console.log(`Executing file: ${filePath}`);
            console.log(data);
            // Here you would add code to actually execute the file
            // This might involve sending a request to a backend service
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
        });
}

// Event listener for help indicator
document.getElementById('help-indicator').addEventListener('click', toggleHelpGuide);

// Optional: Handle Enter key press to submit command
document.getElementById('cli-input').addEventListener('keyup', function(event) {
    if (event.key === 'Enter') {
        executeCommand();
    }
});
