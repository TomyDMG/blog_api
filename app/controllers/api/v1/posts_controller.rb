class Api::V1::PostsController < Api::V1::ApiApplicationController
  before_action :set_post, only: [:show]

  #GET /api/v1/posts.json
  def index
    @posts = Post.page(params[:page]).per(params[:per_page])
    response.headers['X-Total-Count'] = @posts.total_count.to_s
    response.headers["X-Pages-Count"] = @posts.total_pages.to_s

    render json: @posts, except: [:created_at, :updated_at, :user_id]
  end

  #GET /api/v1/posts/:post_id.json
  def show
    render json: @post, except: [:created_at, :updated_at, :user_id]
  end

  # POST /api/v1/posts.json
  def create
    @post = current_user.posts.new post_params
    set_author

    if @post.published_at == nil
      @post.published_at = Time.zone.now
    end

    if @post.save
      render json: @post, status: :created, except: [:created_at, :updated_at, :user_id]
    else
      render status: :not_acceptable, json: { errors: @post.errors }
    end
  end

  private

  def post_params
    params.require(:post).permit :title, :body, :published_at
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_author
    @post.author = current_user.nickname
  end
end
