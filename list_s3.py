#list all s3 buckets
import boto3

def list_s3_buckets():
    s3 = boto3.client('s3')
    try:
        response = s3.list_buckets()
        buckets = [bucket['Name'] for bucket in response['Buckets']]
        return buckets
    except Exception as e:
        return f"Error: {str(e)}"