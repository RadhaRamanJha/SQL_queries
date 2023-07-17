/*Inferences we may not use characters in column name like &,(,%,) etc */
/* Confusion - we are able to use _ character in column name why?? */ 

/* Final portfolio apearence*/
Create Table portfolio
 (instrument varchar(20), quantity smallint(10),
  average_cost float(15,2), ltp float(15,2), current_value float(15,2),
  pl float(15,2), net_change_percentage float(5,2), days_change float(5,2));
/* Unresolved issue - I want last two columns to appear with a percentage symbol and learnt that there is no \
   percentage type character in SQL how will it do it ?????? */

/* Inserting Values anonymus */
/* failed 1st try
Inferences- 1. missed , before ('NHPC --- unnessary confusion while entering large data together
            2. inserted extra comma in TATAPOWER to incate thousand (36195) entered 36,195 making it extra value
*/
/*Succesful try finally*/
 insert into portfolio
 (instrument, quantity,average_cost , ltp, current_value,pl, net_change_percentage, days_change)
 values ('YESBANK',110,15.55,15.25,1677.50,-33.00,-1.93,0.65), ('TATAPOWER',186,143.98,194.60,36195.60,9416.50,35.16,0.34),
        ('SHEDIGCEM',471,72.44,64.40,30332.40,-3786.50,-11.10,2.37),('RELIANCE',1,2391.90,2325.50,2325.50,-66.40,-2.78,-0.27),
        ('PIDILITIND',21,2027.88,2322.25,48767.25,6181.75,14.52,-0.24),('PAYTM',6,2150.00,641.10,3846.50,-9053.40,-70.18,0.33),
        ('NHPC',2,33.55,40.25,80.50,13.40,19.95,.12);
/* use of capital letters as column header name can be confusing so avoid
   careful - donot use comma to incate thousands,lacs etc