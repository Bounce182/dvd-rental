class IndexController < ApplicationController
  def index
    @dvds = Dvd.all
  end
end
