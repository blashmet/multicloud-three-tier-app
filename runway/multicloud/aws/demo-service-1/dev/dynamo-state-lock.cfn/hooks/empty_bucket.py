import boto3
import botocore
import json
import logging
import traceback
import os

#from stacker.session_cache import get_session


LOGGER = logging.getLogger(__name__)

def empty_source_bucket(provider, context, **kwargs):  # pylint: disable=W0613
    """Empty source bucket"""


    #VARIABLES
    bucket_identifier = kwargs.get('s3_bucket_identifier')
    


    s3_client = boto3.client(
        "s3"
    )

    response = s3_client.list_buckets()
    for bucket in response["Buckets"]:
            # Only removes the buckets with the name you want.
            if bucket_identifier in bucket["Name"]:
                s3_objects = s3_client.list_objects_v2(Bucket=bucket["Name"])
                # Deletes the objects in the bucket before deleting the bucket.
                if "Contents" in s3_objects:
                    for s3_obj in s3_objects["Contents"]:
                        rm_obj = s3_client.delete_object(
                            Bucket=bucket["Name"], Key=s3_obj["Key"])
                        print(rm_obj)
                #rm_bucket = s3_client.delete_bucket(Bucket=bucket["Name"]), uncomment if runway will not handle bucket deletion
                #print(rm_bucket)



    return True
