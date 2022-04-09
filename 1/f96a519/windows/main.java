import java.sql.Timestamp;
import java.util.*;
import java.io.*;

class main {
    public static void main(String[] args) throws Exception {
        List<String> list = new ArrayList<>();
        ProcessBuilder builder4 = new ProcessBuilder(
                "cmd.exe", "/c", "hostname");
        builder4.redirectErrorStream(true);
        Process p4 = builder4.start();
        BufferedReader r4 = new BufferedReader(new InputStreamReader(p4.getInputStream()));
        String line4 = r4.readLine();
        for (int i = 0; i <= 10; i++) {
            try {
                ProcessBuilder builder = new ProcessBuilder(
                        "cmd.exe", "/c", "wmic ComputerSystem get TotalPhysicalMemory");
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
                ProcessBuilder builder2 = new ProcessBuilder(
                        "cmd.exe", "/c", "wmic OS get FreePhysicalMemory");
                builder2.redirectErrorStream(true);
                Process pp = builder2.start();
                BufferedReader rr = new BufferedReader(new InputStreamReader(pp.getInputStream()));
                while (true) {
                    String line2 = rr.readLine();
                    if (line2 == null) {
                        break;
                    }
                    list.add(line2.trim());
                }
                ProcessBuilder builder3 = new ProcessBuilder(
                        "cmd.exe", "/c", "wmic cpu get loadpercentage");
                builder3.redirectErrorStream(true);
                Process p3 = builder3.start();
                BufferedReader r3 = new BufferedReader(new InputStreamReader(p3.getInputStream()));
                while (true) {
                    String line3 = r3.readLine();
                    if (line3 == null) {
                        break;
                    }
                    list.add(line3.trim());
                }
                list.removeAll(Collections.singleton(""));
                int a1 = (int) Math.pow(10, list.get(1).length() - list.get(3).length() - 1);
                String a2 = (String.valueOf(Long.parseLong(list.get(1)) - (Long.parseLong(list.get(3)) * a1)));
                String a3 = a2.substring(0, a2.length() - 3);
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                String qt = String.format("%-19d", timestamp.getTime()).replace(' ', '0');
                System.out.println("cpu&ram, " + "host=" + line4 + " cpu_usage_percent=" + list.get(5) + " RAM_usage_Mbytes=" + a3 + " " + qt);
                Thread.sleep(2000);
                list.clear();
            } catch (Exception E) {
                list.clear();
                i--;
            }
        }
    }
}