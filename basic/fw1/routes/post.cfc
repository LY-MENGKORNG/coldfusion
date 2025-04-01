
component accessors = true {

  public function initRoutes() {
    return [
      {"$GET/api/posts/$": "/post/get"}, 
      {"$GET/api/posts/:id/$": "/post/find/id/:id"},
      {"$POST/api/posts/$": "/post/create"},
      {"$DELETE/api/posts/:id/$": "/post/destroy/id/:id"}
    ]
  }
}