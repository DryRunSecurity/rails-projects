# app/models/ability.rb
class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new # guest user (not logged in)
  
      can :manage, Project, user_id: user.id
      can :manage, Task, project: { user_id: user.id }
      can :read, Project
      can :read, Task
    end
  end
  