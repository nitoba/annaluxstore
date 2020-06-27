# AnnaluxStore

Aplicativo de ecomerce para estudos desenvolvido com Flutter.

Loja:  @analuxstore

[Login * Instagram](https://www.instagram.com/analuxstore/)

---

## Construção

### Tipografia/Fontes

- Montserrat

### Paleta de cores

- Branco
- Preto
- Rosa

### Tecnologias a serem utilizadas

- Injeção de dependências
    - Modular
- Gerência de estado
    - Mobx
    - SetState
- Banco de dados
    - Firebase - Firestore
    - Firebase - Storage
- Dados locais
    - SharedPreferences
- Geração de arquivos CLI
    - Slidy

### CI/CD e Testes automatizados

- [x]  Github Actions
    - Pull request para as branches master e developer
- Fazer testes locais
- [x]  Seguir o Gitflow
    - Branch master para versão estável
    - Branch Developer para desenvolvimento
    - Criar branch para cada feature
        - Ex: "feature/login"
    - Fazer Merge e excluir a branch quando concluída

### Funcionalidades do App

- [x]  Login com Google
- [x]  Listar categoria de produtos
    - Roupas de bebê
    - Vestidos
    - Máscaras
- [x]  Dashboard com todos os produtos
- [x]  Selecionar um produto de uma categoria
- [x]  Tela de detalhes do produto
    - Foto
    - Preço
    - Descrição
    - Botão de adicionar ao carrinho
    - Botão de comprar
- [x]  Tela de carrinho de compras
    - [x]  Produto pode ser colocado num carrinho
    - [x]  Produto pode ser removido do carrinho
    - [x]  Ver preço final da compra no carrinho
    - [x]  Salvar dados do carrinho offline
- [x]  Aba de produtos favoritos
    - (Adicionar modelo reativo)
    - Usar o home controller para armazenar os favoritos
    - Adicionar um produto nos favoritos
    - Remover um produto dos favoritos
    - Salvar os favoritos localmente
- [ ]  Perfil do usuário
    - Mostrar a foto e nome
    - Adicionar endereço
    - Acompanhar pedido por status
    - Ver os pedidos feitos
    - Deslogar da conta
- [ ]  Tela de finalização de compras
    - Adicionar endereço de entrega
    - Calcular frete baseado no CEP do usuário
    - Finalizar compra do produto