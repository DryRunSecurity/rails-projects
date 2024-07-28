module Mutations
    module Users
      class UpdateUser < BaseMutation
        graphql_name 'UpdateUser'
  
        argument :id, ID, required: true
        argument :name, String, required: false
        argument :email, String, required: false
  
        field :user, Types::UserType, null: false
        field :errors, [String], null: false
  
        def resolve(id:, name: nil, email: nil)
          user = User.find(id)
          user.name = name if name
          user.email = email if email
          if user.save
            {
              user: user,
              errors: []
            }
          else
            {
              user: nil,
              errors: user.errors.full_messages
            }
          end
        end
      end
    end
  end