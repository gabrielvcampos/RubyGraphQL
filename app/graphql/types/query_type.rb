module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end


    field :user, Types::UserType, null: false,
      description: "An user" do
        argument :id, String, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :comment, Types::CommentType, null: false,
      description: "A comment" do
        argument :id, String, required: true
    end

    def comment(id:)
      Comment.find(id)
    end

    field :users, [Types::UserType], null: false,
      description: "All users"
    
    def users
      User.all
    end

    field :login, String, null: true,
      description: "The login of all the users" do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      if user = User.where(email: email).first&.authenticate(password) 
        user.sessions.create.key
      end
    end

    field :current_user, Types::UserType, null: false, description: "The currently logged user"
    
    def current_user
      context[:current_user]
    end

    field :logout, Boolean, null: false, description: "The loggout of an user by deleting his associated session key" 
    def logout
      Session.where(id: context[:session_id]).destroy_all
      true
    end

  end
end
