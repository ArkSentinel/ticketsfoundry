module ApplicationHelper
  def status_badge_class(status)
    case status
    when 'open' then 'bg-info text-dark'
    when 'in_progress' then 'bg-warning text-dark'
    when 'resolved' then 'bg-success'
    when 'closed' then 'bg-secondary'
    else 'bg-light text-dark'
    end
  end

  def priority_badge_class(priority)
    case priority
    when 'urgent' then 'text-danger fw-bold'
    when 'high' then 'text-warning fw-bold'
    when 'medium' then 'text-primary'
    else 'text-muted'
    end
  end
end