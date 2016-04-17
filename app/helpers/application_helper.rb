module ApplicationHelper

    def all_gifs(category)
      if category.split.count > 1
        category = category.split.join("+")
      end
      response = Faraday.get("http://api.giphy.com/v1/gifs/search?q=#{category}&api_key=dc6zaTOxFJmzC")
      data = JSON.parse(response.body)
      get_paths(data)
    end

    def get_paths(data)
    data["data"].map do |data|
      data["images"]["fixed_height"]["url"]
      end
    end
end
