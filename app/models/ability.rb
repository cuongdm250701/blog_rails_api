class Ability
  include CanCan::Ability

  def initialize(user)
      can :manage, :all if user.admin?
    # can :create, CategoryPost if user.admin?
      can :read, CategoryPost if user.customer?
  end
end
