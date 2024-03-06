package controlador;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

public class JspCalendar implements Serializable {
    private Calendar calendar = null;
    private static final long serialVersionUID = 1L;

    public JspCalendar() {
        calendar = Calendar.getInstance();
        Date fechaEjemplo = new Date();
        calendar.setTime(fechaEjemplo);
    }

    public void setTime(Date date) {
        calendar.setTime(date);
    }

    public int getYear() {
        return calendar.get(Calendar.YEAR);
    }

    public int getMonthInt() {
        return 1 + calendar.get(Calendar.MONTH);
    }

    public int getDayOfMonth() {
        return calendar.get(Calendar.DAY_OF_MONTH);
    }

    public String getZodiacSign(int month, int day) {
        String[] zodiacSigns = new String[]{
                "Capricornio", "Acuario", "Piscis", "Aries",
                "Tauro", "Géminis", "Cáncer", "Leo",
                "Virgo", "Libra", "Escorpio", "Sagitario", "Capricornio"
        };

        int[] startDates = new int[]{20, 19, 21, 20, 21, 21, 22, 23, 23, 23, 22, 22};

        int zodiacIndex = month;
        if (day < startDates[month - 1]) {
            zodiacIndex = (zodiacIndex - 1 + 12) % 12;
        }

        return zodiacSigns[zodiacIndex];
    }
}
