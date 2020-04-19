import boto3
import botocore
import json
import logging
import traceback
import os
import re

from stacker.session_cache import get_session


LOGGER = logging.getLogger(__name__)

def create_cfngin_bucket(provider, context, **kwargs):  # pylint: disable=W0613
    """Empty source bucket"""

    #Stacks.yml Import Variables
    bucket = kwargs.get('cfngin_bucket_name')
    region = kwargs.get('region')
    s3 = boto3.resource('s3')

    if s3.Bucket(bucket) in s3.buckets.all():
        
        try:     

            print('The following bucket already exists:')
            print(bucket)
            return True

        except Exception as e:

            print(e)
            pass

    
    else:

        try:
            
            s3_client = boto3.client('s3', region_name=region)
            location = {'LocationConstraint': region}
            s3_client.create_bucket(Bucket=bucket, CreateBucketConfiguration=location)
            return True

        except Exception as e:
            print(e)            
            return False