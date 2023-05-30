# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new

    if user.persisted?
      can :read, :all
      can :manage, User, id: user.id
    else
      can :read, :all
    end

  end
end
