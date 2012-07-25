require "resque_failed_job_mailer/version"
require 'resque_failed_job_mailer/resque/failure/notifier'
require 'resque/failure/multiple'
require 'resque/failure/redis'

Resque::Failure::Multiple.configure do |config|
  config.classes = [Resque::Failure::Redis, Resque::Failure::Notifier]
end

Resque::Failure::Notifier.configure do |config|
  config.mailer = ResqueFailedJobMailer::Mailer
  config.mail = :alert
  config.from = "no_reply@gmail.com"
  config.to = "dummy@dummy.com"
end

module ResqueFailedJobMailer

end
