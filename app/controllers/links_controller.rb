class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to @link, notice: "Short link berhasil dibuat!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def redirect
    @link = Link.find_by(short_code: params[:short_code])
    if @link
      redirect_to @link.original_url, allow_other_host: true
    else
      redirect_to root_path, alert: "Short link tidak ditemukan."
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url, :short_code)
  end
end
