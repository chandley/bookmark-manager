require "net/https"  
require "uri"
require "mailgun"

class Server
  def send_simple_message(message_text)
    p ENV["MAILGUNAPIKEY"]
    RestClient.post "https://#{ENV["MAILGUNAPIKEY"]}"\
    "@api.mailgun.net/v2/sandbox4ba11ea0d0654ec4997c99687a2a1bd9.mailgun.org/messages",
    :from => "Mailgun Sandbox <postmaster@sandbox4ba11ea0d0654ec4997c99687a2a1bd9.mailgun.org>",
    :to => "chris handley <chrisrhandley@gmail.com>",
    :subject => "Mail from Bookmark Manager",
    :text => message_text 
  end
end
    # RestClient.post "https://api:key-6b236d755b4e572ea324a026d2bea9dd"\