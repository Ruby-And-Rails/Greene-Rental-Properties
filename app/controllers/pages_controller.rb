class PagesController < ApplicationController
  def cms_page
    if params.has_key?(:seo)
      #@page = Page.where(seo:params[:seo])
      
      begin
        @page = Page.find_by_seo(params[:seo])
        @title = @page.title
        @description = @page.description.html_safe
      rescue RecordNotFounds
        redirect_to root_url
      end
    else
      render html: "ERROR"
      return false
    end
  end
  def contact_form 
    @page = Page.find_by_seo('contact-us')
    render html: @page.inspect
    @inquiry = Inquiry.new
  end
  
  def contact_us
    @inquiry = Inquiry.new(inquiry_params)
    respond_to do |format|
      #render html: params.inspect; return false;
      if @inquiry.save
        InquiryMailer.welcome_email(@inquiry).deliver
        format.html { redirect_to :back, success: 'Your request successfully sent.' }
        format.json { render '/contact-us', status: :created, location: @inquiry }
      else
        format.html { render :contact_form }
        #format.html { redirect_to '/contact-us', notice:'Please fill all the fields.' }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def login
    if logged_in?
      redirect_to '/admin'
    else
      @title = 'Login'
      #render layout: 'login'
    end
  end
  def create_login
    user = User.authenticate(params[:user][:username], params[:user][:password])
    if user
      log_in user
      redirect_to '/admin'
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      redirect_to :back
    end
  end
  
  def logout
    log_out
    redirect_to '/login'
  end
  
  private
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :phone, :message)
  end
end
