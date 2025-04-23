module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def self.authorize(action, resource_class)
      define_method(:authorized?) do
        resource = resource_class.find(arguments[:id])
        context[:current_ability].authorize!(action, resource)
        # true
      end
    end
  end
end
