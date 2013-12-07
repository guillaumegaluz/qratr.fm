module ApplicationHelper
  class Url
    def self.root_domain
      ENV["ROOT_DOMAIN"] || "http://localhost:5000"
    end
  end
end
