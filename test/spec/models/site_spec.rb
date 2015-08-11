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
    site = create(:site, :title => 'Hello World 01')
    expect(site.slug).to eq('hello-world-01')
  end

  it 'replaces multiple spaces with one hyphen' do
    site = create(:site, :title => 'Hello   World  02')
    expect(site.slug).to eq('hello-world-02')
  end

  it 'replaces multiple hyphens with one hyphen' do
    site = create(:site, :title => 'Hello-- --World----03')
    expect(site.slug).to eq('hello-world-03')
  end

  it 'will append the id if the slug already exists' do
    create(:site, :title => 'Hello World 04')
    site = create(:site, :title => 'Hello World 04')
    expect(site.slug).to eq("hello-world-04-#{site.id}")
  end

  it 'will not change the slug if the record is updated' do
    site = create(:site, :title => 'Hello World 05')
    site.update(:title => 'Goodbye World 06')
    expect(site.slug).to eq("hello-world-05")
  end

end
