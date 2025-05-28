require 'yaml'
require 'fuzzy_match'

class HelpdeskBot
  def initialize
    path = Rails.root.join('lib', 'bot_knowledge', 'base.yml')
    @base = YAML.load_file(path)

    # Montar lista de todos os termos (palavras-chave) para busca com referência ao problema
    @keywords_map = {} # chave: palavra-chave, valor: nome do problema

    @base.each do |problema, dados|
      palavras = dados["palavras_chave"].map(&:downcase)
      palavras.each do |palavra|
        @keywords_map[palavra] = problema
      end
    end

    # Criar o objeto fuzzy_match para palavras-chave
    @fuzzy = FuzzyMatch.new(@keywords_map.keys)
  end

  def responder(entrada)
    entrada_downcase = entrada.downcase

    # Encontrar a palavra-chave mais próxima no texto do usuário
    match = @fuzzy.find(entrada_downcase)

    if match
      problema = @keywords_map[match]
      procedimentos = @base[problema]["procedimentos"]
      return formatar_resposta(procedimentos)
    else
      return "Desculpe, não encontrei uma solução para esse problema."
    end
  end

  private

  def formatar_resposta(procedimentos)
    # Formata a lista de procedimentos para texto com quebras de linha
    procedimentos.map.with_index(1) { |p, i| "#{i}. #{p}" }.join("\n")
  end
end
