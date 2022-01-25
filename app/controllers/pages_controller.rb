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
    @page = Page.new(page_params)

    if @page.save
      redirect_to @page
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      redirect_to @page
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def page_params
    params.require(:page).permit(:title, :body)
  end
end
