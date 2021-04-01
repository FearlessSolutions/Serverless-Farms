---
to: ui/src/helpers/api.js
inject: true
before: API Functions Insertion Point
prepend: true
---
function getPresignedPost(name){
  return httpApiGet(`presignedPost?fileName=${name}`)
}