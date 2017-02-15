package lekerdez;

import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class AdatbazisLekerdezBean implements AdatbazisKapcsolat {
  private boolean loginOK;
  private String jogkor;
  private int hibakod;
  public ArrayList<Dolgozo> dolgozok = new ArrayList<>();
  public ArrayList<Reszleg> reszlegek = new ArrayList<>();
  public ArrayList<AtlagFiz> atlagfiz = new ArrayList<>();
  
  private File xmlF�jl=new File("C:/Users/212546118/Downloads/BH01/BH01SCRUM2/HF20170216-JSP/web/META-INF/userek.xml");
  //private File xmlF�jl=new File("./META-INF/userek.xml");
  private Connection kapcsolat;
  
  public AdatbazisLekerdezBean() {
    loginOK=false;
    jogkor="";
    hibakod=1;
    getReszlegek();
  }
  
  public void setLoginOK(boolean loginOK) {
    this.loginOK=loginOK;
  }

  private void setJogkor(String jogkor) {
    this.jogkor = jogkor;
  }  
  
  public boolean isLoginOK() {
    return loginOK;
  }

  public void setHibakod(int hibakod) {
    this.hibakod = hibakod;
  }

  public String getJogkor() {
    return jogkor;
  } 

  public int getHibakod() {
    return hibakod;
  }
  
  public String getDolgozoNeve(String id){
    int i=0;
    int id1=Integer.parseInt(id);
    String s;
    while (!(dolgozok.get(i).getEmpID()==id1)) {      
      i++;
    }
    if (i<dolgozok.size()) {
      s=dolgozok.get(i).getNev();
    }else{
      s="nincs ilyen dolgoz�";
    }
    return s;
  }
  
  public String getDolgozoReszlege(String id){
    int i=0;
    int id1=Integer.parseInt(id);
    String s;
    while (!(dolgozok.get(i).getEmpID()==id1)) {      
      i++;
    }
    if (i<dolgozok.size()) {
      s=dolgozok.get(i).getReszlegNev();
    }else{
      s="nincs ilyen dolgoz�";
    }
    return s;
  }

  public String getDolgozoMunkakore(String id){
    int i=0;
    int id1=Integer.parseInt(id);
    String s;
    while (!(dolgozok.get(i).getEmpID()==id1)) {      
      i++;
    }
    if (i<dolgozok.size()) {
      s=dolgozok.get(i).getMunkakor();
    }else{
      s="nincs ilyen dolgoz�";
    }
    return s;
  }
  
  public String getMaxFizetes(String userId){
    
    String munkakorAzonosito = getDolgozoMunkakore(userId);

    int fizetes=0;
    try {
      kapcsolatNyit();
      PreparedStatement ps=kapcsolat.prepareStatement(
        "SELECT MAX_SALARY AS MAXFIZET�S \n" +
        "FROM JOBS\n" +
        "WHERE JOB_TITLE=?");
      ps.setString(1, ""+munkakorAzonosito);
      ResultSet rs=ps.executeQuery();        
      rs.next();
      fizetes=rs.getInt("MAXFIZET�S");
    }
    catch (SQLException e) {
      System.out.println(e.getMessage());
    }
    kapcsolatZar();
    return ""+fizetes;
  }

  
  public String getMinFizetes(String userId){
    String munkakorAzonosito = getDolgozoMunkakore(userId);    
    int fizetes=0;
    try {
      kapcsolatNyit();
      PreparedStatement ps=kapcsolat.prepareStatement(
        "SELECT MIN_SALARY AS MINFIZET�S \n" +
        "FROM JOBS\n" +
        "WHERE JOB_TITLE=?");
      ps.setString(1, ""+munkakorAzonosito);
      ResultSet rs=ps.executeQuery();        
      rs.next();
      fizetes=rs.getInt("MINFIZET�S");
    }
    catch (SQLException e) {
      System.out.println(e.getMessage());
    }
    kapcsolatZar();    
    return ""+fizetes;
  }
  
  private void kapcsolatNyit() {
    try {
      Class.forName(DRIVER);
      kapcsolat = DriverManager.getConnection(URL, USER, PASSWORD);
    }
    catch (ClassNotFoundException e) {
      System.out.println("Hiba! Hi�nyzik a JDBC driver.");
    }
    catch (SQLException e) {
      System.out.println("Hiba! Nem siker�lt megnyitni a kapcsolatot az adatb�zis-szerverrel.");
    }
  }

  private void kapcsolatZar() {
    try {
      kapcsolat.close();
    }
    catch (SQLException e) {
      System.out.println("Hiba! Nem siker�lt lez�rni a kapcsolatot az adatb�zis-szerverrel.");
    }
  } 

  
  private String lekerdez(String sql, String reszlegId) {
    String t�bl�zat="";
    try {
      kapcsolatNyit();
      Statement s = kapcsolat.createStatement();
      PreparedStatement ps = kapcsolat.prepareStatement(sql);
      
      if (!(reszlegId==null) && !(reszlegId.equals("mindenki"))) {
        ps.setString(1, reszlegId);
      }
      //ResultSet rs = s.executeQuery(sql);
      ResultSet rs = ps.executeQuery();
      
      t�bl�zat=t�bl�zatotK�sz�t(rs); //html szoveget epit a lekerdezes eredmenyebol
    }
    catch(Exception e) {
      t�bl�zat="Hiba! "+e.getMessage();
    }
    kapcsolatZar();
    return t�bl�zat;
  }
  
  private String t�bl�zatotK�sz�t(ResultSet rs) {
    String s="";
    try {
      s+="<table border=\"1\"><tr>";
      ResultSetMetaData metaadat=rs.getMetaData();
      for(int i=1; i<metaadat.getColumnCount(); i++)
        s+="<td>"+metaadat.getColumnName(i+1)+"</td>";
      s+="</td>";
      
      while (rs.next()) {
        Dolgozo dolgozo = new Dolgozo(rs.getInt("empId"),
                rs.getString("Dolgoz�"),
                0,
                rs.getString("R�szleg"),                          /*rs.getInt("depId") == 0 ? "R�szleg n�lk�li" : rs.getString("depName"),*/
                rs.getString("Munkak�r"),
                rs.getInt("Fizet�s"),
                rs.getDate("Bel�p�si_d�tum"));
        dolgozok.add(dolgozo);

        s += "<tr>";
        for (int i = 1; i < metaadat.getColumnCount(); i++) {
          if (i==4) {
            s+="<td><a href=\"fizetesModositas.jsp?id="+rs.getObject(1)+"\">"+rs.getObject(i+1)+"</a></td>";
          }else{
            s+="<td>"+rs.getObject(i+1)+"</td>";
          }
        }
        s+="</tr>";
      } 
      s+="</table>";
    }
    catch(Exception e) {
      s="Hiba! "+e.getMessage();
    }    
    return s;
  }
  
  
  
  public String getDolgozokAdatai(String reszlegId) {
    if ( reszlegId==null || reszlegId.equals("mindenki")) {
      return lekerdez(
              "SELECT E.EMPLOYEE_ID AS empId, "
              + "E.FIRST_NAME || ' ' || E.LAST_NAME AS Dolgoz�,\n"
              + "D.DEPARTMENT_NAME AS R�szleg,\n"
              + "JOBS.JOB_TITLE as Munkak�r,\n"
              + "E.SALARY as Fizet�s,\n"
              + "E.HIRE_DATE as Bel�p�si_d�tum\n"
              + "FROM JOBS, EMPLOYEES E\n"
              + "LEFT JOIN DEPARTMENTS D\n"
              + "ON D.DEPARTMENT_ID = E.DEPARTMENT_ID\n"
              + "WHERE JOBS.JOB_ID=E.JOB_ID\n"
              + "ORDER BY 2", reszlegId);

    } else {
      return lekerdez(
              "SELECT E.EMPLOYEE_ID AS empId, "
              + "E.FIRST_NAME || ' ' || E.LAST_NAME AS Dolgoz�,\n"
              + "D.DEPARTMENT_NAME AS R�szleg,\n"
              + "JOBS.JOB_TITLE as Munkak�r,\n"
              + "E.SALARY as Fizet�s,\n"
              + "E.HIRE_DATE as Bel�p�si_d�tum\n"
              + "FROM JOBS, EMPLOYEES E\n"
              + "LEFT JOIN DEPARTMENTS D\n"
              + "ON D.DEPARTMENT_ID = E.DEPARTMENT_ID\n"
              + "WHERE JOBS.JOB_ID=E.JOB_ID \n"
              + "AND E.DEPARTMENT_ID=? \n"        
              + "ORDER BY 2", reszlegId);
    }
  }

    private void getReszlegek() {
    try {
      kapcsolatNyit();
      Statement s = kapcsolat.createStatement();
      ResultSet rs = s.executeQuery(
              "SELECT DEPARTMENT_ID, DEPARTMENT_NAME\n" +
              "FROM DEPARTMENTS\n" +
              "WHERE DEPARTMENT_ID IN \n" +
              "(SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES)\n" +
              "ORDER BY 2");      
      while (rs.next()){
        Reszleg reszleg = new Reszleg(rs.getString("DEPARTMENT_NAME"), rs.getInt("DEPARTMENT_ID"));
        reszlegek.add(reszleg);
      }
    }
    catch (SQLException e) {
      e.printStackTrace();
    }
    kapcsolatZar();
  }
    
//    private void getAtlagFiz() {
//    try {
//      kapcsolatNyit();
//      Statement s = kapcsolat.createStatement();
//      ResultSet rs = s.executeQuery(
//              "SELECT D.DEPARTMENT_NAME AS R�szleg, ROUND(SUM(SALARY)/COUNT(E.EMPLOYEE_ID)) AS �tlagFiz\n" +
//              "FROM DEPARTMENTS D, EMPLOYEES E\n" +
//              "WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID\n" +
//              "GROUP BY D.DEPARTMENT_NAME\n" +
//              "ORDER BY �tlagFiz DESC");      
//      while (rs.next()){
//        AtlagFiz atlagfiz = new AtlagFiz(rs.getString("R�szleg"), rs.getInt("�tlagFiz"));
//        this.atlagfiz.add(atlagfiz);
//      }
//    }
//    catch (SQLException e) {
//      e.printStackTrace();
//    }
//    kapcsolatZar();
//  }
    
    public String getAtlagFizu() throws SQLException {
    kapcsolatNyit();
    Statement s = kapcsolat.createStatement();
    ResultSet rs=s.executeQuery(
              "SELECT D.DEPARTMENT_NAME AS R�szleg, ROUND(SUM(SALARY)/COUNT(E.EMPLOYEE_ID)) AS �tlagFiz\n" +
              "FROM DEPARTMENTS D, EMPLOYEES E\n" +
              "WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID\n" +
              "GROUP BY D.DEPARTMENT_NAME\n" +
              "ORDER BY �tlagFiz DESC");
    
    StringBuilder sb=new StringBuilder();
    ArrayList<String> lines=new ArrayList<>();
    
    //build
    sb.append("dataPoints: [");
    while(rs.next()) {
      int sum=rs.getInt("�tlagFiz");
      String deptName=rs.getString("R�szleg");
      lines.add("{y: "+sum+", label: \""+deptName+"\"}");
    }
    sb.append(String.join(",", lines));
    sb.append("]");
    kapcsolatZar();
    return sb.toString();
  }
    
/*
  public String getDolgozokNeveReszlege() {
    return lekerdez(
      "SELECT FIRST_NAME || ' ' || LAST_NAME AS N�V, DEPARTMENT_NAME AS R�SZLEG "+
      "FROM DEPARTMENTS D, EMPLOYEES E "+
      "WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID "+
      "ORDER BY N�V");
  }
 
  public String getDolgozokNeveReszlegeFizetese() {
    return lekerdez(
      "SELECT FIRST_NAME || ' ' || LAST_NAME AS N�V, DEPARTMENT_NAME AS R�SZLEG, SALARY AS FIZET�S "+
      "FROM DEPARTMENTS D, EMPLOYEES E "+
      "WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID "+
      "ORDER BY N�V");
  }

  public String getReszlegek() {
    return lekerdez(
      "SELECT DEPARTMENT_NAME AS R�SZLEG "+
      "FROM DEPARTMENTS "+
      "ORDER BY 1");
  }

  public String getAtlagFizetes() {
    return lekerdez("SELECT AVG(SALARY) AS �tlagfizet�s FROM EMPLOYEES");
  }
  
  public String getReszlegekLetszamok() {
    return lekerdez(
      "SELECT DEPARTMENT_NAME AS R�SZLEG, COUNT(EMPLOYEE_ID) AS L�TSZ�M "+
      "FROM DEPARTMENTS D, EMPLOYEES E "+
      "WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID "+
      "GROUP BY DEPARTMENT_NAME");
  }
*/
  
  public int jelsz�Ellen�rz�s(String name, String password) { //@hedda
    String loginName="", loginPassword="", loginJogkor="";
    //int hibakod=-1; //"inicializalas
    if (name.isEmpty())
      return 1; //felhasznalonev hianyzik
    if (password.isEmpty())
      return 2; //jelszo hianyzik
    Document d=null;
		try {
			d=DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(xmlF�jl); //eloforditas?
		}
    catch(ParserConfigurationException | SAXException | IOException e) {
      hibakod=3; //xml fajl parszolas nem sikerult
			e.printStackTrace();
		}
	  NodeList userLista=d.getDocumentElement().getElementsByTagName("User");
    int i=0;
    boolean vanIlyenLogin=false;
    while (i<userLista.getLength() && !vanIlyenLogin) {
      /*String*/ loginName=((Element)userLista.item(i)).getElementsByTagName("Name").item(0).getFirstChild().getNodeValue();
      vanIlyenLogin=loginName.equals(name);
      if (vanIlyenLogin) {
        /*String*/ loginPassword=((Element)userLista.item(i)).getElementsByTagName("Password").item(0).getFirstChild().getNodeValue();
        /*String*/ loginJogkor=((Element)userLista.item(i)).getElementsByTagName("Role").item(0).getFirstChild().getNodeValue();
                   setJogkor(loginJogkor);
        //user=new User(loginName, loginPassword, loginJogkor);        
      } 
      else   
        i++;
    }    
    if (vanIlyenLogin) {
      //hibakod=(user.getJelszo().equals(JelszoGeneralo.kodolas(password))? 0 : 5 ); //0-megegyezik a jelszo; 5-nem egyezik meg a jelszo. 
      hibakod=(loginPassword.equals(kodolas(password))? 0 : 5 );  
    }
    else
      hibakod=4; //nincs ilyen felhasznalo
    return hibakod;
  }
  
  public static String kodolas(String clearText) {
		String titkositottJelszo = null;
		try {
			titkositottJelszo = titkosito(clearText);
		}catch(NoSuchAlgorithmException ex) {
			System.err.println("Nincs ilyen algoritmus");
		}
		return titkositottJelszo;
	}
  
  private static String titkosito(String jelszo) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA1");
		byte[] sb = md.digest(jelszo.getBytes()); 
		StringBuffer hexText = new StringBuffer();
		for (int i=0; i<sb.length; i++) {
			String hex = Integer.toHexString(0xFF & sb[i]);
			if(hex.length() == 1)
				hexText.append('0');
			hexText.append(hex);
		}		
		return hexText.toString();
  }
  
  public String ellen�rz�s(int hibakod) {
    String msg="";
    switch (hibakod) { 
      case 1: msg="Hi�nyzik a felhaszn�l�n�v!"; break;
      case 2: msg="Hi�nyzik a jelsz�!"; break;
      case 3: msg="Az userek.xml hi�nyzik vagy nem olvashat�!"; break;
      case 4: msg="Nincs ilyen felhaszn�l�!"; break;
      case 5: msg="Hibas jelsz�!"; break;
      default: msg="Ismeretlen hiba!"; break;
    }
    return msg;
  } 
  
//    public static void main(String[] args) throws SQLException {
//        System.out.println(new AdatbazisLekerdezBean().getAtlagFizu());
//    }
  
}
