class Message < ActiveResource::Base
  self.site = "https://www.yammer.com"
  self.prefix = "/api/v1/"
  self.format = :json
end
