component extends="testbox.system.BaseSpec" {
    
    function beforeAll() {
        variables.postService = new model.services.postService();
    }
    
    function run() {
        describe("Post Service", function() {
            it("can create a new post", function() {
                var title = "Test Post";
                var content = "Test Content";
                
                transaction {
                    var post = variables.postService.create(title, content);
                    expect(post).toBeComponent();
                    expect(post.getTitle()).toBe(title);
                    expect(post.getContent()).toBe(content);
                    expect(post.getId()).toBeNumeric();
                    transactionRollback();
                }
            });
            
            it("can get all posts", function() {
                var posts = variables.postService.getAllPosts();
                expect(posts).toBeArray();
            });
            
            it("can get a post by id", function() {
                transaction {
                    // Create a test post
                    var post = variables.postService.create("Test Post", "Test Content");
                    var id = post.getId();
                    
                    // Get the post by id
                    var retrieved = variables.postService.get(id);
                    expect(retrieved).toBeComponent();
                    expect(retrieved.getId()).toBe(id);
                    
                    transactionRollback();
                }
            });
        });
    }
} 