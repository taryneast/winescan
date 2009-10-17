class Supplier < ActiveRecord::Base
  belongs_to :listsings
  has_many :wines, :through => :listings
end
