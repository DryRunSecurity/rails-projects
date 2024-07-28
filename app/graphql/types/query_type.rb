# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false
    field :projects, [Types::ProjectType], null: false
    field :tasks, [Types::TaskType], null: false

    def users
      User.all
    end

    def projects
      Project.all
    end

    def tasks
      Task.all
    end
  end
end
