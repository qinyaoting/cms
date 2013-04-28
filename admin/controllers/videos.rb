Cms::Admin.controllers :videos do
  get :index do
    @title = "Videos"
    @videos = Video.all(:order => "created_at DESC")
    render 'videos/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'video')
    @video = Video.new
    render 'videos/new'
  end

  post :create do
    @video = Video.new(params[:video])
    @video.account = current_account;
    if @video.save
      @title = pat(:create_title, :model => "video #{@video.id}")
      flash[:success] = pat(:create_success, :model => 'Video')
      params[:save_and_continue] ? redirect(url(:videos, :index)) : redirect(url(:videos, :edit, :id => @video.id))
    else
      @title = pat(:create_title, :model => 'video')
      flash.now[:error] = pat(:create_error, :model => 'video')
      render 'videos/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "video #{params[:id]}")
    @video = Video.find(params[:id])
    if @video
      render 'videos/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'video', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "video #{params[:id]}")
    @video = Video.find(params[:id])
    if @video
      if @video.update_attributes(params[:video])
        flash[:success] = pat(:update_success, :model => 'Video', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:videos, :index)) :
          redirect(url(:videos, :edit, :id => @video.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'video')
        render 'videos/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'video', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Videos"
    video = Video.find(params[:id])
    if video
      if video.destroy
        flash[:success] = pat(:delete_success, :model => 'Video', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'video')
      end
      redirect url(:videos, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'video', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Videos"
    unless params[:video_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'video')
      redirect(url(:videos, :index))
    end
    ids = params[:video_ids].split(',').map(&:strip).map(&:to_i)
    videos = Video.find(ids)
    
    if Video.destroy videos
    
      flash[:success] = pat(:destroy_many_success, :model => 'Videos', :ids => "#{ids.to_sentence}")
    end
    redirect url(:videos, :index)
  end
end
