class Ability
  include CanCan::Ability

  def initialize(user)


    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      # edit and delete their own idea, can't join their own idea, can't like their own idea
      # can can uses the current_user method in the applciation controller which is how it get the user

      can :edit_delete, Idea do |idea|
        idea.user == user
      end

      can :like, Idea do |idea|
        idea.user != user
      end

      can :delete_comment, Comment do |comment|
        comment.user == user || comment.idea.user == user
        # comment.idea.user == user: means that it is belonging in higher order if the idea belongs to the user the user can then delete the idea which will delete the comment
      end

      # can an user be a member of this idea

      can :join, Idea do |idea|
        idea.user != user
      end
        # the current_user can't join their own idea, the current_user can't be a member of their own idea
        #  current_user can't like their own idea
        #  == user means current_user
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
