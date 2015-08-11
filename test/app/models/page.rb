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

class Page < ActiveRecord::Base

  belongs_to :site

  has_superslug :name, :permalink, :separator => '_', :force_update => true,
                :within_context => Site

end
