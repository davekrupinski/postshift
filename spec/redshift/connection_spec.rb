require 'spec_helper'

RSpec.describe ActiveRecord::ConnectionAdapters::RedshiftAdapter, type: :model do
  subject { ARTest.connect.connection }

  it 'can connect to Redshift' do
    is_expected.to be_a ActiveRecord::ConnectionAdapters::RedshiftAdapter
  end

  it 'sets Postshift.adapter' do
    expect(Postshift.adapter).to be_a ActiveRecord::ConnectionAdapters::RedshiftAdapter
  end

  describe '#native_database_types' do
    it do
      expect(subject.native_database_types.keys).to eq \
        %i( primary_key string text integer float decimal datetime time date bigint boolean )
    end
  end
end
