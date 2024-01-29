---------------UMBC TRANSIT MANAGEMENT SYSTEM------------------

--CREATING TABLES
CREATE TABLE Bus
                (Bus_ID NUMBER(6) NOT NULL,
                 Bus_Number VARCHAR(7) NOT NULL,
                 Bus_Capacity NUMBER(2) NOT NULL,
                 Bus_Model VARCHAR(10) CHECK(Bus_Model 
                        IN('Type - A','Type - B','Type - C','Type - D','Sports')) NOT NULL,
                 Bus_Year NUMBER(4) NOT NULL,
                 Insurance VARCHAR(3) NOT NULL,
                 CONSTRAINT Bus_PK PRIMARY KEY (Bus_ID));

--CREATING BUS-ROUTES TABLE
CREATE TABLE Bus_Routes(
                        Route_ID NUMBER(4) NOT NULL,
                        Route_Name VARCHAR(20) NOT NULL,
                        Start_Loc VARCHAR(25) CHECK (Start_Loc IN('UMBC-Campus','Hilltop CR')) NOT NULL,
                        End_Loc VARCHAR(25) CHECK (End_Loc
                            IN('Walmart','UMBC-Campus','Hilltop CR','Beechfield', 'Post-Office',
                            'Arundel Mills Mall','MARC','BloomsBerry Ave','InnerHarbour')) NOT NULL,
                        TotalStops NUMBER(2),
                        CONSTRAINT Route_PK PRIMARY KEY (Route_ID));

CREATE TABLE Manager(
                    Manager_ID NUMBER(7) NOT NULL,
                    Manager_Name VARCHAR(25) NOT NULL,
                    CONSTRAINT Manager_PK PRIMARY KEY(Manager_ID));

CREATE TABLE Driver(
                    Driver_ID NUMBER(7) NOT NULL,
                    Driver_Name VARCHAR(30) NOT NULL,
                    Manager_ID NUMBER(7) NOT NULL,
                    Hire_Date DATE,
                    Complaints NUMBER(2),
                    CONSTRAINT Driver_PK PRIMARY KEY(Driver_ID),
                    CONSTRAINT Manager_FK FOREIGN KEY(Manager_ID)REFERENCES Manager(Manager_ID));

CREATE TABLE Schedule(
                      Schedule_ID NUMBER(6) NOT NULL,
                      Route_ID NUMBER(4) NOT NULL,
                      Bus_ID NUMBER(6) NOT NULL,
                      Driver_ID NUMBER(7) NOT NULL,
                      Manager_ID NUMBER(7) NOT NULL,
                      Departure_Time TIMESTAMP NOT NULL,
                      Arrival_Time TIMESTAMP NOT NULL,
                      Day VARCHAR(8) CHECK(Day IN ('Week Day', 'Week End')),
                      CONSTRAINT Schedule_PK PRIMARY KEY(Schedule_ID),
                      CONSTRAINT Route_FK FOREIGN KEY (Route_ID) REFERENCES Bus_Routes(Route_ID),
                      CONSTRAINT Bus_FK FOREIGN KEY (Bus_ID) REFERENCES Bus(Bus_ID),
                      CONSTRAINT Driver_FK FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID),
                      CONSTRAINT Manager_FK1 FOREIGN KEY(Manager_ID) REFERENCES Manager(Manager_ID)); 



--INSERT VALUES INTO TABLES
INSERT INTO Bus VALUES(521227,'MD456Z1',50,'Type - C',2000, 'yes');
INSERT INTO Bus VALUES(521237,'BT756Z1',50,'Type - C',2000, 'yes');
INSERT INTO Bus VALUES(521228,'MD457X1',70,'Type - B',2003, 'yes');
INSERT INTO Bus VALUES(521229,'MZ486Z0',50,'Type - C',2000, 'yes');
INSERT INTO Bus VALUES(421220,'BZ856ZA',80,'Type - A',2009, 'yes');
INSERT INTO Bus VALUES(520231,'MD456ZK',50,'Type - C',2000, 'yes');
INSERT INTO Bus VALUES(521887,'CT897UM',60,'Sports',2019, 'yes');
INSERT INTO Bus VALUES(521997,'ZXD46Z1',50,'Type - D',2010, 'yes');
INSERT INTO Bus VALUES(345277,'MD006Y1',50,'Type - C',2000, 'yes');
INSERT INTO Bus VALUES(899217,'MD11001',50,'Type - C',2000, 'yes');


INSERT INTO Bus_Routes VALUES(9901,'Route-40','UMBC-Campus','Walmart',10);
INSERT INTO Bus_Routes VALUES(9989,'Paradise','UMBC-Campus','Beechfield',12);
INSERT INTO Bus_Routes VALUES(9980,'Paradise','Hilltop CR','UMBC-Campus',15);
INSERT INTO Bus_Routes VALUES(9891,'Arbutus','UMBC-Campus','Post-Office',5);
INSERT INTO Bus_Routes VALUES(9201,'Route-40','UMBC-Campus','Walmart',6);
INSERT INTO Bus_Routes VALUES(9701,'Arundel','UMBC-Campus','Arundel Mills Mall',6);
INSERT INTO Bus_Routes VALUES(9700,'MARC','UMBC-Campus','MARC',1);
INSERT INTO Bus_Routes VALUES(9001,'Catonsville','UMBC-Campus','BloomsBerry Ave',5);
INSERT INTO Bus_Routes VALUES(9101,'Downtown','UMBC-Campus','InnerHarbour',1);
INSERT INTO Bus_Routes VALUES(9909,'Paradise','UMBC-Campus','Beechfield',6);



INSERT INTO Manager VALUES(667878,'John Ray');
INSERT INTO Manager VALUES(667965,'Charles Dwan');
INSERT INTO Manager VALUES(661092,'Iris Kay');
INSERT INTO Manager VALUES(660987,'Kenny Dins');
INSERT INTO Manager VALUES(662102,'Amir Kendy');




INSERT INTO Driver VALUES(100981,'James',667878,'11/15/2022',0);
INSERT INTO Driver VALUES(107011,'Alexander',667878,'01/03/2015',0);
INSERT INTO Driver VALUES(118902,'Benjamin',660987,'10/25/2018',0);
INSERT INTO Driver VALUES(100980,'Laura',662102,'',0);
INSERT INTO Driver VALUES(109987,'Mary',660987,'11/16/2021',0);
INSERT INTO Driver VALUES(111981,'Jaquline',661092,'',1);
INSERT INTO Driver VALUES(190911,'Julies',662102,'04/03/2023',1);
INSERT INTO Driver VALUES(122981,'Imanueal',667965,'07/21/2017',0);
INSERT INTO Driver VALUES(199990,'Daniel',667878,'02/08/2018',0);
INSERT INTO Driver VALUES(100988,'Jany',661092,'12/10/2018',1);




INSERT INTO Schedule VALUES(248900,9901,521227,100981,667878,'08:30 AM','09:00 AM','Week Day');                      
INSERT INTO Schedule VALUES(247891,9901,521227,100981,667965,'09:30 AM','10:00 AM','Week Day'); 
INSERT INTO Schedule VALUES(248999,9989,521237,118902,667965,'07:15 AM','08:00 AM','Week End'); 
INSERT INTO Schedule VALUES(248910,9980,521228,100980,661092,'08:30 PM','09:15 PM','Week End'); 
INSERT INTO Schedule VALUES(248500,9901,521227,100981,660987,'10:30 PM','11:00 PM','Week Day'); 
INSERT INTO Schedule VALUES(271100,9701,421220,100981,6621202,'06:45 PM','07:15 PM','Week Day'); 
INSERT INTO Schedule VALUES(212345,9909,521997,199990,6621202,'02:30 PM','03:45 PM','Week End');
INSERT INTO Schedule VALUES(200976,9101,899217,190911,661092,'02:30 PM','03:15 PM','Week Day'); 
INSERT INTO Schedule VALUES(248880,9101,345277,100988,660987,'08:30 AM','09:40 AM','Week Day'); 
INSERT INTO Schedule VALUES(298654,9891,520231,100980,667878,'07:30 PM','08:00 PM','Week Day');   
INSERT INTO Schedule VALUES(211000,9701,521228,100988,661092,'08:30 AM','09:00 AM','Week End'); 

SELECT * FROM Schedule;                      
SELECT * FROM Driver;
SELECT * FROM Bus;
SELECT * FROM Manager;
SELECT * FROM Bus_Routes;

--Update manager name
--UPDATE Driver JOIN Manager ON 
--Driver.Manager_ID = Manager.Manager_ID SET Manager.Manager_Name = 'New Manager Name' 
--WHERE Manager.Manager_Name = 'Specific Manager Name';

-- UPDATING HIRE DATE OF DRIVER USING ID
UPDATE Driver SET Hire_date = '01/01/2005' 
    WHERE Driver_ID = ( 
        SELECT Driver_ID 
            FROM Driver 
                WHERE Driver_ID = 100980);
                        
--Finding number of schedules assigned to drivers using JOIN, GROUP BY
SELECT Driver_Name, COUNT(*) AS Num_Schedules
    FROM Schedule s
       INNER JOIN Driver d ON s.Driver_ID = d.Driver_ID
            GROUP BY Driver_Name
                ORDER BY Num_Schedules DESC;

--Finding the average capacity over the routes using JOIN, GROUP BY
SELECT Route_Name, AVG(Bus_Capacity) AS Avg_Capacity
    FROM Schedule s
        JOIN Bus b ON s.Bus_ID = b.Bus_ID
            JOIN Bus_Routes r ON s.Route_ID = r.Route_ID
                GROUP BY Route_Name;        

          
--Latest hire date of a driver using JOIN
SELECT Manager_Name, Hire_Date
    FROM Driver d
        RIGHT JOIN Manager m ON d.Manager_ID = m.Manager_ID
            WHERE Hire_Date = (
                                SELECT MAX(Hire_Date)
                    FROM Driver);                

--Finding out the bus number and driver name available after 12pm using JOIN
SELECT Driver_Name, Bus_Number, Departure_Time
        FROM Schedule s
            JOIN Driver d ON s.Driver_ID = d.Driver_ID
            JOIN Bus b ON s.Bus_ID = b.Bus_ID
                WHERE Departure_Time >= '12:00 PM';        


--Listing routename, schedules having capacity more than 50 Using JOIN, GROUP BY
SELECT Route_Name, COUNT(*) AS Num_Schedules
        FROM Schedule s
            JOIN Bus_Routes r ON s.Route_ID = r.Route_ID
            JOIN Bus b ON s.Bus_ID = b.Bus_ID
                WHERE b.Bus_Capacity >= 50
                    GROUP BY Route_Name
                        ORDER BY Num_Schedules DESC;
                        

--Listing out the driver and route scheduled by which manager
SELECT Driver.Driver_Name, Manager.Manager_Name, Bus_Routes.Route_Name 
    FROM Driver JOIN Schedule ON Driver.Driver_ID = Schedule.Driver_ID 
                JOIN Bus_Routes ON Schedule.Route_ID = Bus_Routes.Route_ID 
                JOIN Manager ON Driver.Manager_ID = Manager.Manager_ID;


--LISTING OUT DRIVER NAME AND SCHEUDLES ASSIGNED BASED ON START_LOC AND END_LOC USING JOIN, GROUP BY                
SELECT Driver.Driver_Name, COUNT(*) AS Num_Schedules 
    FROM Driver JOIN Schedule ON Driver.Driver_ID = Schedule.Driver_ID 
                JOIN Bus_Routes ON Schedule.Route_ID = Bus_Routes.Route_ID
                    WHERE Bus_Routes.Start_Loc = 'UMBC-Campus' AND Bus_Routes.End_Loc = 'Walmart'
                        GROUP BY Driver.Driver_Name;                

--Listing out the Bus routes which are available after 8AM from campus
SELECT DISTINCT Bus_Routes.Route_ID, Bus_Routes.Route_Name, Schedule.Bus_ID, Schedule.Departure_Time 
    FROM Bus_Routes FULL JOIN Schedule ON Bus_Routes.Route_ID = Schedule.Route_ID
        WHERE Schedule.Departure_Time >= '08:00 AM' AND Bus_Routes.Start_Loc = 'UMBC-Campus';
        
        
--Updating driver's hire date by retriving the manager name        
UPDATE Driver SET Hire_Date = '12/23/2020'
    WHERE Manager_ID = (
        SELECT Manager_ID
            FROM Manager
                WHERE Manager_Name = 'Amir Kendy');                

SELECT * FROM Driver;

--Updating capacity of all bus which are having less than 50
UPDATE Bus SET Bus_Capacity = 50
    WHERE Bus_ID IN (
        SELECT Bus_ID
            FROM Schedule
                GROUP BY Bus_ID
                    HAVING COUNT(*) < 50);
                    
SELECT * FROM Bus;                    


--Finding the Drivers whose having complaints in their service wrt manager using SELECT
SELECT m.Manager_Name, d.Driver_Name, d.Complaints 
    FROM Manager m,Driver d 
        WHERE m.Manager_ID = d.Manager_ID AND d.Complaints > 0
            ORDER BY m.Manager_Name;
            
            
--Selecting driver name and id in between hiring period
SELECT Bus_ID, Bus_Model, Bus_Capacity FROM Bus WHERE Bus_Model = 'Sports';

