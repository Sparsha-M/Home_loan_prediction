## Home_loan_prediction
Problem statement :
Dream Housing Finance company deals in all home loans. They have presence across all urban, semi urban and rural areas. Customer first apply for home loan after that company validates the customer eligibility for loan.
Company wants to automate the loan eligibility process (real time) based on customer detail provided while filling online application form. These details are Gender, Marital Status, Education, Number of Dependents, Income, Loan Amount, Credit History and others. To automate this process, they have given a problem to identify the customers segments, those are eligible for loan amount so that they can specifically target these customers.
Loan prediction is a very common real-life problem that each retail bank faces at least once in its lifetime. If done correctly, it can save a lot of man hours at the end of a retail bank.

Description about the Data Columns:
It’s very useful to know about the data columns before getting in to the actual problem for avoiding confusion at a later state. Now let us understand the data columns (that has been already given by the company itself ) first so that we will get a glance.
There are altogether 13 columns,614 rows in our data set. Of them Loan_Status is the response variable and rest all are the variables /factors that decide the approval of the loan or not.
Now let us look in to the each variable and can make some assumptions.(It’s just assumptions right, there is no harm in just assuming few statements)
Loan ID - As the name suggests each person should have a unique loan ID.
Gender - In general it is male or female. No offence for not including the third gender.
Married - Applicant who is married is represented by Y and not married is represented as N. The information regarding whether the applicant who is married is divorced or not has not been provided. So we don’t need to worry regarding all these.
Dependents - the number of people dependent on the applicant who has taken loan has been provided.
Education - It is either non -graduate or graduate. The assumption I can make is “ The probability of clearing the loan amount would be higher if the applicant is a graduate”.
Self_Employed - As the name suggests Self Employed means , he/she is employed for himself/herself only. So freelancer or having a own business might come in this category. An applicant who is self employed is represented by Y and the one who is not is represented by N.
Applicant Income - Applicant Income suggests the income by Applicant.So the general assumption that i can make would be “The one who earns more have a high probability of clearing loan amount and would be highly eligible for loan ”
Co Applicant income - this represents the income of co-applicant. I can also assume that “ If co applicant income is higher , the probability of being eligible would be higher “
Loan Amount - This amount represents the loan amount in thousands. One assumption I can make is that “ If Loan amount is higher , the probability of repaying would be lesser and vice versa”
Loan_Amount_Term - This represents the number of months required to repay the loan.
Credit_History - A credit history is a record of a borrower’s responsible repayment of debts. It suggests → 1 denotes that the credit history is good and 0 otherwise.
Property_Area - The area where they belong to is my general assumption as nothing more is told. Here it can be three types. Urban or Semi Urban or Rural
Loan_Status - If the applicant is eligible for loan it’s yes represented by Y else it’s no represented by N.
