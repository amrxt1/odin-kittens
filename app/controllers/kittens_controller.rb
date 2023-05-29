class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
        redirect_to @kitten
    else
        render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  def show
    @kitten = Kitten.find_by(id: params[:id])
  
    if @kitten.nil?
      redirect_to new_kitten_path, notice: "Kitten does not exist! Create a New one :"
    else
      render :show
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
