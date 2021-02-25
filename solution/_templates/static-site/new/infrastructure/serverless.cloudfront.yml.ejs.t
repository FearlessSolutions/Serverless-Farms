---
inject: true
before: RESOURCE Insertion Point
prepend: true
to: infrastructure/serverless.yml
---
    # =============================================================================================
    # CloudFront
    # =============================================================================================

    WebsiteCloudFront:
        Type: AWS::CloudFront::Distribution
        DependsOn:
          - WebsiteBucket
        Properties:
          DistributionConfig:
            Comment: 'CloudFront Distribution pointing to ${self:custom.settings.websiteBucketName}'
            Origins:
              - DomainName: '${self:custom.settings.websiteBucketName}.s3.amazonaws.com'
                Id: S3Origin
                S3OriginConfig:
                  OriginAccessIdentity:  !Join ['', ['origin-access-identity/cloudfront/', !Ref 'CloudFrontOAI']]
            Enabled: true
            HttpVersion: 'http2'
            DefaultRootObject: index.html
            CustomErrorResponses:
              - ErrorCachingMinTTL: 300
                ErrorCode: 404
                ResponseCode: 200
                ResponsePagePath: /index.html
              - ErrorCachingMinTTL: 300
                ErrorCode: 403
                ResponseCode: 200
                ResponsePagePath: /index.html
            DefaultCacheBehavior:
              DefaultTTL: ${self:custom.settings.cloudfrontDefaultTtl}
              MinTTL: ${self:custom.settings.cloudfrontMinTtl}
              MaxTTL: ${self:custom.settings.cloudfrontMaxTtl}
              AllowedMethods:
                - GET
                - HEAD
                - OPTIONS
              Compress: true
              TargetOriginId: S3Origin
              ForwardedValues:
                QueryString: true
                Cookies:
                  Forward: none
              ViewerProtocolPolicy: redirect-to-https
            ## CERTIFICATE INSERTION POINT - DO NOT REMOVE
            PriceClass: PriceClass_100
            WebACLId: !GetAtt rWAFWebACL.Arn
            Restrictions:
              GeoRestriction:
                Locations:
                  - 'US'
                RestrictionType: 'whitelist'

    CloudFrontOAI:
        Type: AWS::CloudFront::CloudFrontOriginAccessIdentity
        Properties:
            CloudFrontOriginAccessIdentityConfig:
                Comment: 'OAI for ${self:custom.settings.websiteBucketName}'