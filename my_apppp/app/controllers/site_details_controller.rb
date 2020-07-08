class SiteDetailsController < ApplicationController
  before_action :ensure_login, only: [:index]
  before_action :set_site, only: [:create]


  def index
    # @site=SiteDetail.find(params[:id])
  end
  def new

  end
  def create
    u= params[:site_details]
    puts u[:url]
    @site = SiteDetail.find_by(url: u[:url])
    p @site.email
    if @site
      # format.html { redirect_to new_site_details }
    end
  end
  def show
    @site = SiteDetail.find_by(url: params[:url])
  end
  private

  def set_site
    @site = SiteDetail.find_by(url: params[:url])
  end

end