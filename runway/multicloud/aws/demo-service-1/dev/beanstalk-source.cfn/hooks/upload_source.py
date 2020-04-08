import logging
import traceback
import os

from stacker.session_cache import get_session

LOGGER = logging.getLogger(__name__)

def upload_source_bundle(provider, context, **kwargs):
    """Upload source bundle"""

    #VARIABLES
    session = get_session(provider.region)
    s3_bucket = kwargs.get('s3_bucket')
    bundle_path = kwargs.get('bundle_path')
    s3_client = session.client('s3')
    dirname = os.path.dirname(__file__)
    filename = os.path.join(dirname, bundle_path)


    try:
        LOGGER.info("Uploading source to S3 bucket...")

        s3_client.upload_file(

            Filename=filename,
            Bucket=s3_bucket,
            Key="dotnet-blue.zip"

        )
        return True
    except Exception:

        LOGGER.info('Could not upload to bucket.')
        traceback.print_exc()

        return True
