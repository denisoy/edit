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
    
    # Перевіряємо, чи передано значення для parent_id
    parent_id = params[:node][:parent_id]
    @node.parent_id = parent_id unless parent_id.blank?

    if @node.save
      redirect_to @node
    else
      render :edit
    end
  end
  

  def update
    if @node.update(node_params)
      
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
  
    respond_to do |format|
      format.html { redirect_to nodes_path }
      format.js   # це має відповідати за виклик destroy.js.erb
    end
  end
  
  private

  def set_node
    @node = Node.find(params[:id])
  end

  def node_params
    params.require(:node).permit(:title, :content, :parent_id)
  end
end
