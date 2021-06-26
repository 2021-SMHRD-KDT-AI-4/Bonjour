package com.model;

public class carinfoDTO {
   private String car_num;
   private String brand;
   private String model;
   private String d_model;
   private String grade;
   private String year;
   private String carprice;
   private String fe;
   private String cc;
   private String maxoutput;
   private String maxtorque;
   private String drivesystem;
   private String people;
   private String wheel;
   private String tire;
   private String url;
   private String oldprice;
   private String site;
         
   private String gear;
   private String fuel;
   
public carinfoDTO(String car_num, String brand, String model, String d_model, String grade, String year,
		String carprice, String fe, String cc, String maxoutput, String maxtorque, String drivesystem, String people,
		String wheel, String tire, String gear, String fuel, String url, String cartype) {
	super();
	this.car_num = car_num;
	this.brand = brand;
	this.model = model;
	this.d_model = d_model;
	this.grade = grade;
	this.year = year;
	this.carprice = carprice;
	this.fe = fe;
	this.cc = cc;
	this.maxoutput = maxoutput;
	this.maxtorque = maxtorque;
	this.drivesystem = drivesystem;
	this.people = people;
	this.wheel = wheel;
	this.tire = tire;
	this.gear = gear;
	this.fuel = fuel;
	this.url = url;
	this.cartype = cartype;
}




public carinfoDTO(String car_num, String brand, String model, String d_model, String grade, String year, String url) {
	super();
	this.car_num = car_num;
	this.brand = brand;
	this.model = model;
	this.d_model = d_model;
	this.grade = grade;
	this.year = year;
	this.url = url;
}




private String cartype;
   public carinfoDTO(String car_num, String brand, String model, String d_model, String grade, String year,
         String carprice, String fe, String cc, String maxoutput, String maxtorque, String drivesystem,
         String people, String wheel, String tire) {
      super();
      this.car_num = car_num;
      this.brand = brand;
      this.model = model;
      this.d_model = d_model;
      this.grade = grade;
      this.year = year;
      this.carprice = carprice;
      this.fe = fe;
      this.cc = cc;
      this.maxoutput = maxoutput;
      this.maxtorque = maxtorque;
      this.drivesystem = drivesystem;
      this.people = people;
      this.wheel = wheel;
      this.tire = tire;
   }
   public carinfoDTO(String brand, String model, String d_model, String grade, String year,
	         String carprice, String fe, String cc, String maxoutput, String maxtorque, String drivesystem,
	         String people, String wheel, String tire) {

	      this.brand = brand;
	      this.model = model;
	      this.d_model = d_model;
	      this.grade = grade;
	      this.year = year;
	      this.carprice = carprice;
	      this.fe = fe;
	      this.cc = cc;
	      this.maxoutput = maxoutput;
	      this.maxtorque = maxtorque;
	      this.drivesystem = drivesystem;
	      this.people = people;
	      this.wheel = wheel;
	      this.tire = tire;
	   }
   

   public carinfoDTO( String brand, String model, String d_model, String grade, String year) {
   
      this.brand = brand;
      this.model = model;
      this.d_model = d_model;
      this.grade = grade;
      this.year = year;
      
   }
   public carinfoDTO( String brand, String model, String d_model, String grade, String year,String url,String oldprice, String site) {
	   
	      this.brand = brand;
	      this.model = model;
	      this.d_model = d_model;
	      this.grade = grade;
	      this.year = year;
	      this.url = url;
	      this.oldprice = oldprice;
	      this.site = site;
	   }
   
   public String getCar_num() {
      return car_num;
   }
   public void setCar_num(String car_num) {
      this.car_num = car_num;
   }
   public String getBrand() {
      return brand;
   }
   public void setBrand(String brand) {
      this.brand = brand;
   }
   public String getModel() {
      return model;
   }
   public void setModel(String model) {
      this.model = model;
   }
   public String getD_model() {
      return d_model;
   }
   public void setD_model(String d_model) {
      this.d_model = d_model;
   }
   public String getGrade() {
      return grade;
   }
   public void setGrade(String grade) {
      this.grade = grade;
   }
   public String getYear() {
      return year;
   }
   public void setYear(String year) {
      this.year = year;
   }
   public String getCarprice() {
      return carprice;
   }
   public void setCarprice(String carprice) {
      this.carprice = carprice;
   }
   public String getFe() {
      return fe;
   }
   public void setFe(String fe) {
      this.fe = fe;
   }
   public String getCc() {
      return cc;
   }
   public void setCc(String cc) {
      this.cc = cc;
   }
   public String getMaxoutput() {
      return maxoutput;
   }
   public void setMaxoutput(String maxoutput) {
      this.maxoutput = maxoutput;
   }
   public String getMaxtorque() {
      return maxtorque;
   }
   public void setMaxtorque(String maxtorque) {
      this.maxtorque = maxtorque;
   }
   public String getDrivesystem() {
      return drivesystem;
   }
   public void setDrivesystem(String drivesystem) {
      this.drivesystem = drivesystem;
   }
   public String getPeople() {
      return people;
   }
   public void setPeople(String people) {
      this.people = people;
   }
   public String getWheel() {
      return wheel;
   }
   public void setWheel(String wheel) {
      this.wheel = wheel;
   }
   public String getTire() {
      return tire;
   }
   public void setTire(String tire) {
      this.tire = tire;
   }
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getOldprice() {
		return oldprice;
	}
	public void setOldprice(String oldprice) {
		this.oldprice = oldprice;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	
	
public String getGear() {
	return gear;
}
public void setGear(String gear) {
	this.gear = gear;
}
public String getFuel() {
	return fuel;
}
public void setFuel(String fuel) {
	this.fuel = fuel;
}
public String getCartype() {
	return cartype;
}
public void setCartype(String cartype) {
	this.cartype = cartype;
}


}