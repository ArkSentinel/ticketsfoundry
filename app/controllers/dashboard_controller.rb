class DashboardController < ApplicationController
  def index
    # Gráficos que ya tenías
    @leaderboard = User.joins(:assigned_tickets)
                       .where(tickets: { status: [:resolved, :closed] })
                       .group('users.id')
                       .order('count(tickets.id) DESC')
                       .limit(10)

    @categories_report = Category.joins(:tickets)
                                 .group('categories.name')
                                 .count

    
    @tickets_por_estado = Ticket.group(:status).count
    @tickets_por_prioridad = Ticket.group(:priority).count

    # Listado
    @recent_tickets = Ticket.includes(:user, :category, :assignee).order(created_at: :desc).limit(10)
  end
end