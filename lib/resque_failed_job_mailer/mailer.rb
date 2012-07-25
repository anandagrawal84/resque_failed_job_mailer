module ResqueFailedJobMailer
  class Mailer < ActionMailer::Base
    def alert job_failure_notifier
      @notifier = job_failure_notifier
      mail :from => Resque::Failure::Notifier.from, :to => Resque::Failure::Notifier.to, :subject => "[Resque] #{@notifier.exception}",
           :template_name => "alert"
    end
  end
end
