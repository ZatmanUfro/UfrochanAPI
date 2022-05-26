class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :destroy]

  # GET /boards
  def index
    @boards = Board.where(answer: nil)

    render json: @boards
  end

  # GET /boards/1/answers
  def answers
    @boards = Board.where("answer LIKE :answer", answer: params[:id])

    render json: @boards
  end
  # GET /boards/1
  def show
    render json: @board
  end

  # POST /boards
  def create
    @board = Board.new(board_params)

    if @board.save
      render json: @board, status: :created, location: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boards/1
  def update
    if @board.update(board_params)
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # DELETE /boards/1
  def destroy
    @board.destroy
  end

  private
  
    def set_board
      @board = Board.find(params[:id])
    end

   
    def board_params
      params.require(:board).permit(:name, :content, :answer)
    end
end
