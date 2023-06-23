CREATE TABLE Combination_Route_Sheet_Cargo(
	ID_Combination_Route_Sheet_Cargo int GENERATED BY DEFAULT AS IDENTITY,
	Route_Sheet_ID int not null,
	Cargo_ID int not null,
    constraint FK_Route_Sheet_Combination_2 FOREIGN KEY (Route_Sheet_ID) REFERENCES Route_Sheet (ID_Route_Sheet),
    constraint FK_Cargo_Combination_2 FOREIGN KEY (Cargo_ID) REFERENCES Cargo (ID_Cargo)
);