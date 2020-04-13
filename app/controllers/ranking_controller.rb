class RankingController < ApplicationController

  def index
    product_ids = Comment.group(:bookreview_id).order('count_bookreview_id DESC').limit(20).count(:bookreview_id).keys
    @rankings = product_ids.map { |id| Bookreview.find(id) }
  end

end
