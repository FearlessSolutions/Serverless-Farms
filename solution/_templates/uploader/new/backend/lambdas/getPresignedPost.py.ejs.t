---
to: backend/lambdas/getPresignedPost.py
---
import json
import os
import boto3

UPLOAD_BUCKET = os.environ['UPLOAD_BUCKET']


def do(event, context):
    s3c = boto3.client('s3')
    try:
        fileName = event['queryStringParameters']['fileName']
    except():
        response = {
            "headers": {
                'Access-Control-Allow-Origin': '*'
            },
            "statusCode": 400,
            "body": "fileName is required"
        }
        return response
    contentType = fileName.split('.')[-1]
    presigned_post = s3c.generate_presigned_post(
        Bucket=UPLOAD_BUCKET,
        Key=fileName,
        Fields={"acl": "public-read"},
        Conditions=[
            {"acl": "public-read"},

        ],
        ExpiresIn=3600
    )
    response = {
        "headers": {
            'Access-Control-Allow-Origin': '*'
        },
        "statusCode": 200,
        "body": json.dumps(presigned_post)
    }

    return response