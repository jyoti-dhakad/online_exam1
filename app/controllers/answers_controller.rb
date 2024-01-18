class AnswersController < ApplicationController
    def create
        @answer = current_user.user_answers.build(user_answer_params)
    
        if @answer.save
            redirect_to category_questions_path(@answer.question.category_id), notice: "Answer submitted successfully."
        else
          render :new
        end
    end
    
    private
    
    def user_answer_params
       params.require(:answer).permit(:text, :question_id)
    end
end
