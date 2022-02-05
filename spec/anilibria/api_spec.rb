RSpec.describe Anilibria::Api do
  it 'works' do
    expect(described_class).not_to be_nil
  end

  it 'has a version number' do
    expect(described_class::VERSION).not_to be_nil
  end
end
