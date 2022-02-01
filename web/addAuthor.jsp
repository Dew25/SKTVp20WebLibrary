<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="w-100">
    <h2 class="w-100 my-5 d-flex justify-content-center">Добавить нового автора</h2>        
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-6">
                <form action="createAuthor" method="POST">
                    <div class="form-group">
                        <div class="form-floating mb-3 ">
                          <input type="text" class="form-control col-4" id="firstName" name="firstName" placeholder="Название книги">
                          <label for="firstName">Имя</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-floating mb-3 ">
                          <input type="text" class="form-control col-4" id="lastName" name="lastName" placeholder="Название книги">
                          <label for="lastName">Фамилия</label>
                        </div>
                    </div>
                    <input type="submit" class="btn btn-primary" name="Добавить"><br>
                </form>
            </div>
        </div>
    </div>
</div>
    