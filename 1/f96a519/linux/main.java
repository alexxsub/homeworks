import java.sql.Timestamp;
import java.util.*;
import java.io.*;

class main {
    public static void main(String[] args) throws IOException {
        ProcessBuilder builder4 = new ProcessBuilder(
                "bash", "-c", "hostname");
        builder4.redirectErrorStream(true);
        Process p4 = builder4.start();
        BufferedReader r4 = new BufferedReader(new InputStreamReader(p4.getInputStream()));
        String line4 = r4.readLine();
        for (int i = 0; i <= 10; i++) {
            List<String> list = new ArrayList<>();
            try {
                ProcessBuilder builder = new ProcessBuilder(
                        "bash", "-c", "free -k");
                builder.redirectErrorStream(true);
                Process p = builder.start();
                BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
                while (true) {
                    String line = r.readLine();
                    if (line == null) {
                        break;
                    }
                    list.add(line.trim());
                }
                List<String> list2 = new ArrayList<String>(Arrays.asList(list.get(1).split(" ")));
                list2.removeAll(Collections.singleton(""));
                String a1 = list2.get(2);
                list.clear();
                ProcessBuilder builder2 = new ProcessBuilder(
                        "bash", "-c", "uptime");
                builder2.redirectErrorStream(true);
                Process p2 = builder2.start();
                BufferedReader r2 = new BufferedReader(new InputStreamReader(p2.getInputStream()));
                while (true) {
                    String line2 = r2.readLine();
                    if (line2 == null) {
                        break;
                    }
                    list.add(line2.trim());
                }
                list = (Arrays.asList(list.get(0).split(" ")));
                String a2 = list.get(11).substring(0, list.get(11).length() - 4);
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                String qt = String.format("%-19d", timestamp.getTime()).replace(' ', '0');
                System.out.println("cpu&ram, " + "host=" + line4 + " cpu_usage_percent=" + a2 + " RAM_usage_Mbytes=" + a1 + " " + qt);
                Thread.sleep(2000);
            } catch (Exception E) {
                list.clear();
                i--;
            }
        }
    }
}
