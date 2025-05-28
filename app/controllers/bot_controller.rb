class BotController < ApplicationController
  def index
    @resposta = flash[:resposta]
  end

  def responder
    bot = HelpdeskBot.new
    entrada = params[:mensagem]
    resposta = bot.responder(entrada)

    flash[:resposta] = resposta
    redirect_to root_path
  end
end
