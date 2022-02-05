RSpec.describe Anilibria::Api::Client do # rubocop:disable Metrics/BlockLength
  let(:anilibria) { described_class.new }
  let(:types) { Anilibria::Api::Types }
  let(:dry_types) { Anilibria::Api::Types::DryTypes }

  describe '::api_method' do
    it 'dynamically defines an instance method' do
      described_class.api_method :years, 'getYears', returns: dry_types::Array.of(dry_types::Strict::Integer)

      expect(anilibria).to respond_to(:years)
    end

    it 'defined an instance method that returns Array of Integer' do
      expect(anilibria.public_send(:years)).to all(be_an(Integer))
    end
  end

  describe '::api_methods' do
    it 'returns an Array of Symbol' do
      expect(described_class.api_methods).to all(be_an(Symbol))
    end

    it 'returns new object' do
      expect(described_class.api_methods).not_to be(described_class.api_methods)
    end
  end

  describe '::new' do
    it 'returns an instance of itself' do
      expect(anilibria).to be_instance_of(described_class)
    end
  end

  describe '#connection' do
    it 'returns connection object' do
      expect(anilibria.connection).to be_instance_of(Faraday::Connection)
    end
  end

  describe '#call' do
    let(:method_name) { 'getRandomTitle' }

    context 'with valid parameters' do
      it 'returns a Hash-like object' do
        expect(anilibria.call(method_name)).to respond_to(:to_hash)
      end
    end

    context 'with invalid parameters' do
      it 'raises an error' do
        expect { anilibria.call(method_name, wrong_param: '123') }.to(
          raise_error(Anilibria::Api::Exceptions::ApiError)
        )
      end
    end
  end

  context 'when you try to auth with invalid parameters' do
    let(:mail) { 'wrongemail@gmail.com' }
    let(:passwd) { 'WrongPassword123' }

    describe '#auth' do
      it 'returns nil' do
        expect(anilibria.auth(mail, passwd)).to be_nil
      end
    end

    describe '#auth!' do
      it 'raises an error' do
        expect { anilibria.auth!(mail, passwd) }.to raise_error(Anilibria::Api::Exceptions::AuthError)
      end
    end
  end

  # context 'when you auth with valid parameters' do
  #   let(:mail) { 'testuser@test.user' }
  #   let(:passwd) { 'testpass' }

  #   describe '#auth' do
  #     it 'returns session (String)' do
  #       expect(anilibria.auth(mail, passwd)).to be_instance_of(String)
  #     end
  #   end

  #   describe '#auth!' do
  #     it 'returns session (String)' do
  #       expect(anilibria.auth!(mail, passwd)).to be_instance_of(String)
  #     end
  #   end
  # end

  describe '#api_version' do
    let(:api_version) { anilibria.api_version }

    it 'returns String' do
      expect(api_version).to be_instance_of(String)
    end

    it 'matches to a constant' do
      expect(api_version).to start_with(Anilibria::Api::Client::API_VERSION)
    end
  end
end
