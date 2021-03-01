CREATE TABLE Bien_immobilier(
        ID           Int  Auto_increment  NOT NULL ,
        name         Varchar (50) NOT NULL ,
        type         Varchar (50) NOT NULL ,
        code_postale Int NOT NULL ,
        price        Int NOT NULL
	,CONSTRAINT Bien_immobilier_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CLIENT
#------------------------------------------------------------

CREATE TABLE CLIENT(
        id                Int  Auto_increment  NOT NULL ,
        nom               Varchar (20) NOT NULL ,
        prenom            Varchar (20) NOT NULL ,
        date_de_naissance Date NOT NULL ,
        mail              Varchar (50) NOT NULL ,
        budget            Int NOT NULL ,
        type_de_bien      Varchar (50) NOT NULL
	,CONSTRAINT CLIENT_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: RDV
#------------------------------------------------------------

CREATE TABLE RDV(
        ID                 Int  Auto_increment  NOT NULL ,
        nom_du_bien        Varchar (50) NOT NULL ,
        name               Varchar (50) NOT NULL ,
        prenom             Varchar (50) NOT NULL ,
        date               Int NOT NULL ,
        crenaux_horaire    Int NOT NULL ,
        id_CLIENT          Int NOT NULL ,
        ID_Bien_immobilier Int NOT NULL
	,CONSTRAINT RDV_PK PRIMARY KEY (ID)

	,CONSTRAINT RDV_CLIENT_FK FOREIGN KEY (id_CLIENT) REFERENCES CLIENT(id)
	,CONSTRAINT RDV_Bien_immobilier0_FK FOREIGN KEY (ID_Bien_immobilier) REFERENCES Bien_immobilier(ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: INTERET
#------------------------------------------------------------

CREATE TABLE INTERET(
        id                 Int NOT NULL ,
        ID_Bien_immobilier Int NOT NULL
	,CONSTRAINT INTERET_PK PRIMARY KEY (id,ID_Bien_immobilier)

	,CONSTRAINT INTERET_CLIENT_FK FOREIGN KEY (id) REFERENCES CLIENT(id)
	,CONSTRAINT INTERET_Bien_immobilier0_FK FOREIGN KEY (ID_Bien_immobilier) REFERENCES Bien_immobilier(ID)
)ENGINE=InnoDB;
SELECT * FROM `bien_immobilier` ORDER BY `price` DESC;
SELECT * FROM `rdv` ORDER BY `date` DESC;
SELECT * FROM `client` ORDER BY `type_de_bien` DESC;
INSERT INTO `bien_immobilier` (`name`, `type`, `code_postale`, `price`) VALUES ("oui", "appartement", "76600", "45"), ("non", "maison", "76600", "50");
SELECT * FROM `bien_immobilier` ORDER BY `price` DESC;