---
inject: true
before: FUNCTION Insertion Point
prepend: true
to: serverless.yml
---
  create-<%= h.changeCase.lower(name) %>:
    handler: models/<%= h.changeCase.lower(name) %>.create
    events:
      - http:
          path: <%= h.changeCase.lower(name) %>
          method: post
          cors: true

  list-<%= h.changeCase.lower(name) %>:
    handler: models/<%= h.changeCase.lower(name) %>.list
    events:
      - http:
          path: <%= h.changeCase.lower(name) %>
          method: get
          cors: true

  get-<%= h.changeCase.lower(name) %>:
    handler: models/<%= h.changeCase.lower(name) %>.get
    events:
      - http:
          path: <%= h.changeCase.lower(name) %>/{id}
          method: get
          cors: true

  update-<%= h.changeCase.lower(name) %>:
    handler: models/<%= h.changeCase.lower(name) %>.update
    events:
      - http:
          path: <%= h.changeCase.lower(name) %>/{id}
          method: put
          cors: true

  delete-<%= h.changeCase.lower(name) %>:
    handler: models/<%= h.changeCase.lower(name) %>.delete
    events:
      - http:
          path: <%= h.changeCase.lower(name) %>/{id}
          method: delete
          cors: true