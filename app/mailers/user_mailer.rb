class UserMailer < ActionMailer::Base
  default from: "codingpractice2@gmail.com"

  def welcome_email(interest)
  	@interest = interest
  	@url = 'http://twominutebreak.met/login'
  	mail(to: 'futter.steven@gmail.com', subject: 'Welcome to 2mB')
  end
end
