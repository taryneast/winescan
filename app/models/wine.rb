class Wine < ActiveRecord::Base
  has_many :listings
  has_many :suppliers, :through => :listings


  # used as a short descriptor eg on the listing page for choosing which
  # wine we're listing.
  def display_name
    if self.name.present?
      [self.name, self.producer].join(' - ')
    else
      self.producer
    end
  end

  def display_location
    [self.country, self.region, self.appellation].map{|n| n.present? ? n : nil}.compact.join(', ')
  end
end
