# AnnaluxStore

Aplicativo de ecomerce para estudos desenvolvido com Flutter.

Loja:  [@analuxstore](https://www.instagram.com/analuxstore/)

---

## Construção

### Tipografia/Fontes

- Montserrat

### Paleta de cores

- Branco
- Preto
- Rosa

---

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

---

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


---

### Funcionalidades do App

- [x]  Login com Google
- [x]  Listar categoria de produtos
    - Roupas de bebê
    - Vestidos
    - Máscaras
- [x]  Dashboard com todos os produtos
- [x]  Selecionar um produto de uma categoria
- [x]  Tela de detalhes do produto
    - [x] Foto
    - [x] Preço
    - [x] Descrição
    - [x] Botão de adicionar ao carrinho
    - [x] Botão de comprar
- [x]  Tela de carrinho de compras
    - [x]  Produto pode ser colocado num carrinho
    - [x]  Produto pode ser removido do carrinho
    - [x]  Ver preço final da compra no carrinho
    - [x]  Salvar dados do carrinho offline
    - [x]  Mostrar taxa de entrega por bairro
    - [x]  Aplicar cupons de desconto
- [x]  Aba de produtos favoritos
    - [x] (Adicionar modelo reativo)
    - [x] Usar o home controller para armazenar os favoritos
    - [x] Adicionar um produto nos favoritos
    - [x] Remover um produto dos favoritos
    - [x] Salvar os favoritos localmente
- [x]  Perfil do usuário
    - [x] Mostrar a foto e nome
    - [x] Adicionar endereço
    - [x] Acompanhar pedido por status
    - [x] Ver os pedidos feitos
    - [x] Deslogar da conta
- [x]  Tela de finalização de compras
    - [x] Finalizar compra do produto
    - [x] Animação de pedido concluído

---

### Outras funcionalidades

- [x]  SplashScreen personalizada
- [x]  OnboardScreen
- [x]  Ícone do aplicativo
