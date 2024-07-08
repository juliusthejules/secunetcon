from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/execute-command', methods=['POST'])
def execute_command():
    data = request.get_json()
    command = data['command']

    try:
        result = subprocess.run(command, shell=True, check=True, text=True, capture_output=True)
        output = result.stdout
    except subprocess.CalledProcessError as e:
        output = e.stderr

    return jsonify({'output': output})

if __name__ == '__main__':
    app.run()
