class Amazon::Book
  def self.find_by_asin(asin)
    Amazon::Ecs.item_lookup(asin, {:response_group => 'Medium', :sort => 'salesrank', :country => :jp}).items
  end

  def self.find_by_term(terms)
    Amazon::Ecs.item_search(terms, {:response_group => 'Medium', :sort => 'salesrank', :country => :jp}).items
  end
end
