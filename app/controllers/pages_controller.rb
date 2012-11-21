class PagesController < ApplicationController

  def title
    @title
  end

  def home
    @title = __method__.to_s.capitalize
  end

  def contact
    @title = __method__.to_s.capitalize
  end

  def about
    @title = __method__.to_s.capitalize
  end
end
