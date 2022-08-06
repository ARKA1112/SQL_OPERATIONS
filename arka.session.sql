use BDHS_PROJECT

drop table Stock_prices

create table Stock_prices (Trading_date date,
Symbol VARCHAR(20),
Open FLOAT,
Close FLOAT,
Low FLOAT,
High FLOAT,
Volume int)

create table Stock_companies (Symbol varchar(20),
Company_name VARCHAR(20),
Sector VARCHAR(20),
Sub_industry VARCHAR(20),
Headquarter VARCHAR(20))


load data local infile '/home/opensuse/Downloads/Compressed/NYSE/StockPrices.csv'
into table Stock_prices
fields terminated by ','
lines TERMINATED by '\n'
ignore 1 rows



load data local infile '/home/opensuse/Downloads/Compressed/NYSE/Stockcompanies.csv'
into table Stock_companies
FIELDS TERMINATED by ','
lines TERMINATED by '\n'
ignore 1 rows

select count(*) from Stock_prices limit 4

select count(*) from Stock_companies limit 6

select * from Stock_prices limit 5


select Headquarter from Stock_companies limit 5



create table stock_price_comp AS
select * from (SELECT
year(sp.Trading_date) as Trading_year,
month(sp.Trading_date) as Trading_month,
sc.Symbol as Symbol,
sc.Company_name as Company_name,
substring(sc.Headquarter,position(';' in sc.Headquarter)) as State,
sc.Sector as Sector,
sc.Sub_industry as sub_industry,
sp.Open as Open,
sp.Close as Close,
sp.Low as Low,
sp.High as High,
sp.Volume as Volume
from Stock_prices as sp
inner join Stock_companies sc on sp.Symbol = sc.Symbol) comb_table 


select * from stock_price_comp limit 10


select Symbol,Company_name, sum((Open-Close)*Volume) as nett_vol
from stock_price_comp
group by Company_name
order by nett_vol DESC

/*Here we get the top five companies*/


select State,sub_industry, avg((Open-Close)*Volume) as nett_vol
from stock_price_comp
group by State
order by nett_vol DESC

/*second question answered*/

SELECT Sector,  sum((Open-Close)*Volume) over (PARTITION by Trading_year)
from stock_price_comp
order by sum((Open-Close)*Volume) over (partition by Trading_year) desc
