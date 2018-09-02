# RubyGraphQL
This is my initial studies in GraphQL with Ruby on Rails. Based on the course of Alex Dexa, from udemy, this is the code of a simple blog with users, posts and comments.

## Applied Concepts
 - Graphql
   - Mutations
   - Queries
 - Authentication
 - Authorization
 - Access Control
   - Visibility
   - ~~Accessibility~~
   - ~~Authorisation~~
 
 ## Install
You can install a local instance of the RubyGraphQL api by running the following code:

 ```sh
git clone git@github.com:gabrielvcampos/RubyGraphQL.git
cd RubyGraphQL
bundle install
rake db:create db:migrate db:seed
rails s
```

 ## Testing
 ### Queries
 
 #### Login
 GraphiQL querie
 ```graphql
 {
	login(email: "gabriel@gmail.com", password: "1234") 
 }
 ```
 Response
 ```json
 {
  "data": {
    "login": "8a02a7e7a9532ee7598fd62330bc6a6cfb716ddc"
  }
}
```
 ####  Get user by id 
 GraphiQL querie
  ```graphql
 {
  user(id: "4"){
    firstName
    lastName
    fullName
    email
    street
    number
    city
    postcode
    country
    role
    posts {
      body
      comments {
        body
        userId
        postId
      }
    }
    comments{
      body
      postId
      userId
    }
    errors{
      errors
      field_name
    }
  } 
}
  ```
 Response
 ```json
 {
  "data": {
    "user": {
      "firstName": "Ramiro",
      "lastName": "Randy",
      "fullName": "Ramiro Randy",
      "email": "Ramiro_992@gmail.com",
      "street": "6016 Eddy Shore",
      "number": 314,
      "city": "Ziemannstad",
      "postcode": "02303",
      "country": "Guinea",
      "role": "member",
      "posts": [
        {
          "body": "Por outro lado, o início do programa de formação de atitudes acarreta um processo de reformulação das nossas metas financeiras e administrativas. É fundamental ressaltar que a análise dos diversos resultados exige precisão e definição das nossas metas financeiras e administrativas. Nunca é demais insistir que a constante divulgação das informações prejudica a percepção da importância das atitudes e das atribuições da diretoria.",
          "comments": [
            {
              "body": "A prática mostra que a constante divulgação das informações assume importantes posições na definição das opções básicas para o sucesso do programa.",
              "userId": 1,
              "postId": 11
            },
            {
              "body": "A experiência mostra que a análise dos diversos resultados exige precisão e definição das opções básicas para o sucesso do programa. Caros colegas o novo modelo estrutural aqui preconizado contribui para a correta determinação das condições apropriadas para os negócios.",
              "userId": 22,
              "postId": 11
            }
          ]
        },
      ],
      "comments": [
        {
          "body": "O incentivo ao avanço tecnológico, assim como a execução deste projeto exige precisão e definição do nosso sistema de formação de quadros.",
          "postId": 26,
          "userId": 4
        },
        {
          "body": "É fundamental ressaltar que o início do programa de formação de atitudes contribui para a correta determinação do nosso sistema de formação de quadros. Assim mesmo, a atual estrutura de organização auxilia a preparação e a estruturação das formas de ação.",
          "postId": 39,
          "userId": 4
        },
        {
          "body": "É fundamental ressaltar que a complexidade dos estudos efetuados cumpre um papel essencial na formulação das nossas metas financeiras e administrativas.",
          "postId": 129,
          "userId": 4
        }
      ],
      "errors": []
    }
  }
}
 ```
 
 ####  Get all users 
 GraphiQL querie
  ```graphql
 {
  users{
    firstName
    lastName
    fullName
    email
    street
    number
    city
    postcode
    country
    role
    posts {
      body
      comments {
        body
        userId
        postId
      }
    }
    comments{
      body
      postId
      userId
    }
    errors{
      errors
      field_name
    }
  } 
}
  ```
 
 ### Mutations
 ####  Create a Post 
 GraphiQL querie
 ```graphql
 mutation createPost{
  updateComment(body: "teste criação de post", user_id:5)
  {
    body
    id
    userId
    errors{
      field_name
    }
  }
}
 ```
 
 #### Create a Comment 
 ```graphql
 mutation crateComment{
  updateComment(body: "teste de criação de comentário", post_id:26, user_id:5)
  {
    body
    id
    userId
    postId
    errors{
      field_name
    }
  }
}
 ```

#### Update a Comment
GraphiQL querie
```graphql
 mutation updateComment{
  updateComment(body: "teste de alteração de comentário", post_id:26, user_id:5, id: 10)
  {
    body
    id
    userId
    postId
    errors{
      field_name
    }
  }
}
 ```
 ### Access Control
  - Update comments are only visible for users that contain the role "member"
  
