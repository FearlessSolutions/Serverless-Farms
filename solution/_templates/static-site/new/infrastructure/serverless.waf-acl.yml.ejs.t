---
inject: true
before: RESOURCE Insertion Point
prepend: true
to: infrastructure/serverless.yml
---
    # =============================================================================================
    # WAF ACL for Cloudfront Distribution
    # =============================================================================================

    # Web Application Firewall Access Control List
    rWAFWebACL:
        Type: AWS::WAFv2::WebACL
        Properties:
          Name: !Sub WebApplicationFirewall-${AWS::StackName}
          Scope: CLOUDFRONT
          Description: This WebACL is used to filter requests destined for a CloudFront distribution associated with a static S3 website.
          DefaultAction:
            Allow: {}
          VisibilityConfig:
            SampledRequestsEnabled: true
            CloudWatchMetricsEnabled: true
            MetricName: !Sub WAF-${AWS::StackName}
          Rules:
            - Name: RestrictGeoMatch
              Priority: 0
              Action:
                Block: {}
              VisibilityConfig:
                SampledRequestsEnabled: true
                CloudWatchMetricsEnabled: true
                MetricName: RestrictGeoMatchMetric
              Statement:
                NotStatement:
                  Statement:
                    GeoMatchStatement:
                        CountryCodes:
                          - US
            - Name: AWSManagedRulesCommonRuleSet
              Priority: 1
              OverrideAction:
                None: {}
              VisibilityConfig:
                SampledRequestsEnabled: true
                CloudWatchMetricsEnabled: true
                MetricName: AWSManagedRules-CommonRulesSet
              Statement:
                ManagedRuleGroupStatement:
                  VendorName: AWS
                  Name: AWSManagedRulesCommonRuleSet
                  ExcludedRules: []
            - Name: AWSManagedRulesAmazonIPReputation
              Priority: 2
              OverrideAction:
                None: {}
              VisibilityConfig:
                SampledRequestsEnabled: true
                CloudWatchMetricsEnabled: true
                MetricName: AWSManagedRules-AmazonIPReputation
              Statement:
                ManagedRuleGroupStatement:
                  VendorName: AWS
                  Name: AWSManagedRulesAmazonIpReputationList
                  ExcludedRules: []
            - Name: RateLimitRule
              Priority: 3
              Action:
                Block: {}
              VisibilityConfig:
                SampledRequestsEnabled: true
                CloudWatchMetricsEnabled: true
                MetricName: RateLimitRule
              Statement:
                RateBasedStatement:
                  AggregateKeyType: IP
                  Limit: 2000
