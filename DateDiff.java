// WAP to calculate the difference in between years, months, days, hours, minutes and seconds.
// Ask user to input date in format 
// dd/mm/yyyy hh:mm:ss and calculate the difference in between current date (current system date and time) and user entered date.

import java.util.*;
import java.text.*;
import java.time.*;

class DateDiff{
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter date in format dd/mm/yyyy hh:mm:ss");
        String date = sc.nextLine();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        try{
            Date d1 = sdf.parse(date);
            Date d2 = new Date();
            long diff = d2.getTime() - d1.getTime();
            long diffSeconds = diff / 1000 % 60;
            long diffMinutes = diff / (60 * 1000) % 60;
            long diffHours = diff / (60 * 60 * 1000) % 24;
            long diffDays = diff / (24 * 60 * 60 * 1000);
            long diffMonths = diffDays / 30;
            long diffYears = diffDays / 365;
            System.out.println("Difference in years: " + diffYears);
            System.out.println("Difference in months: " + diffMonths);
            System.out.println("Difference in days: " + diffDays);
            System.out.println("Difference in hours: " + diffHours);
            System.out.println("Difference in minutes: " + diffMinutes);
            System.out.println("Difference in seconds: " + diffSeconds);
        }
        catch(ParseException e){
            System.out.println("Invalid date format");
        }
    }
}