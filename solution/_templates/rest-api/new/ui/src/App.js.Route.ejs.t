---
to: ui/src/App.js
inject: true
after: Route Insertion Point
prepend: true
---
          <Route path="/<%= name %>/:id" children={<<%= Name %> />}/>
          <Route path="/<%= name %>s">
            <<%= Name %>s />
          </Route>