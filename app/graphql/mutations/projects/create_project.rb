module Mutations
  module Projects
    class CreateProject < BaseMutation
      graphql_name 'CreateProject'

      argument :name, String, required: true
      argument :description, String, required: false

      field :project, Types::ProjectType, null: false
      field :errors, [String], null: false

      # fix IDOR issue
      authorize :create, Project

      def resolve(name:, description: nil)
        user = context[:current_user]
        project = Project.new(name: name, description: description, user_id: user.id)

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
  end
end
