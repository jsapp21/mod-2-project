class CartsController < ApplicationController

  skip_before_action :authorize, only: [:update, :show, :edit, :destory, :remove_item]

    # add item to cart - i think we need to move this
    def update
      cart << params[:item_id]
      flash[:notice] = "item added to cart!"
      redirect_to request.referrer
    end

    def show
      @hide_cart = true
    end

    def edit
      @hide_cart = true
    end

    # need to do
    def remove_item

      session[:cart].delete(params[:item_id])
      redirect_to request.referrer
    end

    # checkout - add redirect_to and flash checkout
    def destroy
      session.delete(:cart)
      render :checkout
    end

  end
