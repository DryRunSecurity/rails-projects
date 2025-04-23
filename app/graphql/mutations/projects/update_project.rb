module Mutations
    module Projects
      class UpdateProject < BaseMutation
        graphql_name 'UpdateProject'
  
        argument :id, ID, required: true
        argument :name, String, required: false
        argument :description, String, required: false
  
        field :project, Types::ProjectType, null: false
        field :errors, [String], null: false
  
  
        def resolve(id:, name: nil, description: nil)
          project = authorized_find!(id)
          project.name = name if name
          project.description = description if description
          if project.save
            {
              project: project,
              errors: []
            }
          else
              {
                project: nil,
                errors: project.errors.full_messages
              }
            end
          end
        end
  
        private
  
        def authorized_find!(id)
          project = Project.find(id)
          authorize! :update, project
          project
        end
      end
    end
