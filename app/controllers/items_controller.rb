class ItemsController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @item = @list.items.build
  end

  def create
    @item = Item.new(params[:item])
    @list = List.find params[:list_id]
    @item.list_id = @list.id
    respond_to do |format|
      if @item.save
        format.js
      else
        flash[:error] = "Item description cannot be blank"
        render 'new'
      end
    end
  end

  def show
     @item = Item.find(params[:id])
     @list = List.find(params[:list_id])
  end

  def edit
    @item = Item.find(params[:id])
    @list = List.find(params[:list_id])
  end

  def update
    @item = Item.find(params[:id])
    @list = @item.list
    if @item.update_attributes(params[:item])
      flash[:notice] = "Your item has been updated"
      redirect_to @list
    end
  end
  
  def destroy
     @item = Item.find(params[:id])
     @list = @item.list
     @item.destroy
     flash[:notice] = "Your item has been deleted."
     redirect_to list_path(@list)
  end

end


