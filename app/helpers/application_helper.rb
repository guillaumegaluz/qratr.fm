module ApplicationHelper
  class Url
    def self.root_domain
      ENV["ROOT_DOMAIN"] || "http://localhost:5000"
    end
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}?s=30.png"
  end
end
