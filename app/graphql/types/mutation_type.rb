module Types
  class MutationType < Types::BaseObject
    
    ### USUÁRIO ###

    field :create_user, Types::UserType, null: false,
      description: "create an user" do
        argument :user, Types::UserInputType, required: true
    end
      
    def create_user(user:)
      User.create user.to_h
    end

    field :update_user, Boolean, null: false,
    description: "update an user" do
      argument :user, Types::UserInputType, required: true
    end
    
    def update_user(user:)
      existing = User.where(id: user[:id]).first
      existing&.update user.to_h
    end

    field :delete_user, Boolean, null: false,
    description: "delete an user" do
      argument :id, Int, required: true
    end
    
    def delete_user(id:)
      User.find(id).destroy
      true
    end


    ### POSTS ###

    field :create_post, Types::PostType, null: false,
      description: "create an post" do
        argument :post, Types::PostInputType, required: true
    end
      
    def create_post(post:)
      Post.create post.to_h
    end

    field :update_post, Boolean, null: false,
    description: "update an post" do
      argument :post, Types::PostInputType, required: true
    end
    
    def update_post(post:)
      existing = Post.where(id: post[:id]).first
      existing&.update post.to_h
    end

    field :delete_post, Boolean, null: false,
    description: "delete an post" do
      argument :id, Int, required: true
    end
    
    def delete_post(id:)
      Post.find(id).destroy
      true
    end


    ### COMENTÁRIOS ###

    field :create_comment, Types::CommentType, null: false,
      description: "create an comment" do
        argument :comment, Types::CommentInputType, required: true
    end
      
    def create_comment(comment:)
      Comment.create comment.to_h
    end

    # field :update_comment, Boolean, null: false,
    # description: "update an comment" do
    #   argument :comment, Types::CommentInputType, required: true
    # end
    
    field :update_comment, Types::CommentType, mutation: Mutations::UpdateComment

    def update_comment(comment:)
      existing = Comment.where(id: comment[:id]).first
      existing&.update comment.to_h
    end

    field :delete_comment, Boolean, null: false,
    description: "delete an comment" do
      argument :id, Int, required: true
    end
    
    def delete_comment(id:)
      Comment.find(id).destroy
      true
    end
  end
end
