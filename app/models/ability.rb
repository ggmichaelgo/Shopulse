class Ability
    include CanCan::Ability

    def initialize(user)
        user ||= User.new
        if user.has_role? :admin
            can :manage, :all
        elsif user.has_role? :retailer

        elsif user.has_role? :member

        end
    end
end
