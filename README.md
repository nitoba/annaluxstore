# AnnaluxStore

Aplicativo de ecomerce para estudos desenvolvido com Flutter.

Loja: [@analuxstore](https://www.instagram.com/analuxstore/)

---

# Construção

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
    - Foto
    - Preço
    - Descrição
    - Botão de adicionar ao carrinho
    - Botão de comprar
- [ ]  Perfil do usuário
    - Mostrar a foto e nome
    - Acompanhar pedido por status
    - Ver os pedidos feitos
    - Deslogar da conta
- [ ]  Produto pode ser colocado num carrinho
- [ ]  Produto pode ser removido do carrinho
- [ ]  Ver preço final da compra no carrinho
- [ ]  Finalizar compra do produto
