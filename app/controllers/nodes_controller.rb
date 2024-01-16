# app/controllers/nodes_controller.rb
class NodesController < ApplicationController
  before_action :set_node, only: [:show, :edit, :update, :destroy]

  def index
    @nodes = Node.all
  end

  def show
    puts "Showing Node: #{@node.inspect}"
  end

  def new
    @node = Node.new
  end

  def create
    @node = Node.new(node_params)

    if @node.save
      redirect_to @node, notice: 'Node was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @node.update(node_params)
      redirect_to @node, notice: 'Node was successfully updated.'
    else
      render :edit
    end
  rescue => e
    flash[:alert] = "Error updating node: #{e.message}"
    Rails.logger.error("Error updating node: #{e.message}")
  end
  
  def destroy
    if @node.destroy
      flash[:notice] = 'Node was successfully destroyed.'
    else
      flash[:alert] = 'Error destroying node.'
      Rails.logger.error("Error destroying node: #{node.errors.full_messages}")
    end
    redirect_to root_path
  end
    
  private

  def set_node
    @node = Node.find(params[:id])
  end

  def node_params
    params.require(:node).permit(:title, :content)
  end
end
