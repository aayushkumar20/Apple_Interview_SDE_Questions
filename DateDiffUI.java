import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateDiffUI {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(DateDiffUI::createAndShowGUI);
    }

    private static void createAndShowGUI() {
        JFrame frame = new JFrame("Date Difference Calculator");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(new FlowLayout());

        JTextField dateField = new JTextField(20);
        JButton calculateButton = new JButton("Calculate");
        JLabel resultLabel = new JLabel("Result:");

        calculateButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String inputDate = dateField.getText();
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                try {
                    Date d1 = sdf.parse(inputDate);
                    Date d2 = new Date();
                    long diff = d2.getTime() - d1.getTime();

                    long diffSeconds = diff / 1000 % 60;
                    long diffMinutes = diff / (60 * 1000) % 60;
                    long diffHours = diff / (60 * 60 * 1000) % 24;
                    long diffDays = diff / (24 * 60 * 60 * 1000);
                    long diffMonths = diffDays / 30;
                    long diffYears = diffDays / 365;

                    String resultText = "Difference in years: " + diffYears + "<br>"
                            + "Difference in months: " + diffMonths + "<br>"
                            + "Difference in days: " + diffDays + "<br>"
                            + "Difference in hours: " + diffHours + "<br>"
                            + "Difference in minutes: " + diffMinutes + "<br>"
                            + "Difference in seconds: " + diffSeconds;
                    resultLabel.setText("<html>" + resultText + "</html>");
                } catch (ParseException ex) {
                    resultLabel.setText("Invalid date format");
                }
            }
        });

        frame.add(new JLabel("Enter date in format dd/mm/yyyy hh:mm:ss"));
        frame.add(dateField);
        frame.add(calculateButton);
        frame.add(resultLabel);

        frame.pack();
        frame.setVisible(true);
    }
}
