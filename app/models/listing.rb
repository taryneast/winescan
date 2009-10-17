class Listing < ActiveRecord::Base
  belongs_to :wine
  belongs_to :supplier
end
