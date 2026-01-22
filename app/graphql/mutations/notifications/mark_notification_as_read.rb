module Mutations
    # add markasread mutation
    module Notifications
      class MarkNotificationAsRead < BaseMutation
        graphql_name 'MarkNotificationAsRead'
  
        # Input argument to indicate which notification to update.
        argument :id, ID, required: true
  
        # The response includes the updated notification and any errors.
        field :notification, Types::NotificationType, null: true
        field :errors, [String], null: false
  
        def resolve(id:)
          notification = Notification.find_by(id: id)
          return { notification: nil, errors: ["Notification not found"] } unless notification
  
          notification.read = true
          if notification.save
            { notification: notification, errors: [] }
          else
            { notification: nil, errors: notification.errors.full_messages }
          end
        end
      end
    end
  end
