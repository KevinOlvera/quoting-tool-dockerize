class QuotingMailer < ApplicationMailer
  def send_pdf(user, quote, file)
    @quote = quote
    @greeting = "Hi #{user.email}"
    attachments["Quote_#{@quote.id}_#{@quote.account_name}_#{@quote.created_at}.pdf"] = file
    attachments.inline['NOKIA_LOGO_RGB_MR.png'] = File.read("#{Rails.root}/app/assets/images/NOKIA_LOGO_RGB_MR.png")
    mail(to: user.email, subject: "Quoting Tool")
  end
end
