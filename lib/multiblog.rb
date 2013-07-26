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

    def current_blog
        blog_instances.each do |key, blog|
          found = blog.data.article(current_resource.path)
          return key if found
        end

        nil
      end
  end

end

::Middleman::Extensions.register(:all_articles, MultiBlog) 
::Middleman::Extensions.register(:current_blog, MultiBlog) 
