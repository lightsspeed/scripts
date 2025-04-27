#check ec2 status
import boto3


def check_ec2_status(instance_id):
    ec2 = boto3.client('ec2')
    try:
        response = ec2.describe_instance_status(InstanceIds=[instance_id])
        if 'InstanceStatuses' in response and len(response['InstanceStatuses']) > 0:
            status = response['InstanceStatuses'][0]['InstanceState']['Name']
            return status
        else:
            return "No status found for the instance."
    except Exception as e:
        return f"Error: {str(e)}"
    
if __name__ == "__main__":
    instance_id = "i-0abcd1234efgh5678"  # Replace with your EC2 instance ID
    status = check_ec2_status(instance_id)
    print(f"EC2 Instance {instance_id} status: {status}")
    