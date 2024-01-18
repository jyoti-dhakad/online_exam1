class QuestionsController < ApplicationController
  def index
    @categories = Category.all
    @questions = if params[:category_id].present?
                   Category.find(params[:category_id]).questions.to_a
                 else
                   Question.all.to_a
                 end
  end
end
