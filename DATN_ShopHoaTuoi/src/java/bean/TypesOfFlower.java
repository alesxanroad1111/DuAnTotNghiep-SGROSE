/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.Collection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TypesOfFlowers")
public class TypesOfFlower {
    @Id
    private String id;
    private String name;
    private String image;
    
    @OneToMany(mappedBy = "typeid", fetch = FetchType.EAGER)
    private Collection<Flower> flowers;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Collection<Flower> getFlowers() {
        return flowers;
    }

    public void setFlowers(Collection<Flower> flowers) {
        this.flowers = flowers;
    }
    
    
    
}
