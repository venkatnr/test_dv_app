class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.roles.first.nil?
        can :read, project
    #not logged
    elsif user.Current.lastname == "sriram"
        #loged in as user
        can :read, Project
       #can :create, Project
        #can :update, Post, :user_id => user.id
       # can :destroy, Post , :user_id => user.id 

    elsif user.Current.flastname == "admin"
        # login as admin
        can :manage, Project
    end

  end
end

