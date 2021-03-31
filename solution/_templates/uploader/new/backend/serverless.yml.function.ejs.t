---
to: backend/serverless.yml
inject: true
before: FUNCTION Insertion Point
prepend: true
---
  getPresignedPost:
    handler: lambdas/getPresignedPost.do
    events:
      - http:
          path: presignedPost
          method: get
          cors:
            origin: '*'
            headers: '*'