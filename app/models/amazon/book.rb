class Amazon::Book
  def self.find_by_asin(asin, country="jp")
    Amazon::Ecs.item_lookup(asin, {:response_group => 'Medium', 
                                   :sort => 'salesrank', 
                                   :country => country}).items
  end

  def self.find_by_terms(terms, country="jp", page=1)
    Amazon::Ecs.item_search(terms, {:response_group => 'Medium',
                                    :sort => 'salesrank', 
                                    :country => country, 
                                    :item_page => page}).items
  end
end
