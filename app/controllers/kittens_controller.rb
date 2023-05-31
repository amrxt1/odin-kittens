class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
        flash[:notice] = "#{@kitten.name} says : 'Hello World!'"
        redirect_to @kitten
    else
        render :new, status: :unprocessable_entity
    end
  end

  def index
    @kittens = Kitten.all


    respond_to do |format|
        format.html
        format.json { render :json => @kittens }
    end

  end

  def show
    @kitten = Kitten.find(params[:id])
  
    if @kitten.nil?
      redirect_to new_kitten_path, notice: "Kitten does not exist! Create a New one :"
    else
        respond_to do |format|
            format.html
            format.json { render :json => @kitten }
        end
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to @kitten
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find( params[:id] )
    flash[:notice] = "R.I.P. #{@kitten.name}"
    @kitten.destroy

    redirect_to root_path
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
