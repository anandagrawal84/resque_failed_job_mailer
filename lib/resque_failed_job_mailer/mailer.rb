module ResqueFailedJobMailer
  class Mailer < ::ActionMailer::Base
    def alert notifier
      @notifier = notifier
      text = ERB.new(File.read(File.dirname(__FILE__) + "/alert.html.erb")).result(binding)
      mail :from => Resque::Failure::Notifier.from, :to => Resque::Failure::Notifier.to, :subject => "[Resque] #{@notifier.exception}" do |format|
        format.html { render :text => text }
      end
    end
  end
end
