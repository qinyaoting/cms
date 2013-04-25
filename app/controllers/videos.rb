Cms::App.controllers :videos do
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
  @videos = Video.all(:order => 'created_at desc')
  render 'videos/index'
  end

  get :show, :with => :id do
    @videos = Video.find_by_id(params[:id])
    render 'videos/show'
  end

end
