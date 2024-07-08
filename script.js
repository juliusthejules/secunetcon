// Function to toggle visibility of the help guide
function toggleHelpGuide() {
    const helpGuide = document.getElementById('help-guide');
    helpGuide.classList.toggle('show');
}

// Function to execute commands based on input
function executeCommand() {
    const input = document.getElementById('cli-input').value.trim().toLowerCase();

    switch (input) {
        case 'download zip':
            window.location.href = './Archives/Secunetcon.zip';
            break;
        case 'download tar.gz':
            window.location.href = './Archives/Secunetcon.tar.gz';
            break;
        case 'download 7z':
            window.location.href = './Archives/Secunetcon.7z';
            break;
        case 'navigate top':
            window.scrollTo(0, 0);
            break;
        case 'navigate bottom':
            window.scrollTo(0, document.body.scrollHeight);
            break;
        case 'navigate header':
            document.querySelector('header').scrollIntoView({ behavior: 'smooth' });
            break;
        case 'navigate main':
            document.querySelector('main').scrollIntoView({ behavior: 'smooth' });
            break;
        case 'navigate footer':
            document.querySelector('footer').scrollIntoView({ behavior: 'smooth' });
            break;
        case 'execute python':
            fetch('./Library/app.py')
                .then(response => response.text())
                .then(script => eval(script))
                .catch(error => console.error('Error executing Python file:', error));
            break;
        case 'execute batch':
            fetch('./Microsoft/config.bat')
                .then(response => response.text())
                .then(script => eval(script))
                .catch(error => console.error('Error executing Batch file:', error));
            break;
        case 'execute bash':
            fetch('./Unix-based/config.sh')
                .then(response => response.text())
                .then(script => eval(script))
                .catch(error => console.error('Error executing Bash file:', error));
            break;
        default:
            console.log('Command not recognized');
            break;
    }

    document.getElementById('cli-input').value = '';
}

// Event listener for help indicator
document.getElementById('help-indicator').addEventListener('click', toggleHelpGuide);

// Optional: Handle Enter key press to submit command
document.getElementById('cli-input').addEventListener('keyup', function(event) {
    if (event.key === 'Enter') {
        executeCommand();
    }
});
