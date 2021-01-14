---
to: "<%= name === 'unnamed' ? 'ui' : `${name}` %>/serverless.yml"
sh: "cd <%= name === 'unnamed' ? 'ui' : `${name}` %> && pnpm install @fearless/serverless-settings-helper serverless-deployment-bucket @fearless/serverless-ui-tools --save-dev"
---
# For full config options, see docs.serverless.com
# Note that most settings in here come from config/settings/*.yaml
service: ${self:custom.settings.awsRegionShortName}-${self:custom.settings.solutionName}-ui

provider:
  name: aws
  runtime: nodejs12.x
  region: ${self:custom.settings.awsRegion}
  profile: ${self:custom.settings.awsProfile}
  stackName: ${self:custom.settings.envName}-${self:service}
  deploymentBucket:
    name: ${self:custom.settings.deploymentBucketName}
  # All references beginning with ${self:*, ${opt:*, ${file:*, ${deep:*, and ${cf:* will be resolved by Serverless
  # All other ${* references will be resolved by CloudFormation
  # See https://forum.serverless.com/t/getting-handle-accountid-in-serverless-config/946/11 and
  # See https://github.com/serverless/serverless/issues/5011
  variableSyntax: '\$\{((((self|opt|deep|cf):)|file)((?!\$\{).)+?)}'


custom:
  settings: ${file(./config/settings/.settings.js):merged}
  envTemplate:
    # ========================================================================
    # Variables shared between .env.local and .env.production
    # ========================================================================

    SKIP_PREFLIGHT_CHECK: true
    REACT_APP_LOCAL_DEV: false
    REACT_APP_AWS_REGION: ${self:custom.settings.awsRegion}
    REACT_APP_API_URL: ${self:custom.settings.apiUrl}
    REACT_APP_WEBSITE_URL: ${self:custom.settings.websiteUrl}
    REACT_APP_STAGE: ${self:custom.settings.envName}
    REACT_APP_REGION: ${self:custom.settings.awsRegion}

    # ========================================================================
    # Overrides for .env.local
    # ========================================================================

    localOverrides:
      REACT_APP_LOCAL_DEV: true
      REACT_APP_API_URL: 'http://localhost:4000'
      REACT_APP_WEBSITE_URL: 'http://localhost:3000'

resources:
   - Description: The UI stack for [${self:custom.settings.solutionName}] and env [${self:custom.settings.envName}]

plugins:
  - serverless-deployment-bucket
  - '@fearless/serverless-ui-tools'
