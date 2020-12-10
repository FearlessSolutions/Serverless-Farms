---
to: ../config/settings/<%= h.changeCase.lower(name) %>.yml
---
# aws profile information
awsProfile: fearless
awsRegion: us-east-1

# The short solution name is used to namespace a few AWS resources
# Try to keep this setting short to avoid hitting long strings issues
solutionName: sfa

# The environment name where you want to deploy the solution to. (e.g. developer1, developer2, demo, prod etc.)
# This is also used for creating a namespace for resources. Usually, this is same as serverless "stage".
# All resource names reference "envName" instead of directly using "opt:stage".
# This indirection allows for easy incorporation of extra variables in the "envName", if required.
# For example, if the same solution needs to be deployed across multiple AWS accounts we can easily
# add account specific variable in "envName" for keeping the namespace specific to each account.
envName: ${opt:stage}

# The environment type (e.g. dev, demo). This is for grouping multiple environments into types.
# For example, all developers' environments can be of type "dev".
# This can be use for enabling some envType driven conditionals in code. (For example, create only single node
# ElasticSearch cluster when envType is 'dev' but create multi-node cluster when it's 'prod')
envType: dev