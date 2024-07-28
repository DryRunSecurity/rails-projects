module Mutations
    module Tasks
      class CreateTask < BaseMutation
        graphql_name 'CreateTask'
  
        argument :title, String, required: true
        argument :description, String, required: false
        argument :project_id, ID, required: true
  
        field :task, Types::TaskType, null: false
        field :errors, [String], null: false
  
        def resolve(title:, description: nil, project_id:)
          task = Task.new(title: title, description: description, project_id: project_id)
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
      end
    end
