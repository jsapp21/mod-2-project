class CartsController < ApplicationController

  skip_before_action :authorize, only: [:update, :show, :edit, :destory, :remove_item]
    
    def update
      cart << params[:item_id] 
      flash[:notice] = "Crave added to cart!"
      redirect_to request.referrer
    end

    def show
      @hide_cart = true
    end

    def edit
      @hide_cart = true
    end

    def remove_item
      session[:cart].delete(params[:item_id])
      redirect_to request.referrer
    end

    def destroy
      
    end

  end
