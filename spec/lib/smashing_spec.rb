RSpec.describe 'Smashing option parser', order: :defined do
  describe 'option validation' do
    subject { require './lib/smashing.rb' }

    def raise_missing_arg_error
      raise_error(OptionParser::MissingArgument)
    end

    after do
      stub_const('ARGV', [])
    end

    context 'api_key is missing' do
      it 'throws an error' do
        expect { subject }.to raise_missing_arg_error
      end
    end

    context 'base_url is missing' do
      before do
        stub_const('ARGV', ['-a 1'])
      end

      it 'throws an error' do
        expect { subject }.to raise_missing_arg_error
      end
    end

    context 'anon_token is missing' do
      before do
        stub_const('ARGV', ['-a 1', '-b 1'])
      end

      it 'throws an error' do
        expect { subject }.to raise_missing_arg_error
      end
    end

    context 'login_url is missing' do
      before do
        stub_const('ARGV', ['-a 1', '-b 1', '-t 1'])
      end

      it 'throws an error' do
        expect { subject }.to raise_missing_arg_error
      end
    end

    context 'client_id is missing' do
      before do
        stub_const('ARGV', ['-a 1', '-b 1', '-t 1', '-l 1'])
      end

      it 'throws an error' do
        expect { subject }.to raise_missing_arg_error
      end
    end

    context 'callback_url is missing' do
      before do
        stub_const('ARGV', ['-a 1', '-b 1', '-t 1', '-l 1', '-id 1'])
      end

      it 'throws an error' do
        expect { subject }.to raise_missing_arg_error
      end
    end

    context 'all required options are present' do
      before do
        stub_const('ARGV', ['-a 1', '-b 1', '-t 1', '-l 1', '-id 1', '-c 1'])
      end

      let(:smashing_stub) { double('smashing_stub') }

      it 'calls Smashing.new and then builds' do
        expect(Smashing).to(receive(:new).once { smashing_stub })
        expect(smashing_stub).to receive(:build).once
        expect(STDOUT).to receive(:puts).once
        require './lib/smashing.rb'
      end
    end
  end
end
