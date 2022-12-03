# frozen_string_literal: true

class PagesController < ApplicationController
  def landing
    render(Views::Pages::Landing.new)
  end

  def dashboard
    render(Views::Pages::Dashboard.new)
  end
end
