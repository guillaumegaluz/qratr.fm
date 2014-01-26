class Subscriber < ActiveRecord::Base
  validates_uniqueness_of :email
  after_save :save_to_mailchimp

  def save_to_mailchimp
    gb = Gibbon::API.new(ENV["MAILCHIMP_API_KEY"])
    gb.lists.subscribe({
      :id => "3541caf364",
      :email => {
        :email => self.email
      },
      :double_optin => false
    })
  end
end
