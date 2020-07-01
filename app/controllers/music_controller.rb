class MusicController < ApplicationController
  def index
  end

  def auto_complete
    results = auto_complete_track(params[:track].capitalize)
    @results = results["hints"]
    unless @results.present?
      flash[:alert] = 'track not found'
      return render action: :index
    end
    render json: @results
  end

  def search
    results = find_track(params[:track].capitalize)
    @results = results["tracks"]["hits"]
    unless @results.present?
      flash[:alert] = 'track not found'
      return render action: :index
    end
  end

  private

  def find_track(track)
    query = URI.encode(track)
    request_api(
      "https://shazam.p.rapidapi.com/search?locale=en-US&offset=0&limit=10&term=#{query}"
    )
  end

  def auto_complete_track(track)
    query = URI.encode(track)
    request_api(
      "https://shazam.p.rapidapi.com/auto-complete?locale=en-US&term=#{query}"
    )
  end

  def request_api(url)
    response = Excon.get(
      url,
      headers: {
        'X-RapidAPI-Host' => URI.parse(url).host,
        'X-RapidAPI-Key' => ENV.fetch('RAPIDAPI_API_KEY')
      }
    )
    return nil if response.status != 200
    JSON.parse(response.body)
  end

end
