require 'erb'

class Facebook
  def self.config
    @config ||= YAML.load(ERB.new(File.read("#{Rails.root}/config/facebook.yml")).result)[Rails.env].symbolize_keys
  end
end
