
package controlador;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UtilidadFechas {

    private static final String FORMATO_FECHA = "yyyy-MM-dd";

    public static Date convertirFecha(String fecha) {
        try {
            SimpleDateFormat formato = new SimpleDateFormat(FORMATO_FECHA);
            return formato.parse(fecha);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String formatearFecha(Date fecha) {
        SimpleDateFormat formato = new SimpleDateFormat(FORMATO_FECHA);
        return formato.format(fecha);
    }
}
