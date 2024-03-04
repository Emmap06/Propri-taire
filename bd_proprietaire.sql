CREATE DATABASE Bd_proprietaire;

USE Bd_proprietaire;


CREATE TABLE Users (
    UsersID INT PRIMARY KEY IDENTITY,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    MotDePasse NVARCHAR(100) NOT NULL,
    Role NVARCHAR(50) NOT NULL
);

CREATE TABLE Proprietaire (
    ProprietaireID INT PRIMARY KEY IDENTITY,
    Nom NVARCHAR(50) NOT NULL,
    Prenom NVARCHAR(50),
    Adresse NVARCHAR(100),
    Ville NVARCHAR(50),
    Pays NVARCHAR(50),
    Photo_path NVARCHAR(100),
    UserID INT,
    FOREIGN KEY (UsersID) REFERENCES Users(UsersID)
);

CREATE TABLE Locataire (
    LocataireID INT PRIMARY KEY IDENTITY,
    Nom NVARCHAR(50) NOT NULL,
    Prenom NVARCHAR(50),
    Adresse NVARCHAR(100),
    Ville NVARCHAR(50),
    Pays NVARCHAR(50),
    Photo_path NVARCHAR(100),
    UserID INT,
    FOREIGN KEY (UsersID) REFERENCES Users(UsersID)
);

CREATE TABLE Propriete (
    ProprieteID INT PRIMARY KEY IDENTITY,
    Adresse NVARCHAR(100) NOT NULL,
    loyer DECIMAL(18, 2) NOT NULL,
    nbre_piece INT NOT NULL,
    Caution DECIMAL(18, 2),
    Avance DECIMAL(18, 2),
    Titre_de_propriete NVARCHAR(100),
    type_maison NVARCHAR(50),
    Echeance DATE
);

CREATE TABLE Contrat (
    ContratID INT PRIMARY KEY IDENTITY,
    LocataireID INT,
    ProprieteID INT,
    Debut_contrat DATE,
    Fin_contrat DATE,
    Document_path NVARCHAR(100),
    FOREIGN KEY (LocataireID) REFERENCES Locataire(LocataireID),
    FOREIGN KEY (ProprieteID) REFERENCES Propriete(ProprieteID)
);

CREATE TABLE Moyen_paiement (
    MoyenPaiementID INT PRIMARY KEY IDENTITY,
    Wave NVARCHAR(10),
    Mtn NVARCHAR(10),
    Moov NVARCHAR(10),
    Orange NVARCHAR(10),
    Carte_visa NVARCHAR(16)
);

CREATE TABLE Paiement_loyer (
    PaiementID INT PRIMARY KEY IDENTITY,
    LocataireID INT,
    ProprieteID INT,
    Montant DECIMAL(18, 2),
    Operateur NVARCHAR(50),
    Date_paiement DATE,
    FOREIGN KEY (LocataireID) REFERENCES Locataire(LocataireID),
    FOREIGN KEY (ProprieteID) REFERENCES Propriete(ProprieteID)
);

CREATE TABLE Bon_payeur (
    BonPayeurID INT PRIMARY KEY IDENTITY,
    LocataireID INT,
    ProprieteID INT,
    Avance_Mois INT,
    FOREIGN KEY (LocataireID) REFERENCES Locataire(LocataireID),
    FOREIGN KEY (ProprieteID) REFERENCES Propriete(ProprieteID)
);

CREATE TABLE Mauvais_payeur (
    MauvaisPayeurID INT PRIMARY KEY IDENTITY,
    LocataireID INT,
    ProprieteID INT,
    Retard_Mois INT,
    FOREIGN KEY (LocataireID) REFERENCES Locataire(LocataireID),
    FOREIGN KEY (ProprieteID) REFERENCES Propriete(ProprieteID)
);
