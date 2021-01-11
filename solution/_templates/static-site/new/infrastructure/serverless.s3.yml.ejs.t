---
inject: true
before: RESOURCE Insertion Point
prepend: true
to: infrastructure/serverless.yml
---
      # =============================================================================================
      # S3 Buckets
      # =============================================================================================

      # S3 Bucket for the static website
      WebsiteBucket:
        Type: AWS::S3::Bucket
        Properties:
          BucketName: ${self:custom.settings.websiteBucketName}
          WebsiteConfiguration:
            IndexDocument: index.html
            ErrorDocument: index.html

      WebsiteBucketPolicy:
        Type: AWS::S3::BucketPolicy
        Properties:
          Bucket: !Ref WebsiteBucket
          PolicyDocument:
            Statement:
            - Action:
                - 's3:GetObject'
              Effect: Allow
              Principal:
                AWS: !Join ['',['arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ', !Ref 'CloudFrontOAI']]
              Resource:
                - !Join ['', ['arn:aws:s3:::', !Ref 'WebsiteBucket', '/*']]