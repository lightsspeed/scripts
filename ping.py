import subprocess
import datetime

# List of IPs to ping
IPS = ["8.8.8.8", "1.1.1.1", "192.168.1.1"]
LOG_FILE = "ping_results.log"

def ping_ip(ip):
    """Ping an IP and return result."""
    try:
        subprocess.run(["ping", "-c", "1", ip], timeout=5, stdout=subprocess.PIPE)
        return f"{ip} is reachable"
    except:
        return f"{ip} is not reachable"

def log_result(message):
    """Log message with timestamp."""
    with open(LOG_FILE, "a") as f:
        f.write(f"[{datetime.datetime.now()}] {message}\n")

def main():
    """Ping IPs and log results."""
    for ip in IPS:
        result = ping_ip(ip)
        print(result)
        log_result(result)

if __name__ == "__main__":
    main()