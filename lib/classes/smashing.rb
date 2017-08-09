# the magic happens here
class Smashing
  attr_reader :api_key, :base_url, :anon_token,
              :login_url, :client_id, :callback_url

  def initialize(**options)
    @api_key = options[:api_key]
    @base_url = options[:base_url]
    @anon_token = options[:anon_token]
    @login_url = options[:login_url]
    @client_id = options[:client_id]
    @callback_url = options[:callback_url]
  end

  def self.copy_files
    FileUtils.cp('./assets/loyalty.css', './build')
    FileUtils.cp('./assets/loyalty.js', './build')
    FileUtils.cp('./assets/custom-styles.css', './build')
    FileUtils.cp('./assets/header.png', './build')
  end

  def build
    FileUtils.mkdir_p('./build')
    template = File.read('./assets/template.html.erb')
    built = ERB.new(template).result(binding)
    File.write('./build/index.html', built)
    Smashing.copy_files
  end
end
