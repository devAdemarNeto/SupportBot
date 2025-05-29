require 'yaml'
require 'fuzzy_match'

class HelpdeskBot
  def initialize
    path = Rails.root.join('lib', 'bot_knowledge', 'base.yml')
    @base = YAML.load_file(path)

    @problemas = @base.map do |chave, dados|
      {
        chave: chave,
        palavras_chave: dados["palavras_chave"],
        procedimentos: dados["procedimentos"]
      }
    end

    todas_palavras = @problemas.flat_map { |p| p[:palavras_chave] }
    @fuzzy = FuzzyMatch.new(todas_palavras)
  end

  def responder(entrada)
    entrada_downcase = entrada.downcase
    palavra_encontrada = @fuzzy.find(entrada_downcase)

    problema_encontrado = @problemas.find do |p|
      p[:palavras_chave].include?(palavra_encontrada)
    end

    if problema_encontrado
      resposta = "Problema: #{formatar_nome(problema_encontrado[:chave])}\n\n"
      resposta += "Procedimentos para resolução:\n\n"
      problema_encontrado[:procedimentos].each_with_index do |passo, i|
        resposta += "#{i + 1}. #{passo}\n"
      end
      resposta
    else
      "Desculpe, não encontrei uma solução para esse problema."
    end
  end

  private

  def formatar_nome(nome_chave)
    nome_chave.tr('_', ' ').capitalize
  end
end
