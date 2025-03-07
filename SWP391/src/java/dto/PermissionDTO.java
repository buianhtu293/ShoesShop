/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import lombok.Data;

@Data
public class PermissionDTO {
    private int roleId;
    private String url;
    private String roleName;
    private boolean access;
}
