Create database SG_Rose

use SG_Rose

create table TypesOfFlowers (
 Id Varchar(20) primary key not null,
 Name Nvarchar(50) not null,
 Image Nvarchar(50)
)

create table Flowers (
	Id Varchar(20) primary key not null,
	Name Nvarchar(50) not null,
	TypeId Varchar(20) foreign key references TypesOfFlowers(Id),
	Amount int not null,
	Price int,
	Image Nvarchar(100),
	Notes Nvarchar(500),
	Created_time Date default getdate(),
	Update_time Date default getdate()
)

create table Users (
	Id Varchar(20) primary key not null,
	Name Nvarchar(50) not null,
	Email Nvarchar(100) not null,
	Address Nvarchar(200) not null,
	Phone varchar(20) not null,
	Password Nvarchar(100) not null,
	Avatar Varchar(200),
	Gender int,
	Is_Active tinyint not null,
	Created_time Date default getdate(),
	Updated_time Date default getdate()
)

create table Roles (
	Id int primary key not null,
	Name varchar(255) not null,
	Created_time Date default getdate(),
	Updated_time Date default getdate()
)

create table Staffs (
	Id Varchar(20) primary key not null,
	Name Nvarchar(50) not null,
	Email Nvarchar(100) not null,
	Password Nvarchar(100) not null,
	Birthday Date not null , 
	Address Nvarchar(200) not null,
	Avatar Varchar(200),
	Gender int,
	Phone varchar(20) not null,
	Role int not null,
	Created_time Date default getdate(),
	Updated_time Date default getdate()
)

create table Orders (
	Id Int identity(1,1) primary key not null,
	Userid varchar(20) foreign key references Users(Id) not null,
	Username Nvarchar(50) not null,
	Address Nvarchar(200) not null,
	Total_Money int ,
	Status int ,
	Is_paid int ,
	Created_time Date default getdate(),
	Updated_time Date default getdate()
)

create table OrdersDetails (
	Id Varchar(20) primary key not null,
	OrderId int foreign key references Orders(Id) not null,
	FlowerId Varchar(20) not null,
	Price int not null,
	Amount int not null,
	Total_price int not null,
	Created_time Date default getdate(),
	Updated_time Date default getdate()
)

create table Bills (

)

create table BillsDetail (

)

create table Companys (

)

create table Supports (
	Id int primary key not null,
	StaffId Varchar(20) foreign key references Staffs(Id),
	Phone Varchar(20) not null,
	Status int not null
)

create table Contacts (
	Id int primary key not null,
	UserId Varchar(20) foreign key references Users(Id),
	Topic Varchar(100),
	Message Varchar(5000) not null,
	Phone Varchar(20) not null,
	Map Varchar(500)
)
