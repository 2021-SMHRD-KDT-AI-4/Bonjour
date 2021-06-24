package com.model;

public class carinfoDTO2 {
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
   private String color;
   private String car_type;
   private String gear;
   private String fuel;
   
         
   public carinfoDTO2(String car_num, String brand, String model, String d_model, String grade, String year,
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
   public carinfoDTO2(String brand, String model, String d_model, String grade, String year,
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
   public carinfoDTO2(String brand, String model, String d_model, String grade, String year,
	         String carprice, String fe, String cc, String maxoutput, String maxtorque, String drivesystem,
	         String people, String wheel, String tire,String car_type, String gear, String fuel) {

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
	      
	      this.car_type = car_type;
	      this.gear = gear;
	      this.fuel = fuel;
	      
	   }
   

   public carinfoDTO2( String brand, String model, String d_model, String grade, String year) {
   
      this.brand = brand;
      this.model = model;
      this.d_model = d_model;
      this.grade = grade;
      this.year = year;
      
   }

   
   public String getColor() {
	return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getCar_type() {
		return car_type;
	}
	public void setCar_type(String car_type) {
		this.car_type = car_type;
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
}