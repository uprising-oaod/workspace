class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(title: "...", body: "...")

    if @page.save
      redirect_to @page
    else
      render :new, status: :unprocessable_entity
    end
  end
end
