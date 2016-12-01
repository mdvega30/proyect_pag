/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import org.apache.commons.fileupload.FileItemStream;

/**
 *
 * @author David
 */
public class FileUpload {

    public static boolean processFile(String path, FileItemStream item, String carpeta) {
        try {
            File f = new File(path + File.separator + "images" + File.separator + carpeta);//crea la carpeta images
           
            if (!f.exists()) {
                f.mkdir();
            }
            

                File saveFile = new File(f.getAbsolutePath() + File.separator + item.getName());//obtierne toda la ruta del archivo y carpeta

                FileOutputStream fos = new FileOutputStream(saveFile);
                InputStream is = item.openStream();
                int x = 0;
                byte[] b = new byte[1024];
                while ((x = is.read(b)) != -1) {

                    fos.write(b, 0, x);
                }
                fos.flush();
                fos.close();
                return true;
   
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public static boolean DeleteFile(String path, String item, String carpeta) {
        try {
            File f = new File(path + File.separator + "images" + File.separator + carpeta);
            File deleFile = new File(f.getAbsolutePath() + File.separator + item);
            if (deleFile.delete()) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
