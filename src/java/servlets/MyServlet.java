/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entity.Author;
import entity.Book;
import entity.History;
import entity.Reader;
import facade.AuthorFacade;
import facade.BookFacade;
import facade.HistoryFacade;
import facade.ReaderFacade;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "MyServlet", urlPatterns = {
    "/index",
    "/addBook",
    "/createBook",
    "/addAuthor",
    "/createAuthor",
    "/takeOnBook",
    "/createHistory",
        
})
public class MyServlet extends HttpServlet {
    @EJB
    private AuthorFacade authorFacade;
    @EJB
    private ReaderFacade readerFacade;
    @EJB
    private BookFacade bookFacade;
    @EJB
    private HistoryFacade historyFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String path = request.getServletPath();
        switch (path) {
            case "/index":
                List<Book> listBooks = bookFacade.findAll();
                request.setAttribute("books", listBooks);
                request.getRequestDispatcher("/listBooks.jsp").forward(request, response);
                break;
            case "/addBook":
                String info = "Добавление книги";
                request.setAttribute("infoText", info);
                List<Author> listAuthors = authorFacade.findAll();
                request.setAttribute("listAuthors", listAuthors);
                request.getRequestDispatcher("/addBook.jsp").forward(request, response);
                break;
            case "/createBook":
                String nameBook = request.getParameter("bookName");
                String[] authors = request.getParameterValues("authors");
                String quantity = request.getParameter("quantity");
                String publishedYear = request.getParameter("publishedYear");
                listAuthors = new ArrayList<>();
                for (int i = 0; i < authors.length; i++) {
                    listAuthors.add(authorFacade.find(Long.parseLong(authors[i])));
                }
                Book book = new Book();
                book.setBookName(nameBook);
                book.setAuthors(listAuthors);
                book.setQuantity(Integer.parseInt(quantity));
                book.setCount(book.getQuantity());
                book.setPublishedYear(Integer.parseInt(publishedYear));
                bookFacade.create(book);
                info = "Книга добавлена";
                request.setAttribute("infoText", info);
                request.getRequestDispatcher("/index.html").forward(request, response);
                break;
            case "/addAuthor":
                info = "Добавление автора";
                request.setAttribute("infoText", info);
                request.getRequestDispatcher("/addAuthor.jsp").forward(request, response);
                break;
            case "/createAuthor":
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                Author author = new Author();
                author.setFirstname(firstName);
                author.setLastname(lastName);
                authorFacade.create(author);
                info = "Автор добавлен";
                request.setAttribute("infoText", info);
                request.getRequestDispatcher("/addAuthor.jsp").forward(request, response);
                break;
            case "/takeOnBook":
                List<Book> books = bookFacade.findAll();
                List<Reader> readers = readerFacade.findAll();
                request.setAttribute("books", books);
                request.setAttribute("readers", readers);
                request.getRequestDispatcher("/takeOnBook.jsp").forward(request, response);
                break;
            case "/createHistory":
                String[] idBooks = request.getParameterValues("books");
                String idReader = request.getParameter("readerId");
                Reader reader = readerFacade.find(Long.parseLong(idReader));
                History history = null;
                for (int i = 0; i < idBooks.length; i++) {
                    Book takeBook = bookFacade.find(Long.parseLong(idBooks[i]));
                    history = new History();
                    history.setBook(takeBook);
                    history.setReader(reader);
                    history.setGivenDate(Calendar.getInstance().getTime());
                    historyFacade.create(history);
                }
                request.getRequestDispatcher("/takeOnBook").forward(request, response);
                break;
                
            
        }
//        Author author = new Author();
//        author.setFirstname("Петр");
//        author.setLastname("Петров");
//        Author author = authorFacade.find(2L);
//        String info = "Привет от MyServlet!";
//        request.setAttribute("infoText", info);
//        request.setAttribute("author", author);
//        Reader reader = readerFacade.find(1L);
//        request.setAttribute("reader", reader);
//        request.getRequestDispatcher("/page1.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
