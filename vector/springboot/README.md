See https://github.com/halilural/spring-ai-book-suggestion-plugin/blob/master/book-recommender-api/src/main/java/com/uralhalil/bookrecommenderapi/controller/BookController.java
Example
```
import org.springframework.ai.embedding.EmbeddingModel;
import org.springframework.jdbc.core.simple.JdbcClient;

@RestController
@RequestMapping("/api/books")
@RequiredArgsConstructor
public class BookController {

  private final EmbeddingModel embeddingModel;
  private final JdbcClient jdbcClient;

  @GetMapping("/search")
  public BookResponse searchBooks(@RequestParam("prompt") String prompt) {
    float[] embedding = embeddingModel.embed(prompt);

    List<Book> books =
                jdbcClient.sql("SELECT id, title, author, rating, price, description " +
                                "FROM book " +
                                "ORDER BY description_vector <=> :prompt_vector::vector LIMIT 3")
                        .param("prompt_vector", embedding)
                        .query(Book.class)
                        .list();

      // Step 4: Return results as a response
      return new BookResponse(books);
  }
}
```