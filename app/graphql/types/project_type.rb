module Types
    class ProjectType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :description, String, null: true
      field :user, Types::UserType, null: false
      field :tasks, [Types::TaskType], null: true
    end
  end