class PagesController < ApplicationController

  PAGES = [:home, :contact, :about, :help].freeze

  PAGES.each {|page|
    define_method page do
      self.instance_variable_set :"@#{page}", __method__.to_s.capitalize
    end
  }
end
