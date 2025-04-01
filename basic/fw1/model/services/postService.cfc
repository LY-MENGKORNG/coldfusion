component accessors = true {

    property fw;

    public array function getAllPosts() {
        try {
            var posts = entityLoad('post');
            return posts;
        }
        catch(any e) {
            writelog(file="postService", text="Error in getAllPosts: #e.message# - #e.detail#");
            rethrow;
        }
    }
    
    public any function get(required numeric id) {
        try {
            var post = entityLoadByPK('post', arguments.id);
            return post;
        } catch(any e) {
            writelog(file="postService", text="Error in get: #e.message# - #e.detail#");
            rethrow;
        }
    }
    
    public any function create(
        required string title,
        required string content,
        boolean isPublished
    ) {
        var datePublished = nullValue();
        if(structKeyExists(arguments, "isPublished")) {
            datePublished = now();
            arguments.isPublished = false;
        }

        transaction {
            try {

                var post = EntityNew('post');
                
                post.setTitle(arguments.title);
                post.setContent(arguments.content);
                post.setCreated(now());
                post.setUpdated(now());
                post.setIspublished(arguments.isPublished);
                post.setDatepublished(datePublished);

                EntitySave(post);
                TransactionCommit();
                return post;
            } catch(any e) {
                transactionRollback();

                writelog(file="postService", text="Error in create: #e.message# - #e.detail#");
                rethrow;
            }
        }
    }

    
    public any function delete(required numeric id) {
        transaction {
            try {
                var post = EntityLoadByPK('post', arguments.id);
                
                EntityDelete(post);
                TransactionCommit();
                return post;
            } catch(any e) {
                transactionRollback();
                
                writelog(file="postService", text="Error in delete: #e.message# - #e.detail#");
                rethrow;
            }
        }
    }
    
}