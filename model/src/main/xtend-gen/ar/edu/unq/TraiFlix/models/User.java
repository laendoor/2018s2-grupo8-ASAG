package ar.edu.unq.TraiFlix.models;

import ar.edu.unq.TraiFlix.models.Content;
import java.util.Date;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class User {
  private Integer id;
  
  private String nick;
  
  private String name;
  
  private Date created;
  
  private Date dateOfBirth;
  
  private List<User> friends;
  
  private List<Content> seen;
  
  private List<Content> favorite;
  
  public User() {
    this.friends = CollectionLiterals.<User>newArrayList();
    this.seen = CollectionLiterals.<Content>newArrayList();
    this.favorite = CollectionLiterals.<Content>newArrayList();
  }
  
  @Pure
  public Integer getId() {
    return this.id;
  }
  
  public void setId(final Integer id) {
    this.id = id;
  }
  
  @Pure
  public String getNick() {
    return this.nick;
  }
  
  public void setNick(final String nick) {
    this.nick = nick;
  }
  
  @Pure
  public String getName() {
    return this.name;
  }
  
  public void setName(final String name) {
    this.name = name;
  }
  
  @Pure
  public Date getCreated() {
    return this.created;
  }
  
  public void setCreated(final Date created) {
    this.created = created;
  }
  
  @Pure
  public Date getDateOfBirth() {
    return this.dateOfBirth;
  }
  
  public void setDateOfBirth(final Date dateOfBirth) {
    this.dateOfBirth = dateOfBirth;
  }
  
  @Pure
  public List<User> getFriends() {
    return this.friends;
  }
  
  public void setFriends(final List<User> friends) {
    this.friends = friends;
  }
  
  @Pure
  public List<Content> getSeen() {
    return this.seen;
  }
  
  public void setSeen(final List<Content> seen) {
    this.seen = seen;
  }
  
  @Pure
  public List<Content> getFavorite() {
    return this.favorite;
  }
  
  public void setFavorite(final List<Content> favorite) {
    this.favorite = favorite;
  }
}
