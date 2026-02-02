class CommentsController < ApplicationController
  def create
    @ticket = Ticket.find(params[:ticket_id])
    # Como quitamos el login por ahora, asignaremos el primer usuario por defecto
    @comment = @ticket.comments.build(comment_params)
    @comment.user = User.first 

    if @comment.save
      redirect_to @ticket, notice: "Comentario añadido."
    else
      redirect_to @ticket, alert: "El comentario no puede estar vacío."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end