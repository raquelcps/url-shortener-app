class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new({:user_id => params[:user_id], :slug => params[:slug], :target_url => params[:target_url]})
    if @link.save
      flash[:success] = "Link Added."
      redirect_to links_path
    else
      flash[:info] = "Something is wrong with your form"
      render "new"
    end
  end

  def redirect
    @link = Link.find_by(:slug => params[:slug])

    redirect to @link.target_url
  end

end
