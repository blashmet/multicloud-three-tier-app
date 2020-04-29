import boto3
import botocore
import json
import logging
import traceback
import os
import re

from stacker.session_cache import get_session


LOGGER = logging.getLogger(__name__)

def empty_source_bucket(provider, context, **kwargs):  # pylint: disable=W0613
    """Empty source bucket"""

    #Stacks.yml Import Variables
    bucket = kwargs.get('cfngin_bucket_name')
    s3 = boto3.resource('s3')

    if s3.Bucket(bucket) in s3.buckets.all():
        
        try:     

                print ("Deleting objects in bucket:")
                print (bucket)
                s3_client = boto3.client('s3')
                object_response_paginator = s3_client.get_paginator('list_object_versions')

                delete_marker_list = []
                version_list = []
                print("Removing objects in:")
                print(bucket)

                for object_response_itr in object_response_paginator.paginate(Bucket=bucket):
                    if 'DeleteMarkers' in object_response_itr:
                        for delete_marker in object_response_itr['DeleteMarkers']:
                            delete_marker_list.append({'Key': delete_marker['Key'], 'VersionId': delete_marker['VersionId']})

                    if 'Versions' in object_response_itr:
                        for version in object_response_itr['Versions']:
                            version_list.append({'Key': version['Key'], 'VersionId': version['VersionId']})

                for i in range(0, len(delete_marker_list), 1000):
                    response = s3_client.delete_objects(
                        Bucket=bucket,
                        Delete={
                            'Objects': delete_marker_list[i:i+1000],
                            'Quiet': True
                        }
                    )                    

                for i in range(0, len(version_list), 1000):
                    response = s3_client.delete_objects(
                        Bucket=bucket,
                        Delete={
                            'Objects': version_list[i:i+1000],
                            'Quiet': True
                        }
                    )
                    
                rm_bucket = s3_client.delete_bucket(Bucket=bucket) #uncomment if runway will not handle bucket deletion
                print(rm_bucket)
                return True

        except Exception as e:
            print(e)
            pass

    
    else:

        print('The following bucket does not exist:')
        print(bucket)

        return True