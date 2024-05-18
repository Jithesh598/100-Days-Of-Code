# Write your MySQL query statement below
#CREATE TABLE person( personId int NOT NULL,
                   
                  
                  #lastName varchar(255) NOT NULL,
                   # firstName varchar(255),
                   # PRIMARY KEY (personId)
                 #  );
        

SELECT Person.firstName,Person.lastName,Address.city,Address.state FROM Person LEFT JOIN Address ON (Person.personId = Address.personId);
                  
                    