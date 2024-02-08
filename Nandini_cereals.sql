create database cereals;
use cereals;
select * from cereals_data;

# 1. Add index name fast on name 

alter table cereals_data modify name_ varchar(50);
create index fast on cereals_data (name_);


# 2. Describe the schema of table 

describe cereals_data;

# 3. Create view name as see where users can not see type column [first run appropriate query then create view] 

create view see as (select name_,mfr,calories,protein,sodium,fiber,carbo,sugars,potass,vitamins,shelf,weight,cups,rating,HL_calories from cereals_data);

# 4. Rename the view as saw 

rename table see to saw;

# 5. Count how many are cold cereals 

select count(*) from cereals_data where type = "c";

# 6. Count how many cereals are kept in shelf 3 

select count(*) from cereals_data where shelf = 3;

# 7. Arrange the table from high to low according to ratings 

select * from cereals_data order by rating desc;

# 8. Suggest some column/s which can be Primary key 

alter table cereals_data add primary key (name_);

# 9. Find average of calories of hot cereal and cold cereal in one query 

select type,avg(calories) av from cereals_data group by type;

# 10. Add new column as HL_Calories where more than average calories should be categorized as 
# HIGH and less than average calories should be categorized as LOW 

alter table cereals_data add column HL_Calories char(4);
select avg(calories) from cereals_data;
update cereals_data set HL_calories = case when calories < 106.9737 then "Low" else "High" end;
select * from cereals_data;

# 11. List only those cereals whose name begins with B 

select * from cereals_data where name like 'b%';

# 12. List only those cereals whose name begins with F 

select * from cereals_data where name like 'f%';


# 13. List only those cereals whose name ends with s 

select * from cereals_data where name like '%s';


# 14. Select only those records which are HIGH in column HL_calories and mail to 
# jeevan.raj@imarticus.com [save/name your file as <your first name_cereals_high>] 

select * from cereals_data where HL_calories = 'High';

# 15. Find maximum of ratings

select max(rating) from cereals_data;

# 16. Find average ratings of those were High and Low calories 

select HL_calories, avg(rating) from cereals_data group by HL_calories;

# 17. Create two examples of Sub Queries of your choice and give explanation in the script 
# itself with remarks by using # 
# extract the records of cereals whose type is hot and has calories less than average calories.

select * from cereals_data where type='h' and calories < (select avg(calories) from cereals_data);


# 18. Remove column fat 
alter table cereals_data drop column fat;

# 19. Count records for each manufacturer [mfr] 

select mfr, count(*) as c from cereals_data group by mfr;

# 20. Select name, calories and ratings only

select name,calories,rating from cereals_data;