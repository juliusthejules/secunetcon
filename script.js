// Function to toggle visibility of the help guide
function toggleHelpGuide() {
    const helpGuide = document.getElementById('help-guide');
    helpGuide.classList.toggle('show');
}

// Function to execute commands based on input
function executeCommand() {
    const input = document.getElementById('cli-input').value.trim().toLowerCase();

    switch (input) {
        case 'download archive1':
            window.location.href = './Archives/Secunetcon.zip'; // Replace with your actual download link
            break;
        case 'download archive2':
            window.location.href = './Archives/Secunetcon.tar.gz'; // Replace with your actual download link
            break;
        case 'download archive3':
            window.location.href = './Archives/Secunetcon.7z'; // Replace with your actual download link
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
        default:
            console.log('Command not recognized');
            break;
    }

    // Clear input field after command execution
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
