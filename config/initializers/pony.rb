Pony.options = {
  :to => 'sungho@condorentalstonight.com',
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => "GMAIL_USERNAME"],
    :password             => "GMAIL_PASSWORD"],
    :authentication       => :login, # :plain, :login, :cram_md5, no auth by default
    :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
  }
}