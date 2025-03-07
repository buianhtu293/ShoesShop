package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Permission;
import model.Url;

/**
 * PermissionDAO class containing CRUD methods
 */
public class PermissionDAO extends DBContext {

    private static final String SELECT_URLS_BY_ROLE = "SELECT \n"
            + "	u.[id],\n"
            + "	u.[url],\n"
            + "	u.[access]\n"
            + "	FROM [dbo].[Permission] p\n"
            + "	JOIN [dbo].[Url] U\n"
            + "	ON p.urlId = U.id\n"
            + "	where p.roleId = ?;";
    private static final String INSERT_PERMISSION = "INSERT INTO Permission (roleId, urlId, description) VALUES (?, ?, ?);";
    private static final String DELETE_PERMISSION = "DELETE FROM Permission WHERE roleId = ? AND urlId = ?;";
    private static final String DELETE_PERMISSIONS_BY_ROLE = "DELETE FROM Permission WHERE roleId = ?;";

    // Method to get all permissions
    public List<Permission> getAll() throws SQLException {
        List<Permission> permissions = new ArrayList<>();
        String query = "SELECT roleId, urlId, description FROM Permission";

        try (PreparedStatement statement = connection.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Permission permission = new Permission();
                permission.setRoleId(resultSet.getInt("roleId"));
                permission.setUrlId(resultSet.getInt("urlId"));
                permission.setDescription(resultSet.getString("description"));
                permissions.add(permission);
            }
        } catch (SQLException ex) {
            throw new SQLException("Error fetching all permissions", ex);
        }

        return permissions;
    }

    // Method to get permission by roleId and urlId
    public Permission getById(int roleId, int urlId) throws SQLException {
        Permission permission = null;
        String query = "SELECT roleId, urlId, description FROM Permission WHERE roleId = ? AND urlId = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, roleId);
            statement.setInt(2, urlId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    permission = new Permission();
                    permission.setRoleId(resultSet.getInt("roleId"));
                    permission.setUrlId(resultSet.getInt("urlId"));
                    permission.setDescription(resultSet.getString("description"));
                }
            }
        } catch (SQLException ex) {
            throw new SQLException("Error fetching permission by ID", ex);
        }

        return permission;
    }

    // Method to create a new permission record
    public boolean create(Permission permission) throws SQLException {
        String query = "INSERT INTO Permission (roleId, urlId, description) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, permission.getRoleId());
            statement.setInt(2, permission.getUrlId());
            statement.setString(3, permission.getDescription());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException ex) {
            throw new SQLException("Error creating permission", ex);
        }
    }

    // Method to update an existing permission record
    public boolean update(Permission permission) throws SQLException {
        String query = "UPDATE Permission SET description = ? WHERE roleId = ? AND urlId = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, permission.getDescription());
            statement.setInt(2, permission.getRoleId());
            statement.setInt(3, permission.getUrlId());
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            throw new SQLException("Error updating permission", ex);
        }
    }

    // Method to delete a permission record by roleId and urlId
    public boolean delete(int roleId, int urlId) throws SQLException {
        String query = "DELETE FROM Permission WHERE roleId = ? AND urlId = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, roleId);
            statement.setInt(2, urlId);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException ex) {
            throw new SQLException("Error deleting permission", ex);
        }
    }

    public List<Url> selectUrlsByRole(int roleId) {
        List<Url> urls = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_URLS_BY_ROLE);
            preparedStatement.setInt(1, roleId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Url url = new Url();
                url.setId(rs.getInt("id"));
                url.setUrl(rs.getString("url"));
                url.setAccess(rs.getBoolean("access"));
                urls.add(url);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return urls;
    }

    public void insertPermission(int roleId, int urlId, String description) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PERMISSION);
            preparedStatement.setInt(1, roleId);
            preparedStatement.setInt(2, urlId);
            preparedStatement.setString(3, description);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletePermission(int roleId, int urlId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PERMISSION);
            preparedStatement.setInt(1, roleId);
            preparedStatement.setInt(2, urlId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletePermissionsByRole(int roleId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PERMISSIONS_BY_ROLE);
            preparedStatement.setInt(1, roleId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        PermissionDAO dao = new PermissionDAO();
        System.out.println(dao.selectUrlsByRole(6));
    }
}
