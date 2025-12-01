### Title: Toronto Crime & Neighbourhood Analysis using SQL
### Author: Alpesh Chovatiya

### Problem Statement:
This project analyzes crime incidents in relation to neighbourhood characteristics. 
Two datasets were used: Crime_Data and Neighbourhood. SQL queries were developed to explore crime patterns, frequency, seasonal trends, and relationships across neighborhoods.          
The goal of this analysis is to:         
● ​Understand Toronto crime patterns by year, category, and neighbourhood.      
● Identify hotspots and high-risk neighbourhoods.         

### CRIME_DATA Dataset Overview:
This dataset contains 445784 records with following 21 columns.  

**1. ID:** Unique row identifier for Open Data database   
**2. EVENT_UNIQUE_ID:** Offence Number   
**3. REPORT_DATE:** Date Offence was Reported  
**4. OCC_DATE:** Date of Offence   
**5. REPORT_YEAR:** Year Offence was Reported   
**6. REPORT_MONTH:** Month Offence was Reported   
**7. REPORT_DAY:** Day of the Month Offence was Reported   
**8. REPORT_DOY:** Day of the Year Offence was Reported    
**9. REPORT_DOW:** Day of the Week Offence was Reported   
**10. OCC_YEAR:** Year Offence Occurred   
**11. OCC_MONTH:** Month Offence Occurred   
**12. OCC_DAY:** Day of the Month Offence Occurred   
**13. OCC_DOY:** Day of the Year Offence Occurred  
**14. OCC_DOW:** Day of the Week Offence Occurred   
**15. DIVISION:** Police Division where Offence Occurred   
**16. LOCATION_TYPE:** Location Type of Offence  
**17. PREMISES_TYPE:** Premises Type of Offence   
**18. UCR_CODE:** UCR Code for Offence   
**19. UCR_EXT:** UCR Extension for Offence   
**20. OFFENCE:** Title of Offence  
**21. HOOD_158:** Identifier of Neighbourhood using City of Toronto's new 158 neighbourhood structure  

### Dataset Overview:
This dataset contains 158 records with following 2 columns.  

**1. HOOD_158:** Identifier of Neighbourhood using City of Toronto's new 158 neighbourhood structure  
**2. NEIGHBOURHOOD_158:** Name of Neighbourhood using City of Toronto's new 158 neighbourhood structure   


### Key Findings Summary:

• Certain neighbourhoods showed consistently high crime activity.   
 (West Humber – Clairville with highest crimes followed by Moss Park, Downtown Yonge East, York University Heights, and Yonge-Bay Corridor.)    
• Assault and Theft of Motor vehicles categories were among the most common offenses.    
• Crime frequency was highest in year 2023.    
• Downtown Yonge East followed by Yonge-Bay Corridor, and Moss Park were the most common areas with most frequent Assault type offenses.   
• Apartments and commercial locations were common premises for incidents.    
