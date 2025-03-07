/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Roles;

/**
 *
 * @author Admin
 */
public class RoleDAO extends DBContext {

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
}
