import boto3
import logging
import traceback
import os




LOGGER = logging.getLogger(__name__)

def empty_source_bucket(provider, context, **kwargs):  # pylint: disable=W0613
    """Empty source bucket"""


    #VARIABLES
    s3 = boto3.resource('s3')
    bucket_name = kwargs.get('s3_bucket')
    bucket = s3.Bucket(bucket_name)


    if s3.Bucket(bucket_name) in s3.buckets.all() :

        print('Deleting all objects in bucket...')
        bucket.objects.all().delete()
        #bucket.delete(), uncomment if bucket deletion not handled by Runway
        print('All bucket objects deleted.')
        print('Bucket removal will be handled via CloudFormation.')
        return True

    else:
        
        print('Bucket does not exist (expected sometimes)')



        return True
