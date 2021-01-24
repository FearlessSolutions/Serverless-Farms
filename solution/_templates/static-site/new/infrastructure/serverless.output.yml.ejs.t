---
inject: true
before: OUTPUT Insertion Point
prepend: true
to: infrastructure/serverless.yml
---
    WebsiteUrl:
      Description: URL for the main website hosted on S3 via CloudFront
      Value: !Join ['', ['https://', !GetAtt [WebsiteCloudFront, DomainName]]]

    WebsiteBucket:
      Description: The bucket name of the static website
      Value: !Ref WebsiteBucket

    CloudFrontEndpoint:
      Value: !GetAtt [WebsiteCloudFront, DomainName]
      Description: Endpoint for CloudFront distribution for the website

    CloudFrontId:
      Value: !Ref WebsiteCloudFront
      Description: Id of the CloudFront distribution