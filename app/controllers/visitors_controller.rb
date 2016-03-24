class VisitorsController < ApplicationController
  def index
  end

  def contact
    h = JSON.generate({
      'name' => params[:name],
      'email' => params[:email],
      'message' => params[:message]
      })

    PostmanWorker.perform_async(h,5)
    flash[:success] = "Message sent. Please Check your email!"
    redirect_to '/'
  end

  def welcome
    h = JSON.generate({
      'name' => params[:name],
      'email' => params[:email],
      'message' => params[:message]
      })

    PostmanWorker.perform_async(h,5)
    flash[:success] = "Thanks for register! Please check your email"
    redirect_to '/'
  end
  
end
