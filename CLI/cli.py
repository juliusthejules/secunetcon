from flask import Flask, request, jsonify
import subprocess
import json

app = Flask(__name__)

# Load commands from cli.json
with open('./CLI/cli.json', 'r') as f:
    commands = json.load(f)

@app.route('/execute', methods=['POST'])
def execute_command():
    data = request.get_json()
    command_name = data['command']
    
    if command_name in commands:
        command = commands[command_name]['command']
        comment = commands[command_name]['comment']
        
        # Execute command using subprocess
        try:
            result = subprocess.run(command, shell=True, capture_output=True, text=True)
            output = result.stdout.strip()
            return jsonify({'output': output, 'comment': comment})
        except subprocess.CalledProcessError as e:
            return jsonify({'error': str(e)})
    else:
        return jsonify({'error': 'Command not found'})

if __name__ == '__main__':
    app.run(debug=True)
