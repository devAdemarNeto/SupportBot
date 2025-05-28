# SupportBot

SupportBot é um assistente inteligente para técnicos de helpdesk que ajuda a identificar problemas e oferece soluções baseadas em uma base de conhecimento. Construído com Ruby on Rails, utiliza processamento de texto simples com busca fuzzy para encontrar as melhores soluções e pode ser facilmente expandido para integrar canais como WhatsApp.

## Funcionalidades

- Interface web simples para o técnico descrever o problema
- Busca inteligente na base de conhecimento com correspondência aproximada (fuzzy matching)
- Exibição clara dos procedimentos recomendados para resolução
- Arquitetura preparada para integração futura com WhatsApp via Twilio
- Base de conhecimento em YAML, fácil de editar e expandir

## Tecnologias utilizadas

- Ruby 3.x
- Ruby on Rails 8.x
- Gem `fuzzy_match` para busca aproximada
- YAML para armazenamento da base de conhecimento
- Bootstrap (opcional para estilo)

## Como usar

### 1. Clonar o repositório

```bash
git clone https://github.com/seu-usuario/SupportBot.git
cd SupportBot
```

### 2. Instalar dependências

```bash
bundle install
```

### 3. Rodar o servidor

```bash
rails server
```

### 4. Acessar a aplicação

Abra seu navegador em `http://localhost:3000`

### 5. Consultar soluções

Digite um problema na caixa de texto e clique em **Consultar Solução** para receber as orientações.

## Estrutura da base de conhecimento

O arquivo da base de conhecimento está em:
```
lib/bot_knowledge/base.yml
```

### Formato exemplo:

```yaml
monitor_auxiliar_nao_gera_imagem:
  palavras_chave:
    - monitor não funciona
    - problema com monitor
    - monitor sem imagem
  procedimentos:
    - Se o monitor estiver com adaptador VGA/USB-C ou cabo USB-C/DVI, desconectar o USB-C do notebook e colocar novamente.
    - Se o monitor estiver com cabo HDMI, alterar a taxa de atualização da tela para 60 hertz.
    - Se os passos acima não funcionarem, tentar outro cabo.
```

Você pode adicionar novos problemas seguindo esse padrão.

## Como contribuir

Contribuições são bem-vindas! Para adicionar novos problemas, abra uma issue ou envie um pull request atualizando o arquivo `base.yml`.

## Próximos passos

- Integração com WhatsApp via Twilio para receber perguntas diretamente no app
- Implementar autenticação para técnicos
- Interface mais robusta com histórico de consultas
- API para integração com outras ferramentas de suporte

## Licença

Projeto open source, use e modifique à vontade.
