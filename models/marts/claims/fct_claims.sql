select
    claim_id,
    policy_id,
    customer_id,
    claim_amount,
    claim_date,
    claim_status,
    case 
        when claim_amount > 1000 then 'High'
        when claim_amount between 500 and 1000 then 'Medium'
        else 'Low'
    end as claim_severity
from {{ ref('stg_claims') }}
