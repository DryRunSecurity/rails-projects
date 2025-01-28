module Mutations
    module Projects
      class DeleteProject < BaseMutation
        graphql_name 'DeleteProject'
  
        argument :id, ID, required: true
  
        field :project, Types::ProjectType, null: false
        field :errors, [String], null: false
    
        def resolve(id:)
          project = authorized_find!(id)
          if project.destroy
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
          authorize! :delete, project
          project
        end
      end
    end
