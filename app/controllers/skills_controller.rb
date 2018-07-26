class SkillsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_skill, only: [:show]

  def index
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
  end

  def show
  end

  def create
    @skill = Skill.new(skill_params)
    binding.pry
    @skill.user = current_user
    if @skill.save
      redirect_to @skill, notice: 'New skill added'
    else
      render :new, error: 'Something went wrong, please try again'
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :type)
  end

  def find_skill
    @skill = Skill.find(params[:id])
  end
end
