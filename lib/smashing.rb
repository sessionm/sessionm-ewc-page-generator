require 'erb'
require 'optparse'
require 'fileutils'

options = {}

OptionParser.new do |opts|
  opts.banner = 'Usage: smashing [options]'

  opts.on('-a', '--apiKey API_KEY', 'API Key') do |v|
    options[:api_key] = v
  end
  opts.on('-b', '--baseUrl BASE_URL', 'Base URL') do |v|
    options[:base_url] = v
  end
  opts.on('-t', '--anonToken ANON_TOKEN', 'Anonymous User Token') do |v|
    options[:anon_token] = v
  end
  opts.on('-l', '--loginUrl LOGIN_URL', 'Login URL') do |v|
    options[:login_url] = v
  end
  opts.on('-id', '--clientId CLIENT_ID', 'Client ID') do |v|
    options[:client_id] = v
  end
  opts.on('-c', '--callbackUrl CALLBACK_URL', 'Callback URL') do |v|
    options[:callback_url] = v
  end
end.parse!

def copy_files
  FileUtils.cp('./assets/loyalty.css', './build')
  FileUtils.cp('./assets/loyalty.js', './build')
  FileUtils.cp('./assets/custom-styles.css', './build')
  FileUtils.cp('./assets/header.png', './build')
end

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

  def build
    FileUtils.mkdir_p('./build')
    template = File.read('./assets/template.html.erb')
    built = ERB.new(template).result(binding)
    File.write('./build/index.html', built)
    copy_files
    puts 'check output in ./build/'
  end
end

raise OptionParser::MissingArgument, 'Missing API Key' unless options[:api_key]
raise OptionParser::MissingArgument, 'Missing Base URL' unless options[:base_url]
raise OptionParser::MissingArgument, 'Missing Anonymous User Token' unless options[:anon_token]
raise OptionParser::MissingArgument, 'Missing Login URL' unless options[:login_url]
raise OptionParser::MissingArgument, 'Missing Client ID' unless options[:client_id]
raise OptionParser::MissingArgument, 'Missing Callback URL' unless options[:callback_url]

Smashing.new(**options).build
