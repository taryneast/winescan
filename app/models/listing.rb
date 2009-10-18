class Listing < ActiveRecord::Base
  belongs_to :wine
  belongs_to :supplier

  # construct n affiliate link bsed on the supplier's url plus the affiliate
  # code for us, plus the supplier's id for this product
  def affiliate_link
    [self.supplier.store_url, self.supplier_side_wine_id].join('')
  end

  def to_xml(options = {})
    {:supplier => self.supplier, 
     :puchase_link => self.affiliate_link }.to_xml
  end

end
