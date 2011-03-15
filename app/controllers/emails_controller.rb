class EmailsController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def show
    @email = Email.find(params[:id])
  end

  def create
    message = Mail.new(params[:message])

    @email = Email.new
    @email.subject = NKF.nkf("-J -w -m0", message.subject)
    @email.body = NKF.nkf("-J -w -m0", message.body.decoded)
    if @email.save
      @email.tweet
    end

    render :text => 'success', :status => 200 # a status of 404 would reject the mail
  end
end
