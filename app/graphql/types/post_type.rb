module Types
  class PostInputType < GraphQL::Schema::InputObject
    graphql_name "PostInputType"
    description "All the attributes for creating a new post"

    argument :id, ID, required: false
    argument :body, String, required: false
    argument :user_id, Int, required: false, camelize: false

  end

  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :user_id, Int, null: false
    field :user, Types::UserType, null: false
    field :comments, [Types::CommentType], null: true

    field :errors, [Types::ErrorType], null: false
    
    def errors
      object.errors.map {|e| { field_name: e, errors: object.errors[e] }}
    end

  end
end
