class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    @list = List.find params[:list_id]
    @item.list_id = @list.id
    if @item.save
      redirect_to list_path(@list)
    else
      flash[:error] = "Item description cannot be blank"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

end
