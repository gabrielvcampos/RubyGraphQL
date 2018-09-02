module Types
  class UserInputType < GraphQL::Schema::InputObject
    graphql_name "UserInputType"
    description "All the attributes to create an user"

    argument :id, ID, required: false
    argument :first_name, String, required: false, camelize: false
    argument :last_name, String, required: false, camelize: false
    argument :street, String, required: false
    argument :number, Int, required: false
    argument :city, String, required: false
    argument :postcode, String, required: false
    argument :country, String, required: false

  end

  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :street, String, null: false
    field :number, Int, null: false
    field :city, String, null: false
    field :postcode, String, null: false
    field :country, String, null: false
    field :full_name, String, null: false
    field :posts, [Types::PostType], null: false
    field :comments, [Types::CommentType], null: true
    field :full_address, String, null: false
    field :email, String, null: false
    field :role, String, null: false

    field :errors, [Types::ErrorType], null: false
    
    def errors
      object.errors.map {|e| { field_name: e, errors: object.errors[e] }}
    end

  end
end