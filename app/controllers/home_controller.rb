class HomeController < ApplicationController
  def index
    @current_date = Time.now
    do_it
  end

  def the_time_is_now
    @current_date = Time.new(2012, 10, 7, 0, 0, 0, 0)
    do_it
  end

  def do_it
    if birthday_today?
      @answer = "Yes!"
      @additional = "Happy bath day, Simon! If you're not Simon, and you haven't already got him a present, maybe you should buy something like "
      @link = "http://www.thefancy.com/things/shuffle?ctid=186895654038015905"
    else
      @answer = "Maybe."
      @additional = "Don't think about it too hard. Buy yourself something cool, like "
      @link = "http://www.thefancy.com/things/shuffle?ctid=186895654038015905"
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @countries }
    end
  end

  def birthday_today?
    if @current_date.month == 10 && @current_date.day == 7
      true
    else
      false
    end
  end

end