FanHeH5::Admin.controllers :shings do
  get :index do
    @title = "Shings"
    @shings = Shing.all
    render 'shings/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'shing')
    @shing = Shing.new
    render 'shings/new'
  end

  post :create do
    @shing = Shing.new(params[:shing])
    if @shing.save
      @title = pat(:create_title, :model => "shing #{@shing.id}")
      flash[:success] = pat(:create_success, :model => 'Shing')
      params[:save_and_continue] ? redirect(url(:shings, :index)) : redirect(url(:shings, :edit, :id => @shing.id))
    else
      @title = pat(:create_title, :model => 'shing')
      flash.now[:error] = pat(:create_error, :model => 'shing')
      render 'shings/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "shing #{params[:id]}")
    @shing = Shing.find(params[:id])
    if @shing
      render 'shings/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'shing', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "shing #{params[:id]}")
    @shing = Shing.find(params[:id])
    if @shing
      if @shing.update_attributes(params[:shing])
        flash[:success] = pat(:update_success, :model => 'Shing', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:shings, :index)) :
          redirect(url(:shings, :edit, :id => @shing.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'shing')
        render 'shings/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'shing', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Shings"
    shing = Shing.find(params[:id])
    if shing
      if shing.destroy
        flash[:success] = pat(:delete_success, :model => 'Shing', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'shing')
      end
      redirect url(:shings, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'shing', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Shings"
    unless params[:shing_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'shing')
      redirect(url(:shings, :index))
    end
    ids = params[:shing_ids].split(',').map(&:strip)
    shings = Shing.find(ids)
    
    if Shing.destroy shings
    
      flash[:success] = pat(:destroy_many_success, :model => 'Shings', :ids => "#{ids.to_sentence}")
    end
    redirect url(:shings, :index)
  end
end
