module Types
  class CommentInputType < GraphQL::Schema::InputObject
    graphql_name "CommentInputType"
    description "All the attributes for creating a new comment"

    argument :id, ID, required: false
    argument :body, String, required: false
    argument :user_id, Int, required: false, camelize: false
    argument :post_id, Int, required: false, camelize: false
  end

  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :user_id, Int, null: false
    field :user, Types::UserType, null: false
    field :post_id, Int, null: false
    field :post, Types::PostType, null: false

    field :errors, [Types::ErrorType], null: false
    
    def errors
      object.errors.map {|e| { field_name: e, errors: object.errors[e] }}
    end

  end
end
