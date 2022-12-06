# frozen_string_literal: true

class PagesController < ApplicationController
  def landing
    render(Views::Pages::Landing.new)
  end
end
