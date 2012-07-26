resque-failed-job-mailer gem
=============

Overview
--------

The resque-failed-job-mailer gem is used to send email whenever there is any failure in resque job.


Installation
------------

Installation of the plugin can be done using the built in Rails plugin script. Issue the following
command from the root of your Rails application:

    $ ./script/rails plugin install git://github.com/anandagrawal84/resque_failed_job_mailer.git

or add it to your Gemfile:

    gem 'resque-failed-job-mailer', :require => 'resque_failed_job_mailer'

and run `bundle install` to install the new dependency.

Usage
-----
All you need to do is configure ActionMailer for smtp details. Add following configuration file `resque_failed_job_mailer.rb` in `config/initializer` folder

```ruby
Resque::Failure::Notifier.configure do |config|
  config.from = 'dummy@dummy.com' # from address
  config.to = 'dummy@dummy.com' # to address
end
```

as soon as resque job fail it would send out an email to the configured email address.

Configuration
-------------

If you want to use your own email mechanism then add following configuration

```ruby
Resque::Failure::Notifier.configure do |config|
  config.mailer = ActionMailerClass
  config.mail = ActionMailerMailMethod
  config.from = 'dummy@dummy.com' # from address
  config.to = 'dummy@dummy.com' # to address
end
```

`config.mailer` is any class that extends `ActionMailer::Base`

`config.mail` is mail in class given above in `config.mailer`
