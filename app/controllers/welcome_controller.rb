class WelcomeController < ApplicationController
  def index
    @articles = Article.all.order('id asc')
  end
end
