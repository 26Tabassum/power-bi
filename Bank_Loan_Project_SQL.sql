use bank_loan_project;

select *from finance_1;
select *from finance_2;

########KPI 1 Year wise loan amount Stats
select (issue_d) as Year_of_issue_date , sum(loan_amnt) as Total_loan_amnt
from finance_1
group by year_of_issue_date
order by Total_loan_amnt;

#####KPI2#####Grade and sub grade wise revol_bal

select grade, sub_grade , sum(revol_bal) as Total_of_revol_bal
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by grade , sub_grade
order by grade , sub_grade;

#####KPI 3#####Total Payment for Verified Status Vs Total Payment for Non Verified Status

select verification_status, concat("$",format(round(sum(total_pymnt)/1000000,2),2),"M") as total_payment
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by verification_status;

#####KPI 4 - 1#####State wise and month wise loan status

select addr_State as State , last_credit_pull_d as month , loan_status
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by State , Month , loan_status;


#####KPI 5 #####
select home_ownership, last_pymnt_d 
 from finance_1 inner join finance_2
 on (finance_1.id = finance_2.id)
 group by home_ownership, last_pymnt_d;
 