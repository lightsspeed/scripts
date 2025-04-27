#Write a script to list all running Docker containers and their statuses.

import subprocess
import json

def list_running_containers():
    try:
        # Run the docker ps command to get running containers in JSON format
        result = subprocess.run(['docker', 'ps', '--format', '{{json .}}'], capture_output=True, text=True, check=True)
        
        # Split the output into individual container JSON strings
        containers = result.stdout.strip().split('\n')
        
        # Parse each JSON string into a Python dictionary
        container_list = [json.loads(container) for container in containers]
        
        return container_list

    except subprocess.CalledProcessError as e:
        print(f"Error: {e.stderr}")
        return []