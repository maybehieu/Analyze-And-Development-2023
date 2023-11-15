CREATE TABLE `User` (
  Id         int(10) NOT NULL AUTO_INCREMENT, 
  CustomerId int(10) NOT NULL, 
  EmployeeId int(10) NOT NULL, 
  Gender     varchar(255), 
  Account    int(10), 
  Fullname   int(10), 
  Contact    int(10), 
  Birth      int(10), 
  Address    int(10), 
  PRIMARY KEY (Id));
CREATE TABLE Customer (
  Id            int(10) NOT NULL AUTO_INCREMENT, 
  OrderId       int(10) NOT NULL, 
  BillId        int(10) NOT NULL, 
  Favourite     int(10), 
  SearchHistory int(10), 
  `User`        int(10), 
  unverifiedId  int(10), 
  IP            varchar(255), 
  verifiedId    int(10), 
  MemberID      int(10), 
  Discriminator varchar(255) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Account (
  Id       int(10) NOT NULL AUTO_INCREMENT, 
  UserId   int(10) NOT NULL, 
  Username varchar(255), 
  Password varchar(255), 
  PRIMARY KEY (Id));
CREATE TABLE Fullname (
  Id        int(10) NOT NULL AUTO_INCREMENT, 
  UserId    int(10) NOT NULL, 
  Firstname varchar(255), 
  Lastname  varchar(255), 
  PRIMARY KEY (Id));
CREATE TABLE Contact (
  Id       int(10) NOT NULL AUTO_INCREMENT, 
  UserId   int(10) NOT NULL, 
  PhoneNum varchar(255), 
  Type     varchar(255), 
  PRIMARY KEY (Id));
CREATE TABLE Birth (
  Id     int(10) NOT NULL AUTO_INCREMENT, 
  UserId int(10) NOT NULL, 
  Day    varchar(255), 
  Month  varchar(255), 
  Year   varchar(255), 
  PRIMARY KEY (Id));
CREATE TABLE Favourite (
  Id          int(10) NOT NULL AUTO_INCREMENT, 
  CustomerId  int(10) NOT NULL, 
  ProductName varchar(255), 
  PRIMARY KEY (Id));
CREATE TABLE Report (
  Id          int(10) NOT NULL AUTO_INCREMENT, 
  CustomerId2 int(10) NOT NULL, 
  EmployeeId  int(10) NOT NULL, 
  TimeStamp   varchar(255), 
  ProductName varchar(255), 
  Reason      varchar(255), 
  CustomerId  int(10) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Employee (
  Id            int(10) NOT NULL AUTO_INCREMENT, 
  AreaId        int(10) NOT NULL, 
  BranchId      int(10) NOT NULL, 
  Salaries      float NOT NULL, 
  StartedDate   varchar(255), 
  Area          int(10), 
  Branch        int(10), 
  `User`        int(10), 
  ceoId         int(10), 
  Profession    varchar(255), 
  accountantId  int(10), 
  ExpYears      int(10), 
  srageManId    int(10), 
  Experience    varchar(255), 
  sysManId      int(10), 
  WorkDays      int(10), 
  Discriminator varchar(255) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Timesheet (
  Id         int(10) NOT NULL AUTO_INCREMENT, 
  EmployeeId int(10) NOT NULL, 
  `Date`     varchar(255), 
  Status     varchar(255), 
  PRIMARY KEY (Id));
CREATE TABLE Branch (
  Id         int(10) NOT NULL AUTO_INCREMENT, 
  Name       varchar(255), 
  NumWorkers int(10) NOT NULL, 
  Location   varchar(255), 
  PRIMARY KEY (Id));
CREATE TABLE SalaryGrade (
  Id         int(10) NOT NULL AUTO_INCREMENT, 
  EmployeeId int(10) NOT NULL, 
  Name       varchar(255), 
  Multiplier float NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Area (
  Id       int(10) NOT NULL AUTO_INCREMENT, 
  Square   float NOT NULL, 
  Location varchar(255), 
  PRIMARY KEY (Id));
CREATE TABLE Notification (
  Id         int(10) NOT NULL AUTO_INCREMENT, 
  EmployeeId int(10) NOT NULL, 
  CustomerId int(10) NOT NULL, 
  Context    varchar(255), 
  TimeStamp  varchar(255), 
  `From`     varchar(255), 
  PRIMARY KEY (Id));
CREATE TABLE SearchHistory (
  Id         int(10) NOT NULL AUTO_INCREMENT, 
  CustomerId int(10) NOT NULL, 
  Timestamp  varchar(255), 
  Keywords   varchar(255), 
  PRIMARY KEY (Id));
CREATE TABLE Cart (
  Id            int(10) NOT NULL AUTO_INCREMENT, 
  CustomerId    int(10) NOT NULL, 
  CreatedAt     varchar(255), 
  UpdatedAt     varchar(255), 
  TotalQuantity varchar(255), 
  TotalPrice    varchar(255), 
  PRIMARY KEY (Id));
CREATE TABLE `Order` (
  Id         int(10) NOT NULL AUTO_INCREMENT, 
  EmployeeId int(10) NOT NULL, 
  VoucherId  int(10) NOT NULL, 
  PaymentId  int(10), 
  ShipmentId int(10) NOT NULL, 
  BillId     int(10) NOT NULL, 
  CartId     int(10) NOT NULL, 
  `Date`     varchar(255), 
  Cart       int(10), 
  Payment    int(10), 
  Shipment   int(10), 
  Voucher    int(10), 
  PRIMARY KEY (Id));
CREATE TABLE Bill (
  Id          int(10) NOT NULL AUTO_INCREMENT, 
  EmployeeId  int(10) NOT NULL, 
  Total       float NOT NULL, 
  DateCreated varchar(255), 
  Discount    float NOT NULL, 
  `Order`     int(10), 
  PRIMARY KEY (Id));
CREATE TABLE Shipment (
  Id            int(10) NOT NULL AUTO_INCREMENT, 
  Fees          float NOT NULL, 
  Address       varchar(255), 
  Name          varchar(255), 
  ecoId         int(10), 
  MaxTime       varchar(255), 
  fastId        int(10), 
  Tax           float, 
  safeId        int(10), 
  Insurance     varchar(255), 
  Discriminator varchar(255) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE ProductItem (
  Id         int(10) NOT NULL AUTO_INCREMENT, 
  EmployeeId int(10) NOT NULL, 
  Price      float NOT NULL, 
  AddedDate  varchar(255), 
  InStock    int(10) NOT NULL, 
  Product    int(10), 
  PRIMARY KEY (Id));
CREATE TABLE Product (
  Id            int(10) NOT NULL AUTO_INCREMENT, 
  EmployeeId    int(10) NOT NULL, 
  ProductItemId int(10) NOT NULL, 
  ProviderId    int(10) NOT NULL, 
  Name          varchar(255), 
  Summary       varchar(255), 
  ReleaseDate   varchar(255), 
  Provider      int(10), 
  Category      varchar(255), 
  pId           int(10), 
  pType         varchar(255), 
  pBrand        varchar(255), 
  pModel        varchar(255), 
  pSpec         varchar(255), 
  bId           int(10), 
  bAuthor       varchar(255), 
  bCategory     varchar(255), 
  bPageNum      int(10), 
  bVolume       int(10), 
  cId           int(10), 
  cType         varchar(255), 
  cBrand        varchar(255), 
  cColor        varchar(255), 
  cGender       varchar(255), 
  Discriminator varchar(255) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Provider (
  Id      int(10) NOT NULL AUTO_INCREMENT, 
  Address varchar(255), 
  Name    varchar(255), 
  PRIMARY KEY (Id));
CREATE TABLE Voucher (
  Id            int(10) NOT NULL AUTO_INCREMENT, 
  Name          varchar(255), 
  ExpireDate    varchar(255), 
  consId        int(10), 
  Quantity      float, 
  Value         float, 
  percId        int(10), 
  Percentage    int(10), 
  Discriminator varchar(255) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Payment (
  Id            int(10) NOT NULL AUTO_INCREMENT, 
  Fee           float NOT NULL, 
  Name          varchar(255), 
  codId         int(10), 
  Currency      varchar(255), 
  cardId        int(10), 
  CardNum       varchar(255), 
  Type          varchar(255), 
  bankId        int(10), 
  AccountNum    varchar(255), 
  Token         varchar(255), 
  Discriminator varchar(255) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Address (
  Id       int(10) NOT NULL AUTO_INCREMENT, 
  UserId   int(10) NOT NULL, 
  City     varchar(255), 
  District varchar(255), 
  Houseno  varchar(255), 
  PRIMARY KEY (Id));
CREATE TABLE Cart_ProductItem (
  CartId        int(10) NOT NULL, 
  ProductItemId int(10) NOT NULL, 
  PRIMARY KEY (CartId, 
  ProductItemId));
ALTER TABLE Address ADD CONSTRAINT FKAddress555376 FOREIGN KEY (UserId) REFERENCES `User` (Id);
ALTER TABLE Account ADD CONSTRAINT FKAccount182229 FOREIGN KEY (UserId) REFERENCES `User` (Id);
ALTER TABLE Fullname ADD CONSTRAINT FKFullname66011 FOREIGN KEY (UserId) REFERENCES `User` (Id);
ALTER TABLE Contact ADD CONSTRAINT FKContact665198 FOREIGN KEY (UserId) REFERENCES `User` (Id);
ALTER TABLE Birth ADD CONSTRAINT FKBirth323370 FOREIGN KEY (UserId) REFERENCES `User` (Id);
ALTER TABLE `User` ADD CONSTRAINT FKUser707819 FOREIGN KEY (EmployeeId) REFERENCES Employee (Id);
ALTER TABLE Timesheet ADD CONSTRAINT FKTimesheet388611 FOREIGN KEY (EmployeeId) REFERENCES Employee (Id);
ALTER TABLE Employee ADD CONSTRAINT FKEmployee811999 FOREIGN KEY (BranchId) REFERENCES Branch (Id);
ALTER TABLE SalaryGrade ADD CONSTRAINT FKSalaryGrad682862 FOREIGN KEY (EmployeeId) REFERENCES Employee (Id);
ALTER TABLE Employee ADD CONSTRAINT FKEmployee522379 FOREIGN KEY (AreaId) REFERENCES Area (Id);
ALTER TABLE Report ADD CONSTRAINT FKReport961542 FOREIGN KEY (EmployeeId) REFERENCES Employee (Id);
ALTER TABLE Report ADD CONSTRAINT FKReport48094 FOREIGN KEY (CustomerId2) REFERENCES Customer (Id);
ALTER TABLE Favourite ADD CONSTRAINT FKFavourite860819 FOREIGN KEY (CustomerId) REFERENCES Customer (Id);
ALTER TABLE SearchHistory ADD CONSTRAINT FKSearchHist481227 FOREIGN KEY (CustomerId) REFERENCES Customer (Id);
ALTER TABLE Cart ADD CONSTRAINT FKCart195887 FOREIGN KEY (CustomerId) REFERENCES Customer (Id);
ALTER TABLE Cart_ProductItem ADD CONSTRAINT FKCart_Produ684091 FOREIGN KEY (CartId) REFERENCES Cart (Id);
ALTER TABLE Cart_ProductItem ADD CONSTRAINT FKCart_Produ912293 FOREIGN KEY (ProductItemId) REFERENCES ProductItem (Id);
ALTER TABLE `Order` ADD CONSTRAINT FKOrder795661 FOREIGN KEY (CartId) REFERENCES Cart (Id);
ALTER TABLE `Order` ADD CONSTRAINT FKOrder345926 FOREIGN KEY (BillId) REFERENCES Bill (Id);
ALTER TABLE Notification ADD CONSTRAINT FKNotificati657071 FOREIGN KEY (CustomerId) REFERENCES Customer (Id);
ALTER TABLE Notification ADD CONSTRAINT FKNotificati799766 FOREIGN KEY (EmployeeId) REFERENCES Employee (Id);
ALTER TABLE Customer ADD CONSTRAINT FKCustomer259422 FOREIGN KEY (BillId) REFERENCES Bill (Id);
ALTER TABLE Customer ADD CONSTRAINT FKCustomer819460 FOREIGN KEY (OrderId) REFERENCES `Order` (Id);
ALTER TABLE Product ADD CONSTRAINT FKProduct23385 FOREIGN KEY (ProviderId) REFERENCES Provider (Id);
ALTER TABLE Product ADD CONSTRAINT FKProduct220911 FOREIGN KEY (ProductItemId) REFERENCES ProductItem (Id);
ALTER TABLE `Order` ADD CONSTRAINT FKOrder751860 FOREIGN KEY (ShipmentId) REFERENCES Shipment (Id);
ALTER TABLE `Order` ADD CONSTRAINT FKOrder92127 FOREIGN KEY (PaymentId) REFERENCES Payment (Id);
ALTER TABLE `Order` ADD CONSTRAINT FKOrder661550 FOREIGN KEY (VoucherId) REFERENCES Voucher (Id);
ALTER TABLE Product ADD CONSTRAINT FKProduct826752 FOREIGN KEY (EmployeeId) REFERENCES Employee (Id);
ALTER TABLE ProductItem ADD CONSTRAINT FKProductIte433383 FOREIGN KEY (EmployeeId) REFERENCES Employee (Id);
ALTER TABLE Bill ADD CONSTRAINT FKBill283248 FOREIGN KEY (EmployeeId) REFERENCES Employee (Id);
ALTER TABLE `Order` ADD CONSTRAINT FKOrder900062 FOREIGN KEY (EmployeeId) REFERENCES Employee (Id);
ALTER TABLE `User` ADD CONSTRAINT FKUser749018 FOREIGN KEY (CustomerId) REFERENCES Customer (Id);
