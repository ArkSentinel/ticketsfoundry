class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :update]


  def index
    @tickets = Ticket.all
    @tickets = @tickets.where(status: params[:status]) if params[:status].present?
    @tickets = @tickets.where(priority: params[:priority]) if params[:priority].present?
    @tickets = @tickets.order(created_at: :desc)
  end

  def new
    @ticket = Ticket.new
  end
  def show
    # @ticket ya está cargado por set_ticket
  end

  def create
    # Mientras no hay login, asignamos el primer usuario
    @ticket = User.first.tickets.build(ticket_params)
    @ticket.status = :open
    
    if @ticket.save
      redirect_to tickets_path, notice: "¡Ticket creado con éxito!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: "El ticket se actualizó correctamente."
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:status, :assignee_id, :title, :description, :priority, :category_id)
  end
end