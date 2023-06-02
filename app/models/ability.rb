class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.persisted?
      can :read, :all
      can :manage, User, id: user.id
      can :manage, Category, user_id: user.id
      can :manage, Game, user_id: user.id
    else
      can :read, :all
    end
  end
end
