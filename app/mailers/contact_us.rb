class ContactUs < ActionMailer::Base
  default :from => "itusil@rocots.net"
  
  def contact_email(email_params)
    # You only need to customize @recipients.
    @recipients = "itusil@rocots.net, vroco@rocots.net, micmillan2011@gmail.com"
    @from = email_params[:name] + " <" + email_params[:address] + ">"
    @subject = "Inquiry (#{email_params[:subject]})"
    @sent_on = Time.now
    @email_body = email_params[:body]
    @email_name = email_params[:name]
    content_type "text/html"
  end
end
