module ApplicationHelper
  class Url
    def self.root_domain
      ENV["ROOT_DOMAIN"] || "http://localhost:3000"
    end
  end
end
