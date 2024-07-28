module Mutations
    module Tasks
      class DeleteTask < BaseMutation
        graphql_name 'DeleteTask'
  
        argument :id, ID, required: true
  
        field :task, Types::TaskType, null: false
        field :errors, [String], null: false
  
        authorize :delete, Task
  
        def resolve(id:)
          task = authorized_find!(id)
          if task.destroy
            {
              task: task,
              errors: []
            }
          else
              {
                task: nil,
                errors: task.errors.full_messages
              }
            end
          end
        end
  
        private
  
        def authorized_find!(id)
          task = Task.find(id)
          authorize! :delete, task
          task
        end
      end
    end