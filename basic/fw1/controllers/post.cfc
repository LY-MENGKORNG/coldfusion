component accessors = "true"
{
    property postService;
    property fw;

    function init(any fw) {
        variables.fw = fw;
        return this;
    }

    function get(struct rc, struct headers) {
        variables.fw.renderData().type("json").data(variables.postService.getAllPosts());
    }
    
    function find(struct rc, struct headers) {
        // Check if id exists directly in rc
        if(structKeyExists(rc, "id")) {
            var user = variables.postService.get(rc.id);
            variables.fw.renderData().type("json").data(user);
        } else {
            // If id doesn't exist, return an error
            variables.fw.renderData().type("json").data({error: "Post not found with id: " + rc.id + "."});
        }
    }

    function create(struct rc, struct headers) {
        var postCreated = variables.postService.create(
            arguments.rc.title,
            arguments.rc.content,
            arguments.rc.isPublished
        );
        variables.fw.renderData().type("json").data({
            "message": "Post created successfully.",
            "postCreated" = postCreated
        }).statusCode(201);
    }

    function destroy(struct rc, struct headers) {
        // Check if id exists directly in rc
        if(structKeyExists(rc, "id")) {

            var existingPost = variables.postService.get(rc.id);
            if(isNull(existingPost)) {
                variables.fw.renderData().type("json").data({
                    "msg": "Post not found with id: #arguments.rc.id#" 
                }).statusCode(404);
                return
            }
            variables.postService.delete(arguments.rc.id);
            variables.fw.renderData().type("json").data({
                "msg": "Post deleted successfully.",
            });
            return
        } 
        
        // If id doesn't exist, return an error
        variables.fw.renderData().type("json").data({
            "msg": "Post not found with id: #arguments.rc.id#"
        }).statusCode(404);
    }
}