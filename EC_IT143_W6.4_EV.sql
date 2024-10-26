/*********************************************************

NAME: EC_IT143_W6.4_perfomance
PURPOSE: Execution plan and missing index recommendations
MODIFICATION LOG:
Ver    Date                Author              Description
----- ---------- -----------
-------------------------------------------------------------------------------
1.0     10/25/2024     Edwin Velasquez         1. Built this script for EC IT143-6.4 Performance Analysis
RUNTIME:
1s
NOTES:
This is the script used for the 6.4 assignment

*********************************************************/
-- Query with Where Clause

SELECT pa.*
FROM [Person].[Address] AS pa
WHERE City = 'bothell'

-- Estimated Subtree Cost 0.217108

/*
Missing Index Details from SQLQuery37.sql - MSI.AdventureWorks2019 (MSI\ESAU (88))
The Query Processor estimates that implementing the following index could improve the query cost by 91.0545%.
*/


USE [AdventureWorks2019]
GO
CREATE NONCLUSTERED INDEX IX_my_index
ON [Person].[Address] ([City])

GO


-- Test if performance improves in terms of runtime and estimated subtree cost.

SELECT pa.*
FROM [Person].[Address] AS pa
WHERE City = 'bothell'

-- Estimated Subtree Cost 0.0305727
