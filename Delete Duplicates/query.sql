--showing duplicate rows
WITH test AS (SELECT *, ROW_NUMBER() OVER( PARTITION BY parcelid, 
							propertyaddress,
							saleprice, 
						 	saledate, 
						 	legalreference,
							taxdistrict, 
							owneraddress, 
						 	ownername ORDER BY uniqueid ) AS row_num
							 FROM public.nashville_housing)
 
SELECT * FROM test WHERE row_num > 1
--the duplicate with row_num > 1 will show
 

-- Delete Duplicate rows
DELETE FROM public.nashville_housing
	WHERE uniqueid IN
		(SELECT uniqueid FROM (SELECT uniqueid, ROW_NUMBER() OVER( PARTITION BY parcelid, 
						 					propertyaddress,
						 					saleprice, 
						 					saledate, 
						 					legalreference,
											taxdistrict, 
											owneraddress, 
						 					ownername ORDER BY uniqueid ) AS row_num
											  FROM public.nashville_housing) n 
 											    WHERE n.row_num > 1)
 
-- Output
-- DELETE 103

-- Query returned successfully in 286 msec.
