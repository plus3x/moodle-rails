module Abilitable
  extend ActiveSupport::Concern

  def can?(controller, action)
    ('Abilitable::' + role.classify).constantize.new(controller, action).can?
  end

  private

  class Role
    RIGHTS = {}

    def initialize(controller, action)
      @controller, @action = controller, action
    end

    def self.can(controller, actions = :all)
      RIGHTS[controller] = actions
    end

    def can?
      return true if RIGHTS[:all] == :all

      RIGHTS[@controller] == :all || RIGHTS[@controller].include?(@action)
    end
  end

  class Admin < Role
    can :all
  end

  class Manager < Role
    can sessions: :all
    can users: %i(edit update)
    can courses: :all
  end

  class Teacher < Role
    can courses: %i(edit update)
  end

  class Student < Role
  end

  class Guest < Role
  end
end
