---
to: infrastructure/serverless.yml
inject: true
before: RESOURCE Insertion Point
prepend: true
---
    # S3 Bucket for the uploading files
    UploadBucket:
      Type: AWS::S3::Bucket
      Properties:
        BucketName: ${self:custom.settings.globalNamespace}-upload
        CorsConfiguration:
          CorsRules:
            - AllowedMethods:
                - GET
                - POST
                - PUT
                - HEAD
              AllowedOrigins:
                - "*"
              AllowedHeaders:
                - "*"