import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {

    pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }
    
    File file = new File("Log.txt");

    Calendar cal = Calendar.getInstance();
    String data="";
    
    pointcut dinero(): call(void moneyWithdrawal() );
    after(): dinero(){
    	mostrarResults("Retirar dinero");
    	
    }
    	
    pointcut transaccion(): call(void moneyMakeTransaction());
    after(): transaccion(){
    	mostrarResults("Realizar transaccion");
    }
    
    void mostrarResults(String t) {
    	data = "Tipo transaccion: "+ t + " | " + "Hora: "+ cal.getTime() +"\n" ;
    	System.out.println(data);
    		try {
				FileWriter fw = new FileWriter(file,true);
				fw.write(data);
				fw.close();
				
			} catch (IOException e) {
				System.out.println("Error");

			}
    		
    		
    	}
    
}