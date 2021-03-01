CREATE TABLE Specialite(
        id         Int  Auto_increment  NOT NULL ,
        specialite Varchar (50) NOT NULL
	,CONSTRAINT Specialite_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Medecins
#------------------------------------------------------------

CREATE TABLE Medecins(
        id            Int  Auto_increment  NOT NULL ,
        lastname      Varchar (50) NOT NULL ,
        name          Varchar (50) NOT NULL ,
        mail          Varchar (50) NOT NULL ,
        id_Specialite Int NOT NULL
	,CONSTRAINT Medecins_PK PRIMARY KEY (id)

	,CONSTRAINT Medecins_Specialite_FK FOREIGN KEY (id_Specialite) REFERENCES Specialite(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: patients
#------------------------------------------------------------

CREATE TABLE patients(
        id                Int  Auto_increment  NOT NULL ,
        lastname          Varchar (50) NOT NULL ,
        name              Varchar (50) NOT NULL ,
        date_de_naissance Date NOT NULL ,
        id_Medecins       Int NOT NULL
	,CONSTRAINT patients_PK PRIMARY KEY (id)

	,CONSTRAINT patients_Medecins_FK FOREIGN KEY (id_Medecins) REFERENCES Medecins(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Créneau horaire
#------------------------------------------------------------

CREATE TABLE Creneau_horaire(
        id              Int  Auto_increment  NOT NULL ,
        creneau_horaire Int NOT NULL
	,CONSTRAINT Creneau_horaire_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: RDV
#------------------------------------------------------------

CREATE TABLE RDV(
        id                 Int  Auto_increment  NOT NULL ,
        lastname           Varchar (50) NOT NULL ,
        name               Varchar (50) NOT NULL ,
        nom_du_medecin     Varchar (50) NOT NULL ,
        specialite         Varchar (50) NOT NULL ,
        date               Varchar (50) NOT NULL ,
        id_Creneau_horaire Int NOT NULL ,
        id_patients        Int NOT NULL ,
        id_Medecins        Int NOT NULL
	,CONSTRAINT RDV_PK PRIMARY KEY (id)

	,CONSTRAINT RDV_Creneau_horaire_FK FOREIGN KEY (id_Creneau_horaire) REFERENCES Creneau_horaire(id)
	,CONSTRAINT RDV_patients0_FK FOREIGN KEY (id_patients) REFERENCES patients(id)
	,CONSTRAINT RDV_Medecins1_FK FOREIGN KEY (id_Medecins) REFERENCES Medecins(id)
)ENGINE=InnoDB;
INSERT INTO `specialite` (`specialite`) VALUES ("Généraliste"), ("Neurologue"), ("Oncologue");
INSERT INTO `medecins` (`lastname`, `name`, `mail`, `id_Specialite`) VALUES ("Hugp", "Victor", "victor.hugo.gmail.com", 1), ("Poquelin", "Jean-Baptiste", "jean-baptiste.poquelin@gmail.com", 2), ("Verne", "Jule", "jule.verne@gmail.com", 3), ("Rimbourg", "André", "andre.rimbourg@gmail.com", 1), ("Piaf", "Edith", "edith.piaf@gmail.com", 2);
ALTER TABLE `creneau_horaire` MODIFY `creneau_horaire` VARCHAR (20);
INSERT INTO `creneau_horaire` (`creneau_horaire`) VALUES ("08:00 - 08:30"), ("08:30 - 09:00"), ("09-00 - 09:30"), ("09:30 - 10:00"), ("10:00 - 10:30"), ("10:30 - 11:00"), ("11:00 - 11:30"), ("11:30 - 12:00");
INSERT INTO `patients` (`lastname`, `name`, `date_de_naissance`, `id_Medecins`) VALUES ("Freret", "Julien", "1995-01-19", 1);
INSERT INTO `patients` (`lastname`, `name`, `date_de_naissance`, `id_Medecins`) VALUES ("Akame", "Kata", "1997-02-16", 2), ("Farengar", "Ouaf Ouaf", "2002-10-02", 3);
ALTER TABLE `rdv` DROP `lastname`;
ALTER TABLE `rdv` DROP `name`;
ALTER TABLE `rdv` DROP `nom_du_medecin`;
ALTER TABLE `rdv` DROP `specialite`;
INSERT INTO `rdv` (`date`, `id_Creneau_horaire`, `id_patients`, `id_Medecins`) VALUES ("2021-02-19", 2, 3, 1), ("2021-05-15", 1, 1, 1), ("2021-12-12", 2, 1, 2), ("2021-06-15", 2, 2, 1), ("2021-03-24", 8, 1, 5);
SELECT `rdv`.`date`, `creneau_horaire`.`creneau_horaire`, `patients`.`lastname`, `patients`.`name`, `medecins`.`lastname`, `medecins`.`name` FROM `rdv` INNER JOIN `creneau_horaire` ON `rdv`.`id_Creneau_horaire` = `creneau_horaire`.`id`  INNER JOIN `patients` ON `rdv`.`id_patients` = `patients`.`id` INNER JOIN `medecins` ON `rdv`.`id_Medecins` = `medecins`.`id`;
SELECT * FROM `rdv` INNER JOIN `medecins` ON `rdv`.`id_Medecins` = `medecins`.`id` WHERE `id_Medecins` = 2;
SELECT * FROM `rdv` WHERE `id_patients` = 2;