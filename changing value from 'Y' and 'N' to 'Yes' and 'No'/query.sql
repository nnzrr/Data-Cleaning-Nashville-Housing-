SELECT DISTINCT soldasvacant, 
		            CASE soldasvacant
			              WHEN 'N' THEN 'No'
			              WHEN 'Y' THEN 'Yes'
			              ELSE soldasvacant::text
		            END soldasvacantTranformed
                  	FROM public.nashville_housing 
