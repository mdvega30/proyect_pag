package Negocio;

import java.util.Random;

public class GeneraToken {

    private String token;

    public String generarToken() {

        Random rnd = new Random();

        int numeroAleatorio = (int) (rnd.nextInt() * 1000000 + 10);
        token = String.valueOf(numeroAleatorio);

        return token;
    }

}
