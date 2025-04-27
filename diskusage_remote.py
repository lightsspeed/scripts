#disk usage on remote server
import paramiko
import os
import sys
import time
import socket


def get_disk_usage(hostname, username, password):
    try:
        # Create an SSH client
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

        # Connect to the remote server
        ssh.connect(hostname, username=username, password=password)

        # Execute the df command to get disk usage
        stdin, stdout, stderr = ssh.exec_command("df -h")
        output = stdout.read().decode()

        # Close the SSH connection
        ssh.close()

        return output

    except paramiko.SSHException as e:
        print(f"SSH error: {e}")
    except socket.error as e:
        print(f"Socket error: {e}")
    except Exception as e:
        print(f"Error: {e}")