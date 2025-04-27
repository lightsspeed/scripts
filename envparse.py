from dotenv import dotenv_values

# Path to the .env file
ENV_FILE = ".env"

def read_env_file(file_path):
    """Read and print key-value pairs from a .env file."""
    try:
        # Load key-value pairs from the .env file
        env_vars = dotenv_values(file_path)
        
        # Check if the file is empty or doesn't exist
        if not env_vars:
            print(f"No variables found in {file_path} or file does not exist")
            return
        
        # Print each key-value pair
        for key, value in env_vars.items():
            print(f"{key}={value}")
    except Exception as e:
        print(f"Error reading {file_path}: {e}")

def main():
    """Main function to execute the env file reading."""
    read_env_file(ENV_FILE)

if __name__ == "__main__":
    main()