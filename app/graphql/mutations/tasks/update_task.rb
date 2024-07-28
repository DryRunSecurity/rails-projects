module Mutations
    module Tasks
      class UpdateTask < BaseMutation
        graphql_name 'UpdateTask'
  
        argument :id, ID, required: true
        argument :title, String, required: false
        argument :description, String, required: false
  
        field :task, Types::TaskType, null: false
        field :errors, [String], null: false
  
        authorize :update, Task
  
        def resolve(id:, title: nil, description: nil)
          task = authorized_find!(id)
          task.title = title if title
          task.description = description if description
          if task.save
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
          authorize! :update, task
          task
        end
      end
    end