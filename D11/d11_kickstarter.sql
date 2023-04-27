-- CARD LEFT
select 
'fa fa-building-o'ICON_CLASS,
'u-color-2'ICON_COLOR_CLASS,
'# Total Projects'list_text,
to_char(count(*),'999G999G999G990') list_title
from d11_kickstarter
union
select 
'fa fa-smile-o'ICON_CLASS,
'u-color-3'ICON_COLOR_CLASS,
'# Successfull Projects'list_text,
to_char(count(*),'999G999G999G990') list_title
from d11_kickstarter
where State='Successful'
union
select 
'fa fa-frown-o'ICON_CLASS,
'u-color-4'ICON_COLOR_CLASS,
'# Failed Projects'list_text,
to_char(count(*),'999G999G999G990') list_title
from d11_kickstarter
where State='Failed'
union
select 
'fa fa-smile-o'ICON_CLASS,
'u-color-5'ICON_COLOR_CLASS,
'Value Pledged Successfull'list_text,
to_char(sum(Pledged)/1000000,'999G999G999G990')||' M$'list_title
from d11_kickstarter
where State='Successful'

-- Value Pledged By Category
select sum(pledged)pledged,category
from d11_kickstarter
where state = 'Successful'
group by category


-- # Projects by State and Year (Click on the Bars for details)
select 
'#E14F45'color_class,
state, to_char(launched,'YYYY')launched_year, count(*) value
from d11_kickstarter
group by state, to_char(launched,'YYYY')
order by launched_year,state 


--# Projects by Country and Category (Click on the legend to deselect values)
select 
category,country--,state
, count(*) value
from d11_kickstarter
group by category,country--,state
order by country,category--,state

--Top Subcategories by Pledged Values
select category,subcategory
,sum(decode(goal,0,pledged,goal))goal,sum(pledged)pledged
,round(100*sum(pledged)/sum(decode(goal,0,pledged,goal)))perc_pledged
from d11_kickstarter
where state = 'Successful'
group by category,subcategory
order by pledged desc,category,subcategory


--% Successful, Failed and Canceled Projects by Country

-- Successful
with my_view as(
select country,state--,category
,sum(decode(goal,0,pledged,goal))goal,sum(pledged)pledged,count(*) num
from d11_kickstarter
group by country,state--,category
)
select 'Successful' state,a.country, --a.category,
sum(a.goal)goal,sum(a.num)all_num,sum(s.num)succ_num,round(100*sum(s.num)/sum(a.num),2)Perc_succ
 from my_view a 
 left join my_view s on a.country = s.country
                    and a.state = s.state
                    --and a.category = s.category 
                    and s.state='Successful'
group by a.country--,a.category
order by a.country--,a.category

-- Failed
with my_view as(
select country,state--,category
,sum(decode(goal,0,pledged,goal))goal,sum(pledged)pledged,count(*) num
from d11_kickstarter
group by country,state--,category
)
select 'Failed' state,a.country, --a.category,
sum(a.goal)goal,sum(a.num)all_num,sum(s.num)succ_num,round(100*sum(s.num)/sum(a.num),2)Perc_succ
 from my_view a 
 left join my_view s on a.country = s.country
                    and a.state = s.state
                    --and a.category = s.category 
                    and s.state='Failed'
group by a.country--,a.category
order by a.country--,a.category

-- Canceled
with my_view as(
select country,state--,category
,sum(decode(goal,0,pledged,goal))goal,sum(pledged)pledged,count(*) num
from d11_kickstarter
group by country,state--,category
)
select 'Canceled' state,a.country, --a.category,
sum(a.goal)goal,sum(a.num)all_num,sum(s.num)succ_num,round(100*sum(s.num)/sum(a.num),2)Perc_succ
 from my_view a 
 left join my_view s on a.country = s.country
                    and a.state = s.state
                    --and a.category = s.category 
                    and s.state='Canceled'
group by a.country--,a.category
order by a.country--,a.category
