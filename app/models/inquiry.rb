class Inquiry
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include ActionView::Helpers::TextHelper
  
  attr_accessor :name, :email, :phone, :condo, :check

  validates :condo, 
            :presence => true
  
  validates :name, 
            :presence => true
  
  validates :email,
            :format => { :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ },
            :presence => true

  validates :phone,
            :length => { :minimum => 7, :maximum => 10 },
            :presence => true     

  validates :check,
            :presence => true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def deliver
    return false unless valid?
    Pony.mail({
      :from => %("#{name}" <#{email}>),
      :reply_to => "sungho@condorentalstonight.com",
      :subject => "CondoRentalTonight Reservation",
      :body => message,
      :html_body => simple_format(message)
    })
  end
      
  def persisted?
    false
  end
end