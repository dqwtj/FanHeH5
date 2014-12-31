FanHeH5::Tung.controllers :shings do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  get :index do
    
    @yday = Date.today.yday
    @shings = Shing.all.sample(4)
    @item = Item.create_with(go1: @shings.pop.id, go2: @shings.pop.id, stop1: @shings.pop.id, stop2: @shings.pop.id).find_or_create_by(yday: @yday)
        
    @go1 = Shing.find @item.go1
    @go2 = Shing.find @item.go2
    @stop1 = Shing.find @item.stop1
    @stop2 = Shing.find @item.stop2
    render 'shings/index'

  end

end
