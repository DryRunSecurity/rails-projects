module Mutations
    module Notifications
      class DeleteNotification < BaseMutation
        graphql_name 'DeleteNotification'
  
        # Input argument to indicate which notification to delete.
        argument :id, ID, required: true
  
        # The response indicates success and returns any errors.
        field :success, Boolean, null: false
        field :errors, [String], null: false
  
        def resolve(id:)
          notification = Notification.find_by(id: id)
          return { success: false, errors: ["Notification not found"] } unless notification
  
          if notification.destroy
            { success: true, errors: [] }
          else
            { success: false, errors: notification.errors.full_messages }
          end
        end
      end
    end
  end