class EmailsController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  # GET /emails
  # GET /emails.xml
  def index
    @emails = Email.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emails }
    end
  end

  # GET /emails/1
  # GET /emails/1.xml
  def show
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @email }
    end
  end

  # POST /emails
  # POST /emails.xml
  def create
    message = Mail.new(params[:message])

    @email = Email.new
    @email.subject = message.subject
    @email.body = message.body.decoded
    @email.save
  end
end
