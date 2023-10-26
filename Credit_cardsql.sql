
/*-------------------------------------- CAPSTONE PROJECT ------------------------------------------*/

/*--------------------------------------ANALYSIS ON CREDIT CARD APPROVAL PREDICTION DATASET------------------------------------------*/

select * from credit_data_cleaned ;  # Viewing the Table

alter table credit_data_cleaned 
add primary key (ind_id ) ;    # Creating Primary key on the index column so that we can reduce our query time 

---------------------------------------------------------------------------------------------------------------
-- qns 1 
-- Group the customers based on their income type and find the average of their annual income.

/* Approch 
we have to find average annual income by grouping with respect to type_income
*/
select type_income  , round(avg(annual_income),2) as avg_annual_income_by_type_income 
from credit_data_cleaned 
group by type_income ;

-----------------------------------------------------------------------------------------------------------------

-- qns 2 
-- Find the female owners of cars and property.

/* Approch 
first we fillter data where gender is female , car_owner is yes , propert_owner is yes then we count all the records as total number_of_female
*/

select count(*) as number_of_female from credit_data_cleaned
where gender = 'f' and car_owner = 'y' and propert_owner = 'y'
 ; 
 
 
 ----------------------------------------------------------------------------------------
 
-- qns 3
-- Find the male customers who are staying with their families.

/* Approch 
for this we find those male which are married then we can conclude that they stay with family and for single men housing_type = 'With parents' these also staying with 
their families 
*/

select gender , housing_type , marital_status
from credit_data_cleaned where( marital_status = 'married' or housing_type = 'With parents')
and gender = 'm' ; 

-------------------------------------------------------------------------------------------------------------------------
-- qns 4
-- Please list the top five people having the highest income

/* Approch 
order data by annual_income in decending order and using limit reduce data set to 5 rows 
*/
 
 select * 
 from credit_data_cleaned 
 order by annual_income desc 
 limit 5  ; 
 
 -------------------------------------------------------------------------------------------------------------------------------------

-- qns 5
-- How many married people are having bad credit?

/* Approch 
filter data where marital_status = 'married' and label = 1 
and count them 
*/

select count(*) as married_with_bad_credit
from credit_data_cleaned where marital_status = 'married' and label = 1  ;


-----------------------------------------------------------------------------------------------------------------------------------------

-- qns 6
-- What is the highest education level and what is the total count?

/* Approch 
first we to find what  degree are in our data set 
then find count of all where education = highest education level 
*/

select distinct education
from credit_data_cleaned ; 

select count(*)  as count_of_Academic_degree_holder
from credit_data_cleaned where education = 'Academic degree' ; 

-----------------------------------------------------------------------------------------------------

-- qns 7
-- Between married males and females, who is having more bad credit? 

/* Approch 
first filter data as per requarment 
marital_status = 'married' and label = 1 
then group it by gender  in decending order of bad_credit limit it to one that is our ans 
*/

select gender , count(*) as bad_credit
 from credit_data_cleaned
 where marital_status = 'married' and label = 1 
 group by gender
 order by bad_credit desc 
 limit 1 ;


-------------------------------------------------------------------------------------------------------------------------------------------------












