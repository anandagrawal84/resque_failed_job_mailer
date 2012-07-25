require 'action_mailer'

module Resque
  module Failure
    class Notifier < Base
      class << self
        attr_accessor :mailer, :mail, :from, :to

        def configure
          yield self
          Resque::Failure.backend = self unless Resque::Failure.backend == Resque::Failure::Multiple
        end
      end

      def save
        self.class.mailer.send(self.class.mail, self).deliver
      rescue
      end
    end
  end
end
