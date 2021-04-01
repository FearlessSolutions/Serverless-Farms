---
to: ui/src/helpers/api.js
inject: true
before: API Functions Insertion Point
prepend: true
---
function get<%= Name %>s(){
  return httpApiGet(`<%= name %>`)
}

function get<%= Name %>(id){
  return httpApiGet(`<%= name %>/` + id)
}

function put<%= Name %>(id, data){
  return httpApiPut(`<%= name %>/` + id, {data})
}

function new<%= Name %>(data){
  return httpApiPost(`<%= name %>/`, {data})
}

function delete<%= Name %>(id){
  return httpApiDelete(`<%= name %>/` + id)
}