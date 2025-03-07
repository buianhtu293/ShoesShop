/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import context.DBContext;
import java.sql.*;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import model.SubProducts;
import util.Support;

/**
 *
 * @author Nhat Anh
 */
public class DTOProducts extends DBContext {

    private final String SQL = """
                    select products.name, products.price, products.size, products.color, products.description,
                    products.img1, products.img2, rating.rating, discounts.discount_percent, discounts.active, 
                    product_status.name, brands.name, categories.name
                    from products
                    FULL OUTER JOIN product_status on products.status_id = product_status.id
                    FULL OUTER JOIN discounts on products.discount_id = discounts.id
                    FULL OUTER JOIN rating on products.id = rating.product_id
                    FULL OUTER JOIN categories on products.category_id = categories.id
                    FULL OUTER JOIN brands on products.brand_id = brands.id""";

    /**
     * Use to get all product have unique name in database
     * 
     * @return list product have unique name  
     */
    public List<SubProducts> getAll() {
        List<SubProducts> list = new LinkedList<>();
        try {
            PreparedStatement pre = connection.prepareStatement(
                    SQL, ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = pre.executeQuery();
            list = getProductUniqueName(rs);
        } catch (SQLException ex) {
            Logger.getLogger(DTOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    /**
     * Use to get product have unique name with keys are sizes and colors
     * description, categories, rating, status
     * 
     * @param rs is ResultSet take from input
     * @return list product have unique name
     */
    public List<SubProducts> getProductUniqueName(ResultSet rs) {
        Set<SubProducts> list = new HashSet<>();
        // Convert incomingDataList to a Map to aggregate sizes and colors
        // description, categories, rating, status
        Map<SubProducts, ProductAggregation> productMap = new HashMap<>();
        
        //Use to set product have same also have same sizes and colors
        // description, categories, rating, status
        try {
            while(rs.next()){
                SubProducts key = new SubProducts(
                        rs.getString(1), rs.getInt(2),
                        null, null, null,
                        rs.getString(6), rs.getString(7), null,
                        rs.getInt(9), rs.getInt(10),
                        null, rs.getString(12),null);
                ProductAggregation aggregation = 
                        productMap.computeIfAbsent(key, k -> new ProductAggregation());
                aggregation.sizes.add(rs.getInt(3));
                aggregation.colors.add(rs.getString(4));
                aggregation.description.add(rs.getString(5));
                aggregation.categories.add(rs.getString(13));
                aggregation.rating.add(rs.getInt(8));
                aggregation.status.add(rs.getString(11));
            }
            
            //Convert map to set
            list = productMap.entrySet().stream()
                    .map((Map.Entry<SubProducts, ProductAggregation> entry) -> {
                        SubProducts key = entry.getKey();
                        ProductAggregation aggregation = entry.getValue();
                        int[] sizes = aggregation.sizes.stream().mapToInt(i -> i).toArray();
                        String[] colors = aggregation.colors.toArray(String[]::new);
                        String[] description = aggregation.description.toArray(String[]::new);
                        String[] categories = aggregation.categories.toArray(String[]::new);
                        int[] rating = aggregation.rating.stream().mapToInt(i -> i).toArray();
                        String[] status = aggregation.status.toArray(String[]::new);
                        return new SubProducts( key.getName(),
                                key.getPrice(), sizes, colors,
                                description,
                                key.getImg1(), key.getImg2(),
                                rating, key.getDiscount(),
                                key.getDiscount_status(),
                                status,
                                key.getBrand_name(),categories);
            })
                    .collect(Collectors.toSet());

        } catch (SQLException ex) {
            Logger.getLogger(DTOProducts.class.getName())
                    .log(Level.SEVERE, null, ex);
        }

        return new LinkedList<>(list);
    }

    /**
     * Use to get new product order by date 
     * 
     * @param status     is status of product
     * @param sizeOfList is size of list product you want return
     * @return list new product order by date with given size
     */
    public List<SubProducts> getProductLatest(String status, int sizeOfList) {
        List<SubProducts> list = new LinkedList<>();
        StringBuilder query = new StringBuilder(SQL);
        query.append(" where product_status.name like ? order by products.created_at desc");
        try {
            PreparedStatement pre = connection.prepareStatement(
                    query.toString(), ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setString(1,status);
            ResultSet rs = pre.executeQuery();
            list = getProductUniqueName(rs);
        } catch (SQLException ex) {
            Logger.getLogger(DTOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list.subList(0, list.size()>sizeOfList?sizeOfList:list.size());
    }
    
    /**
     * Use to get all product greater than given rating
     * 
     * @param rating     is number rate(1-5) take from input
     * @param sizeOfList is size of list product you want return
     * @return list product have rating greater than given rating
     */
    public List<SubProducts> getProductByRating(int rating, int sizeOfList) {
        List<SubProducts> list = new LinkedList<>();
        StringBuilder query = new StringBuilder(SQL);
        query.append(" where rating.rating >= ? and product_status.name not like 'off'");
        try {
            PreparedStatement pre = connection.prepareStatement(
                    query.toString(), ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1,rating);
            ResultSet rs = pre.executeQuery();
            list = getProductUniqueName(rs);
        } catch (SQLException ex) {
            Logger.getLogger(DTOProducts.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
        return list.subList(0, list.size()>sizeOfList?sizeOfList:list.size());
    }
    
    /**
     * Use to search product have same given name
     * 
     * @param name is name or text take from input
     * @return list product have same name with given name
     */
    public List<SubProducts> searchName(String name) {
        List<SubProducts> list = new LinkedList<>();
        StringBuilder query = new StringBuilder(SQL);
        query.append(" where products.name like ?");
        try {
            PreparedStatement pre = connection.prepareStatement(
                    query.toString(), ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setString(1,"%"+name+"%");
            ResultSet rs = pre.executeQuery();
            list = getProductUniqueName(rs);
        } catch (SQLException ex) {
            Logger.getLogger(DTOProducts.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    
    public List<SubProducts> filter() {
        List<SubProducts> list = new LinkedList<>();
        StringBuilder query = new StringBuilder(SQL);
        return list;
    } 
    
    /**
     * Use to get product have same brand
     * 
     * @param brand      is brand name take from input
     * @param sizeOfList is size of list product you want return 
     * @return list product have same brand with given brand
     */
    public List<SubProducts> getRalateProduct(String brand, 
            int sizeOfList) {
        List<SubProducts> list = new LinkedList<>();
        StringBuilder query = new StringBuilder(SQL);
        query.append(" where brands.name like ? ");
        try {
            PreparedStatement pre = connection.prepareStatement(
                    query.toString(), ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
//            pre.setString(1,Support.printArray(category));
            pre.setString(1,"%"+brand+"%");
            ResultSet rs = pre.executeQuery();
            list = getProductUniqueName(rs);
        } catch (SQLException ex) {
            Logger.getLogger(DTOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list.subList(0, list.size()>sizeOfList?sizeOfList:list.size());
    }

    public static void main(String[] args) {
        DTOProducts call = new DTOProducts();
//        List<SubProducts> ls = call.getProductLatest("Hot", 12);
//        List<SubProducts> ls = call.getAll();
        String[] m = {"men","women"};
//        List<SubProducts> ls = call.getRalateProduct("nike",20);
//       ls.forEach(a -> System.out.println(a.toString()));
        System.out.println(Math.random()*10);
//        for (int i = 0; i < 10; i++) {
//            int randomInt = (int) (Math.random() * 11);
//            System.out.println("Random Integer (0-10): " + randomInt);
//        }
//        for(String k : m){
//            System.out.println(k);
        }
//        String[] m = {"a"};
//        System.out.println(m.toString());
//        String k = "123456";
//        System.out.println(Support.printArray(m));
    }



class ProductAggregation {

    Set<Integer> sizes = new HashSet<>();
    Set<String> colors = new HashSet<>();
    Set<String> description = new HashSet<>(); 
    List<Integer> rating = new LinkedList<>();
    Set<String> categories = new HashSet<>();
    Set<String> status = new HashSet<>();
}
