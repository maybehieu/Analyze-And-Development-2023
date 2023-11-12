CREATE DATABASE onlinestore;
USE onlinestore;
CREATE TABLE Customer (ID int(10) NOT NULL AUTO_INCREMENT, Gender varchar(255), Birth varchar(255), AccountNum varchar(255), ID3 int(10), CardID varchar(255), Date2 varchar(255), ID2 int(10), `Date` varchar(255) , PRIMARY KEY (ID));
CREATE TABLE Address (ID int(10) NOT NULL AUTO_INCREMENT, CustomerID int(10) NOT NULL, Number varchar(255), Street varchar(255), District varchar(255), City varchar(255), PRIMARY KEY (ID));
CREATE TABLE Fullname (ID int(10) NOT NULL AUTO_INCREMENT, CustomerID int(10) NOT NULL, FirstName varchar(255), LastName varchar(255), PRIMARY KEY (ID));
CREATE TABLE Account (ID int(10) NOT NULL AUTO_INCREMENT, CustomerID int(10) NOT NULL, Email varchar(255), Password varchar(255), CreatedAt varchar(255), PRIMARY KEY (ID));
CREATE TABLE `Order` (ID int(10) NOT NULL AUTO_INCREMENT, PaymentID int(10) NOT NULL, BillOnlineID int(10) NOT NULL, CustomerID int(10) NOT NULL, `Date` varchar(255), PRIMARY KEY (ID));
CREATE TABLE Cart (ID int(10) NOT NULL AUTO_INCREMENT, CustomerID int(10) NOT NULL, OrderID int(10) NOT NULL, CreatedAt varchar(255), UpdatedAt varchar(255), TotalQuantity int(10) NOT NULL, TotalPrice float NOT NULL, PRIMARY KEY (ID));
CREATE TABLE BookItem (ID int(10) NOT NULL AUTO_INCREMENT, BookID int(10) NOT NULL, InStock int(10) NOT NULL, Price float NOT NULL, Discount float NOT NULL, `Date` varchar(255), PRIMARY KEY (ID));
CREATE TABLE Book (ID int(10) NOT NULL AUTO_INCREMENT, PublisherID int(10) NOT NULL, ISBN varchar(255), Title varchar(255), NumberOfPage int(10) NOT NULL, Summary varchar(255), Year int(10) NOT NULL, ID2 int(10), `National` varchar(255), TranslateLanguage varchar(255), Seasons varchar(255), ID3 int(10), NameComics varchar(255), SeriesName varchar(255), Artist varchar(255), ID4 int(10), NameBook varchar(255), Months varchar(255), Type varchar(255) , PRIMARY KEY (ID));
CREATE TABLE Author (ID int(10) NOT NULL AUTO_INCREMENT, Name varchar(255), Biography varchar(255), PRIMARY KEY (ID));
CREATE TABLE Publisher (ID int(10) NOT NULL AUTO_INCREMENT, Address varchar(255), Name varchar(255), YearsOfPublish varchar(255), PRIMARY KEY (ID));
CREATE TABLE Payment (ID int(10) NOT NULL AUTO_INCREMENT, ShipmentID int(10) NOT NULL, VoucherID int(10) NOT NULL, Amount float NOT NULL, ID2 int(10), CashTendered float, ID3 int(10), Name varchar(255), BankID varchar(255), ID4 int(10), Number varchar(255), Type varchar(255), ExpString varchar(255) , PRIMARY KEY (ID));
CREATE TABLE Shipment (ID int(10) NOT NULL AUTO_INCREMENT, Price float NOT NULL, Description varchar(255), ID4 int(10), Country varchar(255), Tax float, ID2 int(10), City varchar(255), TimeDesired varchar(255), ID3 int(10), Company varchar(255) , PRIMARY KEY (ID));
CREATE TABLE Phone (ID int(10) NOT NULL AUTO_INCREMENT, CustomerID int(10) NOT NULL, StatesNo varchar(255), Number varchar(255), PRIMARY KEY (ID));
CREATE TABLE Electronic (ID int(10) NOT NULL AUTO_INCREMENT, ManufacturerElectronicsID int(10) NOT NULL, Name varchar(255), Year int(10) NOT NULL, Certificates varchar(255), SafetyClaims varchar(255), ID2 int(10), Storage varchar(255), RAM varchar(255), OperationSystem varchar(255), ScreenWidth float, Resolution varchar(255), Touchable bit(1), ID3 int(10), ScreenWidth2 float, Resolution2 varchar(255), `Disk` varchar(255), RAM2 varchar(255), OperationSystem2 varchar(255), Touchable2 bit(1), ID4 int(10), Disk2 varchar(255), RAM3 varchar(255), OperationSystem3 varchar(255) , PRIMARY KEY (ID));
CREATE TABLE ElectronicItem (ID int(10) NOT NULL AUTO_INCREMENT, ElectronicID int(10) NOT NULL, Quantity int(10) NOT NULL, Price float NOT NULL, Discount float NOT NULL, `Date` varchar(255), PRIMARY KEY (ID));
CREATE TABLE Clothes (ID int(10) NOT NULL AUTO_INCREMENT, ManufacturerClothesID int(10) NOT NULL, Gender varchar(255), Type varchar(255), Material varchar(255), ID3 int(10), Type3 varchar(255), Length varchar(255), PocketAvailable varchar(255), ID2 int(10), Type2 varchar(255), FashionList varchar(255), SleeveType varchar(255), ID4 int(10), Type4 varchar(255), Length2 varchar(255), Age varchar(255), FashionList2 varchar(255) , PRIMARY KEY (ID));
CREATE TABLE ClothesItem (ID int(10) NOT NULL AUTO_INCREMENT, ClothesID int(10) NOT NULL, Quantity int(10) NOT NULL, Price float NOT NULL, Discount float NOT NULL, `Date` varchar(255), PRIMARY KEY (ID));
CREATE TABLE Shoes (ID int(10) NOT NULL AUTO_INCREMENT, ManufacturerShoesID int(10) NOT NULL, Gender varchar(255), Weight varchar(255), Launched varchar(255), Material varchar(255), ID2 int(10), Style varchar(255), Type varchar(255), BrandName varchar(255), ID3 int(10), Height varchar(255), Type2 varchar(255), BrandName2 varchar(255), Style2 varchar(255), FashionList varchar(255), ID4 int(10), Style3 varchar(255), Type3 varchar(255), BrandName3 varchar(255) , PRIMARY KEY (ID));
CREATE TABLE ShoesItem (ID int(10) NOT NULL AUTO_INCREMENT, ShoesID int(10) NOT NULL, Quantity int(10) NOT NULL, Price float NOT NULL, Discount float NOT NULL, `Date` varchar(255), PRIMARY KEY (ID));
CREATE TABLE ManufacturerClothes (ID int(10) NOT NULL AUTO_INCREMENT, Name varchar(255), Country varchar(255), Description varchar(255), PRIMARY KEY (ID));
CREATE TABLE `Size` (ID int(10) NOT NULL AUTO_INCREMENT, VariantID int(10) NOT NULL, Sign varchar(255), `Size` int(10) NOT NULL, PRIMARY KEY (ID));
CREATE TABLE Variant (ID int(10) NOT NULL AUTO_INCREMENT, ShoesID int(10) NOT NULL, ClothesID int(10) NOT NULL, ProduceDate varchar(255), PRIMARY KEY (ID));
CREATE TABLE Color (ID int(10) NOT NULL AUTO_INCREMENT, VariantID int(10) NOT NULL, Name varchar(255), ColorCode varchar(255), PRIMARY KEY (ID));
CREATE TABLE BillOnline (ID int(10) NOT NULL AUTO_INCREMENT, CustomerID int(10) NOT NULL, TotalPrice float NOT NULL, DateCreate varchar(255), TotalDiscount float NOT NULL, `Order` int(10), PRIMARY KEY (ID));
CREATE TABLE Voucher (ID int(10) NOT NULL AUTO_INCREMENT, Name varchar(255), ExpiresDate varchar(255), ID2 int(10), Quantity float, ID3 int(10), Percentage int(10) , PRIMARY KEY (ID));
CREATE TABLE Favourite (ID int(10) NOT NULL AUTO_INCREMENT, CustomerID int(10) NOT NULL, NameItem varchar(255), Link varchar(255), TimeStamp varchar(255), PRIMARY KEY (ID));
CREATE TABLE ManufacturerShoes (ID int(10) NOT NULL AUTO_INCREMENT, Name varchar(255), Country varchar(255), Description varchar(255), PRIMARY KEY (ID));
CREATE TABLE ManufacturerElectronics (ID int(10) NOT NULL AUTO_INCREMENT, Name varchar(255), Country varchar(255), Description varchar(255), PRIMARY KEY (ID));
CREATE TABLE Report (ID int(10) NOT NULL AUTO_INCREMENT, CustomerID int(10) NOT NULL, DateCreated varchar(255), Content varchar(255), LinkProduct varchar(255), PRIMARY KEY (ID));
CREATE TABLE SearchHistory (ID int(10) NOT NULL AUTO_INCREMENT, CustomerID int(10) NOT NULL, TimeStamp varchar(255), Link varchar(255), PRIMARY KEY (ID));
CREATE TABLE Book_Author (BookID int(10) NOT NULL, AuthorID int(10) NOT NULL, PRIMARY KEY (BookID, AuthorID));
CREATE TABLE BookItem_Cart (BookItemID int(10) NOT NULL, CartID int(10) NOT NULL, Quantity int(10) NOT NULL, PRIMARY KEY (BookItemID, CartID));
CREATE TABLE ClothesItem_Cart (ClothesItemID int(10) NOT NULL, CartID int(10) NOT NULL, Quantity int(10) NOT NULL, PRIMARY KEY (ClothesItemID, CartID));
CREATE TABLE ShoesItem_Cart (ShoesItemID int(10) NOT NULL, CartID int(10) NOT NULL, Quantity int(10) NOT NULL, PRIMARY KEY (ShoesItemID, CartID));
CREATE TABLE ElectronicItem_Cart (ElectronicItemID int(10) NOT NULL, CartID int(10) NOT NULL, Quantity int(10) NOT NULL, PRIMARY KEY (ElectronicItemID, CartID));
ALTER TABLE Address ADD CONSTRAINT FKAddress64710 FOREIGN KEY (CustomerID) REFERENCES Customer (ID);
ALTER TABLE Fullname ADD CONSTRAINT FKFullname417515 FOREIGN KEY (CustomerID) REFERENCES Customer (ID);
ALTER TABLE Account ADD CONSTRAINT FKAccount437857 FOREIGN KEY (CustomerID) REFERENCES Customer (ID);
ALTER TABLE `Order` ADD CONSTRAINT FKOrder556711 FOREIGN KEY (CustomerID) REFERENCES Customer (ID);
ALTER TABLE Cart ADD CONSTRAINT FKCart195823 FOREIGN KEY (CustomerID) REFERENCES Customer (ID);
ALTER TABLE Cart ADD CONSTRAINT FKCart92266 FOREIGN KEY (OrderID) REFERENCES `Order` (ID);
ALTER TABLE BookItem ADD CONSTRAINT FKBookItem313834 FOREIGN KEY (BookID) REFERENCES Book (ID);
ALTER TABLE Book ADD CONSTRAINT FKBook221643 FOREIGN KEY (PublisherID) REFERENCES Publisher (ID);
ALTER TABLE `Order` ADD CONSTRAINT FKOrder92191 FOREIGN KEY (PaymentID) REFERENCES Payment (ID);
ALTER TABLE Payment ADD CONSTRAINT FKPayment767140 FOREIGN KEY (ShipmentID) REFERENCES Shipment (ID);
ALTER TABLE Phone ADD CONSTRAINT FKPhone193160 FOREIGN KEY (CustomerID) REFERENCES Customer (ID);
ALTER TABLE ElectronicItem ADD CONSTRAINT FKElectronicItem917854 FOREIGN KEY (ElectronicID) REFERENCES Electronic(ID);
ALTER TABLE ClothesItem ADD CONSTRAINT FKClothesItem902277 FOREIGN KEY (ClothesID) REFERENCES Clothes (ID);
ALTER TABLE ShoesItem ADD CONSTRAINT FKShoesItem181756 FOREIGN KEY (ShoesID) REFERENCES Shoes (ID);
ALTER TABLE Clothes ADD CONSTRAINT FKClothes124338 FOREIGN KEY (ManufacturerClothesID) REFERENCES ManufacturerClothes (ID);
ALTER TABLE Variant ADD CONSTRAINT FKVariant761716 FOREIGN KEY (ShoesID) REFERENCES Shoes (ID);
ALTER TABLE Variant ADD CONSTRAINT FKVariant99014 FOREIGN KEY (ClothesID) REFERENCES Clothes (ID);
ALTER TABLE `Size` ADD CONSTRAINT FKSize94388 FOREIGN KEY (VariantID) REFERENCES Variant (ID);
ALTER TABLE Color ADD CONSTRAINT FKColor381715 FOREIGN KEY (VariantID) REFERENCES Variant (ID);
ALTER TABLE BillOnline ADD CONSTRAINT FKBillOnline329308 FOREIGN KEY (CustomerID) REFERENCES Customer (ID);
ALTER TABLE `Order` ADD CONSTRAINT FKOrder443398 FOREIGN KEY (BillOnlineID) REFERENCES BillOnline (ID);
ALTER TABLE Payment ADD CONSTRAINT FKPayment180552 FOREIGN KEY (VoucherID) REFERENCES Voucher (ID);
ALTER TABLE Favourite ADD CONSTRAINT FKFavourite752484 FOREIGN KEY (CustomerID) REFERENCES Customer (ID);
ALTER TABLE Shoes ADD CONSTRAINT FKShoes819773 FOREIGN KEY (ManufacturerShoesID) REFERENCES ManufacturerShoes (ID);
ALTER TABLE Electronic ADD CONSTRAINT FKElectronic702555 FOREIGN KEY (ManufacturerElectronicsID) REFERENCES ManufacturerElectronics (ID);
ALTER TABLE Report ADD CONSTRAINT FKReport553273 FOREIGN KEY (CustomerID) REFERENCES Customer (ID);
ALTER TABLE SearchHistory ADD CONSTRAINT FKSearchHist481291 FOREIGN KEY (CustomerID) REFERENCES Customer (ID);
ALTER TABLE Book_Author ADD CONSTRAINT FKBook_Autho438413 FOREIGN KEY (AuthorID) REFERENCES Author (ID);
ALTER TABLE Book_Author ADD CONSTRAINT FKBook_Autho139474 FOREIGN KEY (BookID) REFERENCES Book (ID);
ALTER TABLE BookItem_Cart ADD CONSTRAINT FKBookItem_C981214 FOREIGN KEY (CartID) REFERENCES Cart (ID);
ALTER TABLE BookItem_Cart ADD CONSTRAINT FKBookItem_C85651 FOREIGN KEY (BookItemID) REFERENCES BookItem (ID);
ALTER TABLE ClothesItem_Cart ADD CONSTRAINT FKClothesIte950639 FOREIGN KEY (CartID) REFERENCES Cart (ID);
ALTER TABLE ClothesItem_Cart ADD CONSTRAINT FKClothesIte448269 FOREIGN KEY (ClothesItemID) REFERENCES ClothesItem (ID);
ALTER TABLE ShoesItem_Cart ADD CONSTRAINT FKShoesItem_451799 FOREIGN KEY (CartID) REFERENCES Cart (ID);
ALTER TABLE ShoesItem_Cart ADD CONSTRAINT FKShoesItem_932303 FOREIGN KEY (ShoesItemID) REFERENCES ShoesItem (ID);
ALTER TABLE ElectronicItem_Cart ADD CONSTRAINT FKElectronic229915 FOREIGN KEY (CartID) REFERENCES Cart (ID);
ALTER TABLE ElectronicItem_Cart ADD CONSTRAINT FKElectronic476468 FOREIGN KEY (ElectronicItemID) REFERENCES ElectronicItem (ID);