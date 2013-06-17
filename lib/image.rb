module Image
  class << self
    def registered(app)
			app.helpers Helpers
    end
    alias :included :registered
  end

  module Helpers
    def image(file, options={})
	title = current_article.title

        "/blog/#{title}/#{file}"
    end
  end

end

::Middleman::Extensions.register(:image, Image) 
