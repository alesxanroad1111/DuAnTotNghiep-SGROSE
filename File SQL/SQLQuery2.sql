create function autoIdUser()
returns varchar(20)
as
begin
	DECLARE @ID VARCHAR(20)
	IF (SELECT COUNT(Id) FROM Users) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(Id, 3)) FROM Users
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'KH00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'KH0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
end

alter table Users alter column Id varchar(20) default dbo.autoIdUser()

ALTER TABLE Staffs ADD  CONSTRAINT FT_id_staff  DEFAULT dbo.auto_idnv() FOR Id

ALTER TABLE OrdersDetails ADD  CONSTRAINT FT_id_ordersdetails DEFAULT dbo.auto_idoddt() FOR Id

alter table Orders drop constraint FK__Orders__Userid__35BCFE0A
alter table Orders drop column Userid
drop table Users

CREATE TABLE Users(
	Id varchar(20) NOT NULL primary key default dbo.auto_idkh(),
	Name nvarchar(50) NOT NULL,
	Email nvarchar(100) NOT NULL,
	Address nvarchar(200) NOT NULL,
	Phone varchar(20) NOT NULL,
	Password nvarchar(100) NOT NULL,
	Avatar varchar(200) NULL,
	Gender int NULL,
	Isactive tinyint NOT NULL,
	Createdtime date default getdate(),
	Updatedtime date default getdate()
)

alter table Orders add Userid varchar(20) foreign key references Users(Id)