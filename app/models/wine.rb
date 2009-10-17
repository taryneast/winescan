class Wine < ActiveRecord::Base


  # used as a short descriptor eg on the listing page for choosing which
  # wine we're listing.
  def display_name
    [self.name, self.producer].compact.join(' - ')
  end
end
