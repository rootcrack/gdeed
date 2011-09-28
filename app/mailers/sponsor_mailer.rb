class SponsorMailer < ActionMailer::Base
  default :from => "itusil@rocots.net"
  
  def account_verified(sponsor)
    # You only need to customize @recipients.
    @recipients = sponsor.user.email
    @subject = "Account Verified"
    @name = sponsor.name
    content_type "text/html"
  end
end
