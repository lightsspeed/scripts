import boto3

# Configuration
BUCKET_NAME = "your-bucket-name"  # Replace with your S3 bucket name
LOCAL_FILE_PATH = "path/to/your/file.txt"  # Replace with your local file path
S3_OBJECT_KEY = "file.txt"  # Name of the file in S3

def upload_file_to_s3(bucket_name, local_file_path, s3_object_key):
    """Upload a local file to an S3 bucket."""
    try:
        # Initialize S3 client
        s3_client = boto3.client("s3")
        # Upload the file
        s3_client.upload_file(local_file_path, bucket_name, s3_object_key)
        print(f"Uploaded {local_file_path} to s3://{bucket_name}/{s3_object_key}")
    except Exception as e:
        print(f"Error: {e}")

def main():
    """Main function to execute the upload."""
    upload_file_to_s3(BUCKET_NAME, LOCAL_FILE_PATH, S3_OBJECT_KEY)

if __name__ == "__main__":
    main()