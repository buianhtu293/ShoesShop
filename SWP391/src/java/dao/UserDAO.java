/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.*;

/**
 *
 * @author tungl
 */
public class UserDAO extends DBContext {

    UserAddressDAO uaDAO;

    public UserDAO() {
        uaDAO = new UserAddressDAO();
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT id, email, password, role_id, status_id, first_name, last_name, telephone, created_at, modified_at, gender FROM users";
        try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setRole_id(resultSet.getInt("role_id"));
                user.setStatus_id(resultSet.getInt("status_id"));
                user.setFirst_name(resultSet.getString("first_name"));
                user.setLast_name(resultSet.getString("last_name"));
                user.setTelephone(resultSet.getString("telephone"));
                user.setCreated_at(resultSet.getDate("created_at"));
                user.setGender(resultSet.getBoolean("gender"));
                user.setModified_at(resultSet.getDate("modified_at"));

                user.setRole(getRoleById(user.getRole_id()));
                user.setUsersStatus(getUserStatusById(user.getStatus_id()));
                user.setUserAddress(uaDAO.getUserAddressById(user.getId()));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ, có thể throw hoặc log
        }
        return users;
    }

    public List<User> filterCustomersByStatusAndSearch(Integer status, String searchTerm) {
//        List<User> users = new ArrayList<>();
//        String sql = "SELECT id, email, password, role_id, status_id, first_name, last_name, telephone, created_at, modified_at, gender FROM users WHERE (status_id = ? OR ? IS NULL) AND ((first_name LIKE ? OR last_name LIKE ? OR email LIKE ? OR telephone LIKE ?) OR ? IS NULL)";
//        try (PreparedStatement statement = connection.prepareStatement(sql)) {
//            if (status != null) {
//                statement.setInt(1, status);
//                statement.setInt(6, status);
//            } else {
//                statement.setNull(1, java.sql.Types.INTEGER);
//                statement.setNull(6, java.sql.Types.INTEGER);
//            }
//            if (searchTerm != null) {
//                statement.setString(3, "%" + searchTerm + "%");
//                statement.setString(4, "%" + searchTerm + "%");
//                statement.setString(5, "%" + searchTerm + "%");
//                statement.setString(6, "%" + searchTerm + "%");
        List<User> users = new ArrayList<>();
        String sql = "SELECT id, email, password, role_id, status_id, first_name, last_name, telephone, created_at, modified_at, gender "
                + "FROM users "
                + "WHERE role_id = 1 AND "
                + "(status_id = ? OR ? IS NULL) AND "
                + "("
                + "    (first_name LIKE ? OR last_name LIKE ? OR email LIKE ? OR telephone LIKE ?) OR "
                + "    (first_name LIKE ? AND last_name LIKE ?) OR "
                + "    ? IS NULL"
                + ")";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            // Setting parameters for status
            if (status != null) {
                statement.setInt(1, status);
                statement.setInt(2, status);
            } else {
                statement.setNull(1, java.sql.Types.INTEGER);
                statement.setNull(2, java.sql.Types.INTEGER);
            }

            // Setting parameters for search term
            if (searchTerm != null && !searchTerm.isEmpty()) {
                String searchPattern = "%" + searchTerm + "%";
                statement.setString(3, searchPattern);
                statement.setString(4, searchPattern);
                statement.setString(5, searchPattern);
                statement.setString(6, searchPattern);

                // Handle full name search by splitting searchTerm
                String[] nameParts = searchTerm.split("\\s+");
                if (nameParts.length == 2) {
                    String firstNamePart = "%" + nameParts[0] + "%";
                    String lastNamePart = "%" + nameParts[1] + "%";
                    statement.setString(7, firstNamePart);
                    statement.setString(8, lastNamePart);

                } else {
                    statement.setString(7, searchPattern);
                    statement.setString(8, searchPattern);
                }

                statement.setString(9, searchPattern);
            } else {
                statement.setNull(3, java.sql.Types.VARCHAR);
                statement.setNull(4, java.sql.Types.VARCHAR);
                statement.setNull(5, java.sql.Types.VARCHAR);
                statement.setNull(6, java.sql.Types.VARCHAR);
                statement.setNull(7, java.sql.Types.VARCHAR);
                statement.setNull(8, java.sql.Types.VARCHAR);
                statement.setNull(9, java.sql.Types.VARCHAR);
            }

            // Execute query and process results
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    User user = new User();
                    user.setId(resultSet.getInt("id"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPassword(resultSet.getString("password"));
                    user.setRole_id(resultSet.getInt("role_id"));
                    user.setStatus_id(resultSet.getInt("status_id"));
                    user.setFirst_name(resultSet.getString("first_name"));
                    user.setLast_name(resultSet.getString("last_name"));
                    user.setTelephone(resultSet.getString("telephone"));
                    user.setGender(resultSet.getBoolean("gender"));
                    user.setCreated_at(resultSet.getDate("created_at"));
                    user.setModified_at(resultSet.getDate("modified_at"));

                    user.setRole(getRoleById(user.getRole_id()));
                    
                    user.setUsersStatus(getUserStatusById(user.getStatus_id()));
                    
                    user.setUserAddress(uaDAO.getUserAddressById(user.getId()));
                    users.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ, có thể throw hoặc log
        }
        return users;
    }

    public User getUserById(int userId) {
        User user = null;
        String sql = "SELECT id, email, password, role_id, status_id, first_name, last_name, telephone, created_at, modified_at, gender FROM users WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    user = new User();
                    user.setId(resultSet.getInt("id"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPassword(resultSet.getString("password"));
                    user.setRole_id(resultSet.getInt("role_id"));
                    user.setStatus_id(resultSet.getInt("status_id"));
                    user.setFirst_name(resultSet.getString("first_name"));
                    user.setLast_name(resultSet.getString("last_name"));
                    user.setTelephone(resultSet.getString("telephone"));
                    user.setGender(resultSet.getBoolean("gender"));
                    user.setCreated_at(resultSet.getDate("created_at"));
                    user.setModified_at(resultSet.getDate("modified_at"));

                    user.setRole(getRoleById(user.getRole_id()));
                    user.setUsersStatus(getUserStatusById(user.getStatus_id()));
                    user.setUserAddress(uaDAO.getUserAddressById(user.getId()));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ, có thể throw hoặc log
        }
        return user;
    }

    public void addUser(User user) {
        String sql = "INSERT INTO users (email, password, role_id, status_id, first_name, last_name, telephone, created_at, modified_at, gender) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setInt(3, user.getRole_id());
            statement.setInt(4, user.getStatus_id());
            statement.setString(5, user.getFirst_name());
            statement.setString(6, user.getLast_name());
            statement.setString(7, user.getTelephone());
            statement.setDate(8, new java.sql.Date(user.getCreated_at().getTime())); // Assuming createdAt is a java.util.Date
            statement.setDate(9, new java.sql.Date(user.getModified_at().getTime())); // Assuming modifiedAt is a java.util.Date
            statement.setBoolean(10, user.isGender());

            // Execute the insert statement
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new user was inserted successfully!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception
        }
    }

    public void updateUser(User user) {
        String sql = "UPDATE users SET email = ?, password = ?, role_id = ?, status_id = ?, first_name = ?, last_name = ?, "
                + "telephone = ?, created_at = ?, modified_at = ?, gender = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setInt(3, user.getRole_id());
            statement.setInt(4, user.getStatus_id());
            statement.setString(5, user.getFirst_name());
            statement.setString(6, user.getLast_name());
            statement.setString(7, user.getTelephone());
            statement.setDate(8, new java.sql.Date(user.getCreated_at().getTime())); // Assuming createdAt is a java.util.Date
            statement.setDate(9, new java.sql.Date(user.getModified_at().getTime())); // Assuming modifiedAt is a java.util.Date
            statement.setBoolean(10, user.isGender());
            statement.setInt(11, user.getId());

            // Execute the update statement
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("User with ID " + user.getId() + " was updated successfully!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception
        }
    }

    public List<Roles> getAllRoles() {
        List<Roles> roles = new ArrayList<>();
        String sql = "SELECT id, name FROM roles";
        try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Roles role = new Roles();
                role.setId(resultSet.getInt("id"));
                role.setName(resultSet.getString("name"));
                roles.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roles;
    }

    public Roles getRoleById(int roleId) {
        Roles role = null;
        String sql = "SELECT id, name FROM roles WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, roleId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    role = new Roles();
                    role.setId(resultSet.getInt("id"));
                    role.setName(resultSet.getString("name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception
        }
        return role;
    }

    public List<UserStatus> getAllStatus() {
        List<UserStatus> statuses = new ArrayList<>();
        String sql = "SELECT id, name FROM user_status";
        try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                UserStatus status = new UserStatus();
                status.setId(resultSet.getInt("id"));
                status.setName(resultSet.getString("name"));
                statuses.add(status);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception
        }
        return statuses;
    }

    // Method to get a user status by ID
    public UserStatus getUserStatusById(int userStatusId) {
        UserStatus userStatus = null;
        String sql = "SELECT id, name FROM user_status WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userStatusId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    userStatus = new UserStatus();
                    userStatus.setId(resultSet.getInt("id"));
                    userStatus.setName(resultSet.getString("name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception
        }
        return userStatus;
    }

    public static void main(String[] args) {
//        // Sample data
        User newUser = new User();
        newUser.setEmail("john.doe@example.com");
        newUser.setPassword("password123");
        newUser.setRole_id(1); // Assuming role_id 1 represents a certain role
        newUser.setStatus_id(1); // Assuming status_id 1 represents a certain status
        newUser.setFirst_name("John");
        newUser.setLast_name("Doe");
        newUser.setTelephone("1234567890");
        newUser.setCreated_at(new Date()); // Assuming current date/time as created_at
        newUser.setModified_at(new Date()); // Assuming current date/time as modified_at
        newUser.setGender(true); // Assuming true represents male

        // Test addUser method
        UserDAO uDAO = new UserDAO(); // Assuming you have a UserDAO class that contains the addUser method
        uDAO.addUser(newUser);
    }

}
