---
to: ui/src/helpers/api.js
inject: true
before: API Export Insertion Point
prepend: true
---
  get<%= Name %>s,
  get<%= Name %>,
  put<%= Name %>,
  new<%= Name %>,
  delete<%= Name %>,