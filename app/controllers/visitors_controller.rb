class VisitorsController < ApplicationController

  def new
	@post = Post.all.last(6)
	@category = Category.all
  end
  
  def invite
  
  end
  
end
