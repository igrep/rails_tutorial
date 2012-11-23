class PagesController < ApplicationController

  PAGES = %w[home contact about help].freeze

  PAGES.each {|page|
    define_method page {
      self.instance_variable_set "@#{page}", __method__.to_s.capitalize
    }
  }
end
