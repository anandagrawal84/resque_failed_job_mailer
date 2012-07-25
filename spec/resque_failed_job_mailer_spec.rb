require 'resque/server'
require 'resque/failure/multiple'
require 'resque/failure/redis'
require 'action_mailer'
require 'resque_failed_job_mailer/mailer'
require 'resque_failed_job_mailer/resque/failure/notifier'

describe Resque::Failure::Notifier do

  describe "configure" do
    Resque::Failure::Notifier.configure do |config|
      config.mailer = ResqueFailedJobMailer::Mailer
      config.mail = :alert
      config.from = "no_reply@gmail.com"
      config.to = "dummy@dummy.com"
    end

    it "should return mailer class" do
      Resque::Failure::Notifier.mailer.should == ResqueFailedJobMailer::Mailer
    end

    it "should return mail method" do
      Resque::Failure::Notifier.mail.should == :alert
    end

    it "should return sender address" do
      Resque::Failure::Notifier.from.should == "no_reply@gmail.com"
    end

    it "should return recipient address" do
      Resque::Failure::Notifier.to.should == "dummy@dummy.com"
    end
  end

  describe "save" do
    Resque::Failure::Notifier.configure do |config|
      config.mailer = ResqueFailedJobMailer::Mailer
      config.mail = :alert
    end

    it "should send the mail if job fails" do
      notifier = Resque::Failure::Notifier.new(nil, nil, nil, nil)
      ResqueFailedJobMailer::Mailer.should_receive(:alert).with(notifier).and_return(mail = mock('mail'))
      mail.should_receive(:deliver)
      notifier.save
    end
  end
end
