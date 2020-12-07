/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Table;

/**
 *
 * @author truyen
 */

//@NamedNativeQueries({
//    @NamedNativeQuery(
//    name = "callReportFlowers",
//    query = "CALL sp_ReportsFowers(:ReportFlowers)",
//    resultClass = ReportFlower.class
////            ?????? cc gi da.
//    )
//})

@Entity
@Table(name = "ReportFlowers")
public class ReportFlower implements Serializable {
    @Id
    private  String group;
    private Double sum, avg, min, max;
    private Integer count;

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public Double getSum() {
        return sum;
    }

    public void setSum(Double sum) {
        this.sum = sum;
    }

    public Double getAvg() {
        return avg;
    }

    public void setAvg(Double avg) {
        this.avg = avg;
    }

    public Double getMin() {
        return min;
    }

    public void setMin(Double min) {
        this.min = min;
    }

    public Double getMax() {
        return max;
    }

    public void setMax(Double max) {
        this.max = max;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
    
    @Override
    public String toString(){
        return "["+this.getGroup()+ this.getSum()+this.getCount()+this.getMin()+this.getMax()+this.getAvg()+"]";
    }
    
}
