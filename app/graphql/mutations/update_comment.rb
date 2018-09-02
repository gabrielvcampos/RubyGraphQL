module Mutations
  class UpdateComment < GraphQL::Schema::Mutation
    null true 
    
    argument :id, ID, required: true
    argument :body, String, required: false
    argument :post_id, Int, required: false, camelize: false
    argument :user_id, Int, required: false, camelize: false

    def resolve(body:, post_id:, user_id:, id:)
      existing = Comment.where(id: :id).first
      existing&.update post: post, post_id: post_id, user_id: user_id
      existing
    end

    def self.accessible?(context)
      context[:current_user].role == "member"
    end

  end

end