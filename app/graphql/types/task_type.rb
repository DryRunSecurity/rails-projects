module Types
    class TaskType < Types::BaseObject
      field :id, ID, null: false
      field :title, String, null: false
      field :description, String, null: true
      field :project, Types::ProjectType, null: false
    end
  end