module Abilitable
  extend ActiveSupport::Concern

  def can?(controller, action)
    ('Abilitable::Role::' + role.classify).constantize.new(controller, action).can?
  end

  private

  module Role
    class Base
      RIGHTS = {}

      def initialize(controller, action)
        @controller, @action = controller, action
      end

      def self.can(opts)
        controller, actions = opts.keys.first, opts.values.first
        define_method("#{controller}_can?") do |action|
          return true if actions == :all
          actions.include? action.to_sym
        end
      end

      def can?
        return true if all_can?(:all)

        send "#{@controller}_can?", @action
      end

      def method_missing(*)
        false
      end
    end

    class Admin < Base
      can all: :all
    end

    class Guest < Base
      can sessions: :all
    end

    class Student < Guest
      can dashboard: %i(index)
      can courses: %i(index show)
      can learning_units: %i(index show)
      can activities: %i(index show)
      can upload_files: :all
      can submissions: :all
      can discussions: :all
    end

    class Teacher < Student
      can courses: %i(index show edit update)
      can learning_units: :all
      can activities: :all
    end

    class Manager < Teacher
      can users: %i(edit update)
      can courses: :all
    end
  end
end
