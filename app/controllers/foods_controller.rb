class FoodsController < ApplicationController
  def index
    ingredient = params[:q]

    conn = Faraday.new(url: "https://api.nal.usda.gov")

    response = conn.get("/fdc/v1/foods/search?api_key=EHI0GIZcmU2mxKfHlTgPCWX1OWHR8OUOQDnhpV9t&query=#{ingredient}")

    json = JSON.parse(response.body, symbolize_names: true)
    @foods = json[:foods]
  end
end
