class SkillsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_skill, only: [:show]

  def index
    @skills = current_user.skills
  end

  def new
    @skill = Skill.new
  end

  def show
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user = current_user
    if @skill.save
      current_user.update_followers_about_skill(@skill.name)
      redirect_to @skill, notice: 'New skill added'
    else
      render :new
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
