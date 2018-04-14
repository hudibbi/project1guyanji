clc
clear all
%导入Excel
filename='Building_Permits.xlsx'
[data dataText dataCell]=xlsread(filename);

%%处理缺失值
%方法1:用0替换
data(isnan(data))=0;

for i=1:198901
     for j=1:43
         if isnan(dataCell{i,j})
             dataCell{i,j}='0';
         end
     end
 end



% 计算标称属性频数
Permit_Type=tabulate(data(1:end,2));
Permit_Creation_Date=tabulate(dataCell(2:end,4));
Current_Status_Date=tabulate(dataCell(2:end,15));
Filed_Date=tabulate(dataCell(2:end,16));
Issued_Date=tabulate(dataCell(2:end,17));
Completed_Date=tabulate(dataCell(2:end,18));
First_Construction_Document_Date=tabulate(dataCell(2:end,19));
Permit_Expiration_Date=tabulate(dataCell(2:end,25));
Existing_Use=tabulate(dataCell(2:end,28));
Proposed_Use=tabulate(dataCell(2:end,30));
Existing_Construction_Type_Description=tabulate(dataCell(2:end,35));
Proposed_Construction_Type_Description=tabulate(dataCell(2:end,37));
Neighborhoods_Analysis_Boundaries=tabulate(dataCell(2:end,40));
Zipcode=tabulate(data(1:end,41));

%数值属性，给出最大、最小、均值、中位数、四分位数及缺失值的个数。
%1
block=[max(data(:,5)),min(data(:,5)),mean(data(:,5)),median(data(:,5)),prctile((data(:,5)),25),prctile((data(:,5)),75)];
 blockm=0;
for i=1:198900      
    if data(i,5)==0
        blockm=blockm+1;
    end
end

%2
Number_of_Existing_Stories=[max(data(:,21)),min(data(:,21)),mean(data(:,21)),median(data(:,21)),prctile((data(:,21)),25),prctile((data(:,21)),75)];
 Number_of_Existing_Storiesm=0;
for i=1:198900      
    if data(i,21)==0
        Number_of_Existing_Storiesm=Number_of_Existing_Storiesm+1;
    end
end
3%
Number_of_Proposed_Stories=[max(data(:,22)),min(data(:,22)),mean(data(:,22)),median(data(:,22)),prctile((data(:,22)),25),prctile((data(:,22)),75)];
 Number_of_Proposed_Storiesm=0;
for i=1:198900      
    if data(i,22)==0
        Number_of_Proposed_Storiesm=Number_of_Proposed_Storiesm+1;
    end
end
4%
Estimated_Cost=[max(data(:,26)),min(data(:,26)),mean(data(:,26)),median(data(:,26)),prctile((data(:,26)),25),prctile((data(:,26)),75)];
Estimated_Costm=0;
for i=1:198900      
    if data(i,26)==0
        Estimated_Costm=Estimated_Costm+1;
    end
end
%5
Revised_Cost=[max(data(:,27)),min(data(:,27)),mean(data(:,27)),median(data(:,27)),prctile((data(:,27)),25),prctile((data(:,27)),75)];
Revised_Costm=0;
for i=1:198900      
    if data(i,27)==0
        Revised_Costm=Revised_Costm+1;
    end
end
%6
Proposed_Units=[max(data(:,31)),min(data(:,31)),mean(data(:,31)),median(data(:,31)),prctile((data(:,31)),25),prctile((data(:,31)),75)];
Proposed_Unitsm=0;
for i=1:198900      
    if data(i,31)==0
        Proposed_Unitsm=Proposed_Unitsm+1;
    end
end       
%7
Plansets=[max(data(:,32)),min(data(:,32)),mean(data(:,32)),median(data(:,32)),prctile((data(:,32)),25),prctile((data(:,32)),75)];
Plansetsm=0;
for i=1:198900      
    if data(i,32)==0
        Plansetsm=Plansetsm+1;
    end
end    
%8
Existing_Construction_Type=[max(data(:,34)),min(data(:,34)),mean(data(:,34)),median(data(:,34)),prctile((data(:,34)),25),prctile((data(:,34)),75)];
Existing_Construction_Typem=0;
for i=1:198900      
    if data(i,34)==0
        Existing_Construction_Typem=Existing_Construction_Typem+1;
    end
end    
%9
Proposed_Construction_Type=[max(data(:,36)),min(data(:,36)),mean(data(:,36)),median(data(:,36)),prctile((data(:,36)),25),prctile((data(:,36)),75)];
Proposed_Construction_Typem=0;
for i=1:198900      
    if data(i,36)==0
        Proposed_Construction_Typem=Proposed_Construction_Typem+1;
    end
end    

%10
Supervisor_District=[max(data(:,39)),min(data(:,39)),mean(data(:,39)),median(data(:,39)),prctile((data(:,39)),25),prctile((data(:,39)),75)];
Supervisor_Districtm=0;
for i=1:198900      
    if data(i,39)==0
        Supervisor_Districtm=Supervisor_Districtm+1;
    end
end    

numeric_attribute={'attribute','max','min','mean','median','25%','75%','缺失值';
    'block',block(1,1),block(1,2),block(1,3),block(1,4),block(1,5),block(1,6),blockm(1,1);
    'Number_of_Existing_Stories',Number_of_Existing_Stories(1,1),Number_of_Existing_Stories(1,2),Number_of_Existing_Stories(1,3),Number_of_Existing_Stories(1,4),Number_of_Existing_Stories(1,5),Number_of_Existing_Stories(1,6),Number_of_Existing_Storiesm(1,1);
   'Number_of_Proposed_Stories' ,Number_of_Proposed_Stories(1,1),Number_of_Proposed_Stories(1,2),Number_of_Proposed_Stories(1,3),Number_of_Proposed_Stories(1,4),Number_of_Proposed_Stories(1,5),Number_of_Proposed_Stories(1,6),Number_of_Proposed_Storiesm(1,1);
    'Estimated_Cost',Estimated_Cost(1,1),Estimated_Cost(1,2),Estimated_Cost(1,3),Estimated_Cost(1,4),Estimated_Cost(1,5),Estimated_Cost(1,6),Estimated_Costm(1,1);
    'Revised_Cost',Revised_Cost(1,1),Revised_Cost(1,2),Revised_Cost(1,3),Revised_Cost(1,4),Revised_Cost(1,5),Revised_Cost(1,6),Revised_Costm(1,1);
   'Proposed_Units',Proposed_Units(1,1),Proposed_Units(1,2),Proposed_Units(1,3),Proposed_Units(1,4),Proposed_Units(1,5),Proposed_Units(1,6),Proposed_Unitsm(1,1);
    'Plansets',Plansets(1,1),Plansets(1,2),Plansets(1,3),Plansets(1,4),Plansets(1,5),Plansets(1,6),Plansetsm(1,1);
   'Existing_Construction_Type' ,Existing_Construction_Type(1,1),Existing_Construction_Type(1,2),Existing_Construction_Type(1,3),Existing_Construction_Type(1,4),Existing_Construction_Type(1,5),Existing_Construction_Type(1,6),Existing_Construction_Typem(1,1);
    'Proposed_Construction_Type',Proposed_Construction_Type(1,1),Proposed_Construction_Type(1,2),Proposed_Construction_Type(1,3),Proposed_Construction_Type(1,4),Proposed_Construction_Type(1,5),Proposed_Construction_Type(1,6),Proposed_Construction_Typem(1,1);
   'Supervisor_District' ,Supervisor_District(1,1),Supervisor_District(1,2),Supervisor_District(1,3),Supervisor_District(1,4),Supervisor_District(1,5),Supervisor_District(1,6),Supervisor_Districtm(1,1);
    };

%绘制直方图,盒图
histfit(data(:,5));
title('block');
boxplot(data(:,5))
title('block');

hist(data(i,21));
title('Number of Existing Stories');
boxplot(data(i,21))
title('Number of Existing Stories');

histfit(data(:,22));
title('Number of Proposed Stories');
boxplot(data(:,22))
title('Number of Proposed Stories');

histfit(data(:,26));
title( 'Estimated Cost');
boxplot(data(:,26))
title( 'Estimated Cost');

histfit(data(:,27));
title('Revised Cost');
boxplot(data(:,27))
title('Revised Cost');

histfit(data(:,31));
title('Proposed Units');
boxplot(data(:,31))
title('Proposed Units');

histfit(data(:,32));
title('Plansets');
boxplot(data(:,32))
title('Plansets');

histfit(data(:,34));
title('Existing Construction Type');
boxplot(data(:,34))
title('Existing Construction Type');

histfit(data(:,36));
title('Proposed Construction Type');
boxplot(data(:,36))
title('Proposed Construction Type');

histfit(data(:,39));
title('Supervisor District');
boxplot(data(:,39))
title('Supervisor District');





