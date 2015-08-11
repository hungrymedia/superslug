# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  permalink  :string(255)
#  site_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

# ===============================
# Note: The Site model is used to test the base functionality of Superslug. This
# model is used to test how a model acts within the context of an object of
# another model. We also use this model to test some options.
# ===============================

RSpec.describe Page, :type => :model do

  before :all do
    @site_1 = create(:site, :title => 'Hello World')
    @site_2 = create(:site, :title => 'Goodbye World')
  end

  it 'will use underscores if the option is specified' do
    page = create(:page, :name => 'Hello World')
    expect(page.permalink).to eq('hello_world')
  end

  it 'will not append the id if an identical slug exists but belongs to a different site' do
    create(:page, :name => 'Hello World', :site => @site_1)
    page = create(:page, :name => 'Hello World', :site => @site_2)
    expect(page.permalink).to eq('hello_world')
  end

  it 'will append the id if the slug is duplicated for records belonging to the same site' do
    create(:page, :name => 'Hello World', :site => @site_1)
    page = create(:page, :name => 'Hello World', :site => @site_1)
    expect(page.permalink).to eq("hello_world_#{page.id}")
  end

end
