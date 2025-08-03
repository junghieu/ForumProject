package Model;

public class Post {
    private int id;
    private String title;
    private String content;
    private String username;

    public Post() {
        // Constructor mặc định
    }

    public Post(String title, String content, String username) {
        this.title = title;
        this.content = content;
        this.username = username;
    }

    public Post(int id, String title, String content, String username) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.username = username;
    }

    // Getter & Setter

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
