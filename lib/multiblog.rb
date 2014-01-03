module MultiBlog
  class << self
    def registered(app)
	app.helpers Helpers
    end
    alias :included :registered
  end

  module Helpers
    def all_articles()
        all = []
	blog_instances.keys.each do |key|
          all.push(*blog_instances[key.to_sym].data.articles)
        end
        all.sort! { |a,b| b.date <=> a.date }
    end

  end

end

::Middleman::Extensions.register(:all_articles, MultiBlog) 
