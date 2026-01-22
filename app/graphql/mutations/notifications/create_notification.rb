module Mutations
    # adding mutation to create notification
    module Notifications
      class CreateNotification < BaseMutation
        graphql_name 'CreateNotification'
  
        # Required arguments for creating a notification.
        argument :title, String, required: true
        argument :body, String, required: false
        argument :user_id, ID, required: true
  
        # Fields returned by the mutation.
        field :notification, Types::NotificationType, null: true
        field :errors, [String], null: false
  
        def resolve(title:, body: nil, user_id:)
          notification = Notification.new(title: title, body: body, user_id: user_id)
  
          if notification.save
            {
              notification: notification,
              errors: []
            }
          else
            {
              notification: nil,
              errors: notification.errors.full_messages
            }
          end
        end
      end
    end
  end
