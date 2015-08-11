# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

# ===============================
# Note: This model is used to test the base functionality of Superslug. The Page
# model is used to test how a model acts within the context of an object of
# another model.
# ===============================

RSpec.describe Site, :type => :model do

  it 'replaces single spaces with hyphens' do
    site = create(:site, :title => 'Hello World')
    expect(site.slug).to eq('hello-world')
  end

  it 'replaces multiple spaces with one hyphen' do
    site = create(:site, :title => 'Hello   World')
    expect(site.slug).to eq('hello-world')
  end

  it 'replaces multiple hyphens with one hyphen' do
    site = create(:site, :title => 'Hello-- --World----123')
    expect(site.slug).to eq('hello-world-123')
  end

  it 'will append the id if the slug already exists' do
    create(:site, :title => 'Hello World')
    site = create(:site, :title => 'Hello World')
    expect(site.slug).to eq("hello-world-#{site.id}")
  end

end
