class VisitorsController < ApplicationController

  def new
	@post = Post.all.last(2)
  end
  
end
