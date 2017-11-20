<!doctype html>
<html lang="en">
  <head>
    <title>Todo</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script type="text/javascript" src="https://unpkg.com/vue@2.3.4"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue-resource@1.3.4"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body>
    <div class="container" id="root">
        <div class="row">
            <div class="col-6 offset-3">
                <br><br>
                <div class="card">
                  <div class="card-body">
                      <div class="input-group">
                          <span class="input-group-btn">
                            <button class="btn btn-success" type="button" v-on:click="addTodo"><span class="fa fa-plus"></span></button>
                          </span>
                          <input type="text" v-model="newTodo" class="form-control" placeholder="Add/Search your todo">
                          <span class="input-group-btn">
                            <button class="btn btn-primary" type="button"><span class="fa fa-search"></span></button>
                          </span>
                        </div>
                        <hr>
                        <ul class="list-group">
                          <li class="list-group-item" v-for="todo in todos">
                              @{ todo.title }
                              <div class="btn-group float-right" role="group" aria-label="Basic example">
                                  <button type="button" class="btn btn-success btn-sm"><span class="fa fa-check"></span></button>
                                  <button type="button" class="btn btn-danger btn-sm" v-on:click="deleteTodo(todo)"><span class="fa fa-trash"></span></button>
                                </div>
                          </li>
                        </ul>
                  </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    <script type="text/javascript">
      var Vue = new Vue({
        el: '#root',
        delimiters: ['@{', '}'],
        data: {
          newTodo: '',
          todos: []
        },
        mounted () {
          this.$http.get('todo').then(response => {
            this.todos = response.body.data;
          });
        },
        methods: {
          addTodo(){
            this.$http.post('todo', {title: this.newTodo}).then(response => {
              console.log(response.body);
              this.todos.push({id: response.body.todo_id, title: this.newTodo});
              this.newTodo = '';
            });
          };
        }
      });
    </script>
  </body>
</html>
