# Storm Mountain API  - PT-BR

> Esta é uma API construida com Ruby on Rails e PostgreSQL, onde é possivel criar usuários, atividades e agendar eventos.

## Construído com:

- Ruby 3
- Ruby on Rails 6
- PostgreSQL
- Shoulda Matchers
- Rspec
- Faker
- FactoryBot

## Live version

Uma versão desse projeto esta disponível no Heroku [através desse link](https://storm-mountain.herokuapp.com)

Um exemplo de aplicação que faz uso dessa API está disponível [aqui](https://github.com/gscarv13/ss-front-end/tree/feature/mvpv1.0)

## Documentação

A documentação completa em inglês dessa API esta disponível [aqui](https://documenter.getpostman.com/view/17340539/U16euTRF)

## Para Começar

Para rodar esse projeto local siga as instruções abaixo.

### Prerequisitos

- Ruby on Rails v 6.x. Para maiores informações em como instalar Ruby on Rails, siga esse [link](https://guides.rubyonrails.org/getting_started.html)

- PostgreSQL. Para maiores informações em como instalar PostgreSQL em ambiente linux, siga esse [this tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04)

### Setup e instalação

- Clone esse repositório
- Abra o terminal e entre no diretório clonado
- Entre `bundle install` Para instalar todas as dependencias do Rails
- Em seguida `yarn` para instalar todas as dependencias do Javascript
- Execute `bin/rails db:create` Para criar o banco de dados
- Execute `bin/rails db:migrate` para migrar o banco de dados

### Uso

- Execute `bin/rails server` para iniciar o servidor
- Use o endereço que aparece no terminal para fazer as requisições, por exemplo:
```terminal
 Listening on http://127.0.0.1:3000
```
- Os endpoints, e seus respectivos parâmetros e instruçẽso de uso estão disponiveis na [documentação](https://documenter.getpostman.com/view/17340539/U16euTRF)

### Tests

Para rodar os testes, execute o seguinte comando,
```terminal
  $ bundle exec rspec
```

## Authors

👤 **Gustavo Carvalho**

- GitHub: [@gscarv13](https://github.com/gscarv13)

👤 **Christiane Mary Mayeda**

- GitHub: [@ChristianeMaryMayeda](https://github.com/ChristianeMaryMayeda)

👤 **Douglas Dias Alves**

- GitHub: [@DougPeD](https://github.com/DougPeD)

👤 **Wagner Jesus**

- GitHub: [@Wagner53426](https://github.com/Wagner53426)

👤 **Regivaldo Silva**

- GitHub: [@RegivaldoSilva](https://github.com/RegivaldoSilva)

## 📝 License

This project is [MIT](LICENSE) licensed.
