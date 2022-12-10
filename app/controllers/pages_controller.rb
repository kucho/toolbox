# frozen_string_literal: true

class PagesController < ApplicationController
  def landing
    render(Landing::RootView.new)
  end
end
