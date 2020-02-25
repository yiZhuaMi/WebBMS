package operator;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.net.Socket;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;




public class Record {
	
	static File file = new File("/Users/mach/Documents/饭碗/workspace/JavaWeb/WebBMS/operating record.txt");
	
	

    
    public void writeToTxt(String[] temp){
		
		 String str = null;
		
		 Date date=new Date();
		 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time=format.format(date);
		
		 System.out.println("(record)temp[0]"+temp[0]+"temp[1]"+temp[1]);
		 

		 
		 switch(temp[0])
         {
	        case"add":    str = "    time:"+time+"    Operation:"+temp[0]+"       Bookname:"+temp[1]+"    Author:"+temp[2]+"    Price:"+temp[3]+"    Category:"+temp[4]+"    Remark:"+temp[5];break;
	      	
	        case"delete": str = "    time:"+time+"    Operation:"+temp[0]+"    Value:"+temp[1]+"    Col:"+temp[2]+"    Bookid:"+temp[3];break;
	      	
	    	case"modify": str = "    time:"+time+"    Operation:"+temp[0]+"    NewValue:"+temp[1]+"    Col:"+temp[2]+"    Bookid:"+temp[3];break;
	      	
	        case"search": str = "    time:"+time+"    Operation:"+temp[0]+"    keyword:"+temp[1];break;
	      	
	        case"refresh":str = "    time:"+time+"    Operation:"+temp[0]+"    keyword:"+temp[1];break;
         }
        
         
         FileWriter fw = null;
         BufferedWriter writer = null;
        
       
       
         try 
         {
        	 fw = new FileWriter(file,true);
             writer = new BufferedWriter(fw);
             System.out.println("记录操作。。。");
             writer.write(str);
             writer.newLine();
                
             writer.flush();
			 writer.close();
			 fw.close();
		 } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		 }
        
          
    
    }
    
}

