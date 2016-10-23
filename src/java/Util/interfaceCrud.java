/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;


import java.util.ArrayList;

/**
 *
 * @author David
 */
public interface interfaceCrud {
    
   
    public abstract boolean update();
    public abstract ArrayList read();
    public abstract boolean delete();
    
}
