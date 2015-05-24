class Api::V1::ChartsController < ApiController
  def index
    file_path = Rails.root.join('db', 'data.json')
    # file_path = Rails.root.join('db', 'data.received.json')

    @data = File.read(file_path)

    render json: @data
  end

  def create
    data = params[:wh]

    file_path = Rails.root.join('db', 'data.received.json')

    puts data.to_json

    File.open(file_path, 'w') do |f|
      f.write(data.to_json)
    end



    # CSV.open(file_path, 'w') do |csv|
    #   data.each do |d|
    #     csv << d.values
    #   end
    # end

    render json: { message: 'JSON received!' }
  end
end
