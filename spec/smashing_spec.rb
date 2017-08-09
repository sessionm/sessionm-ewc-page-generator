require './lib/classes/smashing.rb'
require 'fileutils'

RSpec.describe Smashing do
  describe 'self.copy_files' do
    subject { Smashing.copy_files }
    it 'calls the necessary methods' do
      expect(FileUtils).to receive(:cp).exactly(4).times
      subject
    end
  end

  describe 'initialize' do
    let(:api_key) { Faker::RickAndMorty.quote }
    let(:base_url) { Faker::RickAndMorty.character }
    let(:anon_token) { Faker::RickAndMorty.location }
    let(:login_url) { Faker::RickAndMorty.quote }
    let(:client_id) { Faker::RickAndMorty.character }
    let(:callback_url) { Faker::RickAndMorty.location }
    let(:options) do
      {
        api_key: api_key,
        base_url: base_url,
        anon_token: anon_token,
        login_url: login_url,
        client_id: client_id,
        callback_url: callback_url
      }
    end

    subject { Smashing.new(options) }

    before do
      subject
    end

    it 'sets the api_key from options' do
      expect(subject.api_key).to eq(api_key)
    end

    it 'sets the base_url from options' do
      expect(subject.base_url).to eq(base_url)
    end

    it 'sets the anon_token from options' do
      expect(subject.anon_token).to eq(anon_token)
    end

    it 'sets the login_url from options' do
      expect(subject.login_url).to eq(login_url)
    end

    it 'sets the client_id from options' do
      expect(subject.client_id).to eq(client_id)
    end

    it 'sets the callback_url from options' do
      expect(subject.callback_url).to eq(callback_url)
    end
  end

  describe 'build' do
    subject { Smashing.new({}) }
    let(:erb_double) { double('erb_double') }

    it 'calls the necessary methods' do
      expect(FileUtils).to receive(:mkdir_p).once
      expect(File).to receive(:read).once
      expect(ERB).to receive(:new).once { erb_double }
      expect(erb_double).to receive(:result).once
      expect(File).to receive(:write).once
      expect(Smashing).to receive(:copy_files).once
      subject.build
    end
  end
end
