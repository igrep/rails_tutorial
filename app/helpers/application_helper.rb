module ApplicationHelper
  BASE_TITLE = "Ruby on Rails Tutorial Sample App".freeze
  # Return a title on a per-page basis.
  def title
    if @title.presence
      "#{BASE_TITLE} | #@title"
    else
      BASE_TITLE
    end
  end
end
