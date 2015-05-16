class ChartsController < ApplicationController
  def index
  end

  def get_data
    file_path = Rails.root.join('db', 'data.json')

    @data = File.read(file_path)

    render json: @data
  end
end
