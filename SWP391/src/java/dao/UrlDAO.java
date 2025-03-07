package dao;

import context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Url;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UrlDAO extends DBContext {

    private static final String SELECT_URLS_WITH_PAGINATION = "SELECT * FROM Url WHERE url LIKE ? ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
    private static final String COUNT_URLS = "SELECT COUNT(*) FROM Url WHERE url LIKE ?;";

    public List<Url> selectUrls(int page, int pageSize, String searchQuery) {
        List<Url> urls = new ArrayList<>();
        int start = (page - 1) * pageSize;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_URLS_WITH_PAGINATION);
            preparedStatement.setString(1, "%" + searchQuery + "%");
            preparedStatement.setInt(2, start);
            preparedStatement.setInt(3, pageSize);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Url url = new Url();
                url.setId(rs.getInt("id"));
                url.setUrl(rs.getString("url"));
                url.setAccess(rs.getBoolean("access"));
                urls.add(url);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return urls;
    }

    public int countUrls(String searchQuery) {
        int count = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(COUNT_URLS);
            preparedStatement.setString(1, "%" + searchQuery + "%");
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return count;
    }

    public List<Url> getAllUrls() {
        List<Url> urls = new ArrayList<>();
        String query = "SELECT id, url, access FROM Url";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Url url = new Url();
                url.setId(resultSet.getInt("id"));
                url.setUrl(resultSet.getString("url"));
                url.setAccess(resultSet.getBoolean("access"));
                urls.add(url);
            }
        } catch (SQLException ex) {
            printSQLException(ex);
        }
        return urls;
    }

    public Url getUrlById(int id) {
        Url url = null;
        String query = "SELECT id, url, access FROM Url WHERE id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                url = new Url();
                url.setId(resultSet.getInt("id"));
                url.setUrl(resultSet.getString("url"));
                url.setAccess(resultSet.getBoolean("access"));
            }
        } catch (SQLException ex) {
            printSQLException(ex);
        }
        return url;
    }

    public boolean createUrl(Url url) {
        String query = "INSERT INTO Url (url, access) VALUES (?, ?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, url.getUrl());
            preparedStatement.setBoolean(2, url.isAccess());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            printSQLException(ex);
            return false;
        }
    }

    public boolean updateUrl(Url url) {
        String query = "UPDATE Url SET url = ?, access = ? WHERE id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, url.getUrl());
            statement.setBoolean(2, url.isAccess());
            statement.setInt(3, url.getId());
            return statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            printSQLException(ex);
            return false;
        }
    }

    public boolean deleteUrl(int id) {
        String query = "DELETE FROM Url WHERE id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            printSQLException(ex);
            return false;
        }
    }

    private void printSQLException(SQLException ex) {
        ex.printStackTrace(System.err);
    }
    Url getUrlByUrl(String urlPath) {
        Url url = null;
        String query = "SELECT id, url, access FROM Url WHERE url = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, urlPath);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                url = new Url();
                url.setId(resultSet.getInt("id"));
                url.setUrl(resultSet.getString("url"));
                url.setAccess(resultSet.getBoolean("access"));
            }
        } catch (SQLException ex) {
            printSQLException(ex);
        }
        return url;
    }
    public static void main(String[] args) {
        UrlDAO udao = new UrlDAO();
        System.out.println(udao.getUrlByUrl("/url"));
    }

}
